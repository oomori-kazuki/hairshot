require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws' 
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['ap-northeast-1'], 
      :aws_access_key_id     => ENV['AKIAQACFOZZR77JYN36N'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['rails-avatar1']
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } 
  end

  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end