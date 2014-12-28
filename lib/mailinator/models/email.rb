require 'date'

module Mailinator
  module Models
    class Email < Base
      def transform_data
        {
          id: @data['data']['id'],
          body: @data['data']['parts'].first['body'],
          body_html: @data['data']['parts'][1]['body'],
          inbox_fetches_left: @data['apiInboxFetchesLeft'],
          email_fetches_left: @data['apiEmailFetchesLeft'],
          forwards_left: @data['forwardsLeft'],
          sender: @data['data']['headers']['sender'],
          from: @data['data']['from'],
          date: DateTime.parse(@data['data']['headers']['date']),
          time: @data['data']['time'],
          ip: @data['data']['ip'],
          to: @data['data']['headers']['to'],
          reply_to: @data['data']['headers']['reply-to'],
          received: @data['data']['headers']['received'],
          read?: @data['data']['been_read']
        }
      end
    end
  end
end
