CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    # aws_access_key_id: ENV["ACCESS_KEY_ID"] ,
    aws_access_key_id: "123" ,
    # aws_secret_access_key: ENV["ACCESS_KEY_SECRET"]
    aws_secret_access_key: "2333"
  }
  # config.fog_directory = ENV["S3_BUCKET"]
  config.fog_directory = "2222"

end

