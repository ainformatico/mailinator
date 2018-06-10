# frozen_string_literal: true

require 'spec_helper'

describe Mailinator::Inbox do
  let(:inbox) { Mailinator::Inbox.get('abcd1234') }

  before do
    Mailinator.configure do |config|
      config.token = 'ABCD'
    end
  end

  it 'should get an inbox' do
    expect(inbox.messages).to be_a(Array)
    expect(inbox.original).to be_a(Hash)
    expect(inbox.messages.first).to include(id: '1419696967-44152505-recipient')
    expect(inbox.messages.last).to include(id: '1419710848-46252175-recipient')
  end

  it 'should #download an email' do
    expect(inbox.messages.first.download).to be_a(Mailinator::Models::Email)
    expect(inbox.messages.first.download).to eq(Mailinator::Email.get(inbox.messages.first.id))
    inbox.messages.first.download do |message|
      expect(message).to eq(Mailinator::Email.get(inbox.messages.first.id))
    end
  end

  it 'should #delete an email' do
    expect(inbox.messages.first.delete).to eq('status' => 'ok')
  end
end
