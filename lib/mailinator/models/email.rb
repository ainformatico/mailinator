require 'date'

module Mailinator
  module Models
    class Email < Base
      def transform_data
        {
          from_full: @data['data']['fromfull'],
          date: DateTime.parse(@data['data']['headers']['date']),
          received: @data['data']['headers']['received'],
          from: @data['data']['headers']['from'],
          to: @data['data']['headers']['to'],
          subject: @data['data']['subject'],
          request_id: @data['data']['requestId'],
          body: @data['data']['parts'].first['body'],
          base_64: @data['data']['parts'].last['body'],
          orig_from: @data['data']['origfrom'],
          id: @data['data']['id'],
          time: @data['data']['time'],
          seconds_ago: @data['data']['seconds_ago'],
        }
      end
    end
  end
end
