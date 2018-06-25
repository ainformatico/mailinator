module Mailinator
  module Models
    class Entry < Base
      def download
        email = Mailinator::Email.get(id)
        if block_given?
          yield email
        else
          email
        end
      end

      def delete
        Mailinator::Email.delete(id)
      end
    end
  end
end
