

# Allow non-ascii letters in uploaded filenames
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\s\.\-\+]/
 require 'carrierwave/orm/activerecord'
require 'fog/aws'

	CarrierWave.configure do |config|
	    config.fog_provider = 'fog/aws'
	    config.fog_credentials = {
	    provider:              'AWS',                        # required
	    aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],                        # required
	    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],                        # required
	    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
	    host:                  's3-website.ap-northeast-2.amazonaws.com',             # optional, defaults to nil
	    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
	  }
	  config.fog_directory  = 'likelion-seoultech'                          # required
	  config.fog_public     = false                                        # optional, defaults to true
	  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
	end