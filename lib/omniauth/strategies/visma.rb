require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Visma < OmniAuth::Strategies::OAuth2
      AUTH_URLS = {
        :sandbox => {
            site: "https://eaccountingapi-sandbox.test.vismaonline.com/v2/",
            authorize_url: "https://identity-sandbox.test.vismaonline.com/connect/authorize",
            token_url: "https://identity-sandbox.test.vismaonline.com/connect/token"
          },
        :production => {
            site: "https://eaccountingapi.vismaonline.com/v2/",
            authorize_url: "https://identity.vismaonline.com/connect/authorize",
            token_url: "https://identity.vismaonline.com/connect/token"
          }
      }
      option :name, "visma"
      option :client_options, AUTH_URLS[:production]
      option :environment, :production

      def initialize(*args)
        super(*args)
        update_default_environment_urls
      end

      info do
        {
          :name => raw_info['Name'],
          :email => raw_info['Email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      credentials do
        hash = {'token' => access_token.token}
        hash.merge!('refresh_token' => access_token.refresh_token) if access_token.refresh_token
        hash.merge!('expires_at' => access_token.expires_at ) if access_token.expires?
        hash.merge!('expires' => access_token.expires?)
        hash
      end

      def raw_info
        @raw_info ||= access_token.get('/v2/companysettings').parsed
      end

      def change_environment
        update_default_environment_urls
      end

      private

      def update_default_environment_urls
        case options.environment
        when :sandbox
          options.client_options = options.client_options.merge( AUTH_URLS[options.environment] )
        end
      end

      def callback_url
        full_host + script_name + callback_path
      end

    end

  end
end