require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_provider = 'fog/aws' 
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:AKIAQACFOZZR77JYN36N],
      aws_secret_access_key: Rails.application.credentials.aws[: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],
      region: 'ap-northeast-1' 
    }
    
    config.fog_directory = 'rails-avatar1'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/rails-avatar1'
  end

  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end