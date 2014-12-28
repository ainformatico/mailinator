require 'net/http'
require 'json'

module Mailinator

  class Api
    class NotFound < StandardError; end
    class RequestError < StandardError; end

    def get(url, params = {})
      response = request(url, params)
      handle_response(response)
    end

    def token
      Mailinator.config.token
    end

    private

    def request(url, params)
      uri = generate_url(url)
      uri.query = generate_params(params)
      perform_request(uri)
    end

    def perform_request(uri)
      Net::HTTP.get_response(uri)
    end

    def generate_url(url)
      URI("#{base_url}/#{url}")
    end

    def generate_params(params)
      URI.encode_www_form(params.merge({token: token}))
    end

    def base_url
      'https://api.mailinator.com/api'
    end

    def handle_response(response)
      case response.code.to_i
        when 200
          JSON.parse(response.body)
        when 404
          fail NotFound
        else
          fail RequestError, {status: response.message, code: response.code}
      end
    end
  end
end
