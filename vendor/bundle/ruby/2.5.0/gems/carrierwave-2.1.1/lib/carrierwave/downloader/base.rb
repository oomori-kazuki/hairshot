require 'open-uri'
require 'ssrf_filter'
require 'addressable'
require 'carrierwave/downloader/remote_file'

module CarrierWave
  module Downloader
    class Base
      attr_reader :uploader

      def initialize(uploader)
        @uploader = uploader
      end

      ##
      # Downloads a file from given URL and returns a RemoteFile.
      #
      # === Parameters
      #
      # [url (String)] The URL where the remote file is stored
      # [remote_headers (Hash)] Request headers
      #
      def download(url, remote_headers = {})
        headers = remote_headers.
          reverse_merge('User-Agent' => "CarrierWave/#{CarrierWave::VERSION}")
        uri = process_uri(url.to_s)
        begin
          if skip_ssrf_protection?(uri)
            response = OpenURI.open_uri(process_uri(url.to_s), headers)
          else
            request = nil
            response = SsrfFilter.get(uri, headers: headers) do |req|
              request = req
            end
            response.uri = request.uri
            response.value
          end
        rescue StandardError => e
          raise CarrierWave::DownloadError, "could not download file: #{e.message}"
        end
        CarrierWave::Downloader::RemoteFile.new(response)
      end

      ##
      # Processes the given URL by parsing and escaping it. Public to allow overriding.
      #
      # === Parameters
      #
      # [url (String)] The URL where the remote file is stored
      #
      def process_uri(uri)
        uri_parts = uri.split('?')
        encoded_uri = Addressable::URI.parse(uri_parts.shift).normalize.to_s
        encoded_uri << '?' << Addressable::URI.encode(uri_parts.join('?')).gsub('%5B', '[').gsub('%5D', ']') if uri_parts.any?
        URI.parse(encoded_uri)
      rescue URI::InvalidURIError, Addressable::URI::InvalidURIError
        raise CarrierWave::DownloadError, "couldn't parse URL: #{uri}"
      end

      ##
      # If this returns true, SSRF protection will be bypassed.
      # You can override this if you want to allow accessing specific local URIs that are not SSRF exploitable.
      #
      # === Parameters
      #
      # [uri (URI)] The URI where the remote file is stored
      #
      # === Examples
      #
      #     class CarrierWave::Downloader::CustomDownloader < CarrierWave::Downloader::Base
      #       def skip_ssrf_protection?(uri)
      #         uri.hostname == 'localhost' && uri.port == 80
      #       end
      #     end
      #
      #     my_uploader.downloader = CarrierWave::Downloader::CustomDownloader
      #
      def skip_ssrf_protection?(uri)
        false
      end
    end
  end
end
