CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "22" ,
    aws_secret_access_key: "22"
  }
  config.fog_directory = "2"
end

