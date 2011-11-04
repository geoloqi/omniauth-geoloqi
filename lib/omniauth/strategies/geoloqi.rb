require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Geoloqi < OmniAuth::Strategies::OAuth2
      option :name, "geoloqi"

      option :client_options, {
        :site => 'https://api.geoloqi.com',
        :authorize_url => 'https://geoloqi.com/oauth/authorize',
        :token_url => 'https://api.geoloqi.com/1/oauth/token'
      }
      
      option :access_token_options, {
        :header_format => 'OAuth %s',
        :param_name => 'access_token'
      }
      
      uid { access_token.params['user_id'] }

      info do
        {
          :display_name => access_token.params['display_name'],
          :username => access_token.params['username'],
          :user_id => access_token.params['user_id'],
          :is_anonymous => access_token.params['is_anonymous']
        }
      end

      credentials do
        {
          'expires' => access_token.expires?,
          'expires_at' => access_token.expires_at
        }
      end

      def build_access_token
        super.tap do |token|
          token.options.merge!(access_token_options)
        end
      end

      def access_token_options
        options.access_token_options.inject({}) { |h,(k,v)| h[k.to_sym] = v; h }
      end
      
      def authorize_params
        super.tap do |params|
          params.merge!(:display => request.params['display']) if request.params['display']
        end
      end

#      def raw_info
#        access_token.options[:mode] = :query
#        @raw_info ||= access_token.get('/1/account/profile').parsed
#      end
    end
  end
end

OmniAuth.config.add_camelization 'geoloqi', 'Geoloqi'