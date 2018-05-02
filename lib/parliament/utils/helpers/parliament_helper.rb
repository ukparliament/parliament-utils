require 'parliament'
require 'parliament/ntriple'

module Parliament
  module Utils
    module Helpers
      module ParliamentHelper
        def self.parliament_request(request_number: 1)
          headers = {'Ocp-Apim-Subscription-Key' => ENV['PARLIAMENT_AUTH_TOKEN'] }
          headers['Request-Id'] = "#{ENV['ApplicationInsights.request.id']}#{request_number}" if ENV['ApplicationInsights.request.id']

          Parliament::Request::UrlRequest.new(
            builder:    Parliament::Builder::NTripleResponseBuilder,
            headers:    headers,
            decorators: Parliament::Grom::Decorator
          )
        end

        def parliament_request(request_number: 1)
          Parliament::Utils::Helpers::ParliamentHelper.parliament_request(request_number)
        end
      end
    end
  end
end
