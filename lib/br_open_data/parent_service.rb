# Module which the classes are about the currency market
module FOREX
  module JsonRates
    # A client which retrieve currency values, in real-time & historical
    class CurrencyService
      # DesignPatterns
      include Singleton

      # URL builder
      attr_accessor :path
      attr_accessor :end_point

      # API attrs
      attr_accessor :params
      attr_accessor :json_rates_key

      # Logic to be performed on init it
      def initialize
        self.end_point = 'jsonrates.com'
        self.json_rates_key = 'jr-7579cb1e9e3b6143fc08bb5df2db75ad'
      end

      # Doc: http://jsonrates.com/docs/locale/
      # params = {:base, :from, :to} ==> Must use the Currency (EUR, BRL, USD...)
      def rates(params = {})
        self.path = 'get'
        perform_get_request params
      end

      # Doc: http://jsonrates.com/docs/locale/
      # params = {:base, :from, :to} ==> Must use the Locale (pt_BR, en_US, pt_PT...)
      def locale_conversion(params = {})
        self.path = 'locale'
        perform_get_request params
      end

      # Doc: http://jsonrates.com/docs/conversion/
      # params = {:base, :from, :to} ==> Must use the Currency (EUR, BRL, USD...)
      def currency_conversion(params = {})
        self.path = 'convert'
        perform_get_request params
      end

      private
        # Build an URL base on the end_point & it path
        def url
          "http://#{self.end_point}/#{self.path}"
        end

        # Build an GET URL base on the end_point & it path
        def get_url
          "http://#{self.end_point}/#{self.path}#{self.params.it_keys_to_get_param}"
        end

        # Validate & perform the request
        def perform_get_request(params = {})
          # Prevent HTTP request if missing any param
          error_msg = 'When (from,to) does not exist, (base) must exist at least. And those 3 can\'t be filled at the same time'
          return {error:error_msg} if locale_params_match? params[:base], params[:from], params[:to]

          # setup params as request
          setup_api_key_to(params)

          # Perform the request
          get_request
        end

        # Validate locale params role
        def locale_params_match?(base, from, to)
          # Or just Base or both FROM + TO must be filled
          base.nil? && (from.nil? || to.nil?) || (!base.nil? && !from.nil? && !to.nil?)
        end

        # send GET HTTP request
        def get_request(json=true)
          resp = RestClient.get get_url
          json ? to_num(JSON.parse(resp.body).it_keys_to_sym) : resp
        end

        # Add the LogIn APIKey to the params
        def setup_api_key_to(params)
          params[:apiKey] = self.json_rates_key
          self.params = params
        end

        # return values as numeric if come as String
        def to_num(hash)
          if hash[:rate]
            hash[:rate]=hash[:rate].to_f
          elsif hash[:rates]
            hash[:rates].keys.each do |key|
              rate = hash[key]
              hash[:rates][key] = rate.to_f
            end
          end

          hash
        end
    end
  end
end