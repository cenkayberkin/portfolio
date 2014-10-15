CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["ACCESS_KEY_ID"] ,
    aws_secret_access_key: ENV["ACCESS_KEY_SECRET"]
  }
  config.fog_directory = ENV["S3_BUCKET"]
end

