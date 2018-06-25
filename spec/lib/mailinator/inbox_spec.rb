# frozen_string_literal: true

require 'spec_helper'

describe Mailinator::Inbox do
  let(:inbox) { described_class.get('abcd1234') }

  before do
    Mailinator.configure do |config|
      config.token = 'ABCD'
    end
  end

  describe '#get' do
    let(:first_expected_id) { '1419696967-44152505-recipient' }
    let(:second_expected_id) { '1419710848-46252175-recipient' }

    it 'fetches the inbox' do
      expect(inbox.messages).to be_a(Array)
      expect(inbox.original).to be_a(Hash)
      expect(inbox.messages.first).to include(id: first_expected_id)
      expect(inbox.messages.last).to include(id: second_expected_id)
    end
  end

  describe '#download' do
    it 'downloads an email' do
      expect(inbox.messages.first.download).to be_a(Mailinator::Models::Email)
      expect(inbox.messages.first.download)
        .to eq(Mailinator::Email.get(inbox.messages.first.id))

      inbox.messages.first.download do |message|
        expect(message).to eq(Mailinator::Email.get(inbox.messages.first.id))
      end
    end
  end

  describe '#delete' do
    it 'deletes an email' do
      expect(inbox.messages.first.delete).to eq('status' => 'ok')
    end
  end
end
