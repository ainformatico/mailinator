require 'mailinator/model'
require 'mailinator/models/email'
require 'mailinator/models/entry'
require 'mailinator/models/inbox'
require 'mailinator/api'
require 'mailinator/email'
require 'mailinator/inbox'
require 'mailinator/config'
require 'mailinator/version'

module Mailinator
  class << self
    attr_writer :config

    def configure
      yield(config)
    end

    def config
      @config ||= Config.new
    end
  end
end
