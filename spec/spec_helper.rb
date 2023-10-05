require 'bundler/setup'
require 'dotenv/load'
require 'byebug'

Bundler.setup

require 'cloud_waba/client' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here
end