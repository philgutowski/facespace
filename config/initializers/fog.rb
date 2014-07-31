CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJYTN7BVSYVGCT4VA',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'us-east-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'facespace-images'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
