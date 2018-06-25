module Mailinator
  class Email
    class << self
      def get(id, opts = {})
        api = Api.new
        params = opts.merge(msgid: id)
        data = api.get('email', params)
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
