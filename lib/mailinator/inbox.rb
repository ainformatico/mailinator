# frozen_string_literal: true

module Mailinator
  class Inbox
    class << self
      def get(to)
        api = Api.new
        data = api.get('inbox', to: to)
        populate(data)
      end

      private

      def populate(data)
        Mailinator::Models::Inbox.new(data)
      end
    end
  end
end
