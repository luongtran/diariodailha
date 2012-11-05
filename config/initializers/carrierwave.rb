CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "AKIAJWKQ6EARFYAXWBVQ",
    aws_secret_access_key: "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",
    region: "sa-east-1"
  }
  config.fog_directory = "diariodailhabucket"
  config.fog_authenticated_url_expiration = 600 # 10 minutes

end