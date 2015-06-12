# Libs/Gems or Ruby classes
require 'nori'
require 'rest_client'

# Overrides
require 'br_open_data/hash'

# Gem files
[:version, :hash, :parent_service].each { |lib| require "br_open_data/#{lib}" }
[:service].each { |lib| require "br_open_data/chamber/#{lib}" }
[:service].each { |lib| require "br_open_data/senate/#{lib}" }

module BROpenData
  # Your code goes here...
end
