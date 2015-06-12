# Libs/Gems or Ruby classes
require 'rest_client'

# Overrides
require 'br_open_data/hash'

# Gem files
[:version, :senate_service, :chamber_service].each { |lib| require "br_open_data/#{lib}" }

module BROpenData
  # Your code goes here...
end
