require 'singleton'

module BROpenData
  class ParentService
    include Singleton

    # Base URL builder Attributes
    attr_accessor :path
    attr_accessor :domain

    # API attrs
    attr_accessor :params

    # init/new
    def initialize
    end

    private
      # Build an URL base on the end_point & it path
      def url
        "http://#{self.domain}/#{self.path}"
      end

      # Build an GET URL base on the end_point & it path
      def get_url
        "http://#{self.domain}/#{self.path}#{self.params.it_keys_to_get_param}"
      end

      # send GET HTTP request
      def get_request(hash=true)
        resp = RestClient.get get_url
        hash ? Hash.from_xml(resp).it_keys_to_sym : resp
      end

      # Validate & perform the request
      def perform_get_request
        # Validate preventing request error

        # setup params, like API Key if needed

        # Perform the request
        get_request
      end
  end
end