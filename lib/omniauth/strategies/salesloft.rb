require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class SalesLoft < OmniAuth::Strategies::OAuth2
      option :name, :salesloft

      option :client_options, {
        :site => "https://accounts.salesloft.com",
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        raw_info
      end

      def raw_info
        @raw_info ||= access_token.get("https://sdr.salesloft.com/api/v1/me.json").parsed
      end
    end
  end
end
