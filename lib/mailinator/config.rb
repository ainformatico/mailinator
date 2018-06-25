module Mailinator
  class TokenError < StandardError; end

  class Config
    attr_accessor :token

    def token
      fail TokenError, 'Please provide a token' if @token.nil?
      @token
    end
  end
end
