# frozen_string_literal: true

module Mailinator
  class Email
    class << self
      def get(id)
        api = Api.new
        data = api.get('email', msgid: id)
        populate(data)
      end

      def delete(id)
        api = Api.new
        api.get('delete', msgid: id)
      end

      private

      def populate(data)
        Mailinator::Models::Email.new(data)
      end
    end
  end
end
