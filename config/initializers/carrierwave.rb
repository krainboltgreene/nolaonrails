CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET'],
  }
  config.fog_directory = [ENV['AWS_UPLOADS_BUCKET'], Rails.env].join('-')
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
