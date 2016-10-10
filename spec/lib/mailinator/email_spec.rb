require 'spec_helper'

describe Mailinator::Email do
  before do
    Mailinator.configure do |config|
      config.token = 'ABCD'
    end
  end

  it 'should get an email' do
    body = 'This is a body'
    message = Mailinator::Email.get('abcd1234')
    expect(message.id).to eq('1419696967-44152505-recipient')
    expect(message.subject).to eq('This is a subject')
    expect(message.body).to eq(body)
    expect(message.body_html).to include("<p>#{body}</p>")
    expect(message.read?).to_not be
    expect(message.inbox_fetches_left).to eq(696)
    expect(message.email_fetches_left).to eq(10)
    expect(message.sender).to eq('example@example.net')
    expect(message.reply_to).to eq('example@example.net')
    expect(message.from).to eq('Sender')
    expect(message.ip).to eq('127.0.0.1')
    expect(message.received).to match(a_string_matching('from 127-0-0-1.dynamic-ip.example.net'))
    expect(message.date).to be_a(DateTime)
    expect(message.time).to eq(1419696967076)
    expect(message.forwards_left).to eq(10)
    expect(message.original).to be_a(Hash)
  end

  it 'should return nil for #body_html when no html body' do
    body = 'This is a body'
    message = Mailinator::Email.get('abcd1234plain')
    expect(message.body).to eq(body)
    expect(message.body_html).to_not be
  end

  describe '#delete' do
    it 'deletes an email' do
      response = Mailinator::Email.delete('abcd1234')
      expect(response).to eq({'status' => 'ok'})
    end
  end
end
