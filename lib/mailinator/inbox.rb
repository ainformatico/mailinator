module Mailinator
  class Inbox
    class << self
      def get(to, opts={})
        api = Api.new
        params = opts.merge(to: to)
        data = api.get('inbox', params)
        populate(data)
      end

      private

      def populate(data)
        Mailinator::Models::Inbox.new(data)
      end
    end
  end
end
