module Mailinator
  module Models
    class Inbox < Base
      def transform_data
        {
          messages: @data['messages'].map { |entry| Entry.new(entry) }
        }
      end
    end
  end
end
