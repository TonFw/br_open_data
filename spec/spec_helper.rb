require 'bundler/setup'
require 'rest_client'
require './spec/helpers'

Bundler.setup

require 'simplecov'
SimpleCov.start do
end

# and any other gems you need
require 'br_open_data'
require 'faker'

RSpec.configure do |c|
  # some (optional) config here
  c.include Helpers
end