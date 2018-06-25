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
        message = Mailinator::Email.get('abcd1234')
        expect(message.from_full).to eq('example@example.net')
        expect(message.date).to be_a(DateTime)
        expect(message.received)
        .to include('from bmta1.example.com([9.9.9.9]) by mail.mailinator.com with SMTP (Postfix) for receipient@example.com; Fri, 11 May 2018 20:55:36 +0000 (UTC)')
        expect(message.from).to eq('Sender <sender@example.com>')
        expect(message.to).to eq('<recipient@mailinator.com>')
        expect(message.subject).to eq('This is a Subject')
        expect(message.request_id).to eq('638363')
        expect(message.body).to include('<p>This is a body</p>')
        expect(message.body_base_64).to include('This is a BASE64 body JVBERi0xLjUKJe')
        expect(message.orig_from).to eq('Sender <sender@example.com>')
        expect(message.id).to eq('1419696967-44152505-recipient')
        expect(message.time).to eq(1_526_072_140_000)
        expect(message.seconds_ago).to eq(15_258)
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
      response = Mailinator::Email.delete('abcd1234')
      expect(response).to eq('status' => 'ok')
    end
  end
end
