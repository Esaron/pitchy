CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['DO_KEY'],
    :aws_secret_access_key  => ENV['DO_SECRET'],
    :region                 => ENV['DO_REGION'],
    :endpoint               => 'sfo3.digitaloceanspaces.com'
  }
  config.fog_directory  = ENV['DO_BUCKET']
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  config.fog_public = true
  config.asset_host = 'sfo3.digitaloceanspaces.com'
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
end
