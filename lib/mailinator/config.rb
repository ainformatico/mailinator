# frozen_string_literal: true

module Mailinator
  class TokenError < StandardError; end

  class Config
    attr_accessor :token

    def token
      raise TokenError, 'Please provide a token' if @token.nil?

      @token
    end
  end
end
