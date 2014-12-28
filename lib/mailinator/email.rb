module Mailinator
  class Email
    class << self
      def get(id)
        api = Api.new
        data = api.get('email', msgid: id)
        populate(data)
      end

      private

      def populate(data)
        Mailinator::Models::Email.new(data)
      end
    end
  end
end
