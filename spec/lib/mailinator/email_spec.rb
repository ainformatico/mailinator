# frozen_string_literal: true

require 'spec_helper'

describe Mailinator::Email do
  subject { described_class }

  before do
    Mailinator.configure do |config|
      config.token = 'ABCD'
    end
  end

  describe '#get' do
    context 'when full email' do
      let(:body) { 'This is a body' }
      let(:message) { subject.get('abcd1234') }

      it 'gets the email' do
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
        expect(message.received)
          .to match(a_string_matching('from 127-0-0-1.dynamic-ip.example.net'))
        expect(message.date).to be_a(DateTime)
        expect(message.time).to eq(1_419_696_967_076)
        expect(message.forwards_left).to eq(10)
        expect(message.original).to be_a(Hash)
      end
    end

    context 'when no #body_html' do
      let(:body) { 'This is a body' }
      let(:message) { subject.get('abcd1234plain') }

      it 'returns nil for #body_html when no html body' do
        expect(message.body).to eq(body)
        expect(message.body_html).to_not be
      end
    end
  end

  describe '#delete' do
    let(:response) { subject.delete('abcd1234') }

    it 'deletes an email' do
      expect(response).to eq('status' => 'ok')
    end
  end
end
