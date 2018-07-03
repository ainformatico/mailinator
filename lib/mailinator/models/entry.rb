# frozen_string_literal: true

module Mailinator
  module Models
    class Entry < Base
      def download(opts = {})
        email = Mailinator::Email.get(id, opts)
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
