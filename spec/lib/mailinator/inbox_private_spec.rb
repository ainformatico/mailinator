require 'spec_helper'

describe Mailinator::Inbox do
  let(:inbox_private) {
    Mailinator::Inbox.get('abcd1234', private_domain: true)
  }

  before do
    Mailinator.configure do |config|
      config.token = 'ABCD'
    end
  end

  it 'should get an private domain inbox' do
    expect(inbox_private.messages).to be_a(Array)
    expect(inbox_private.original).to be_a(Hash)
    expect(inbox_private.messages.first).to \
      include(id: '1419696967-44152505-recipient')
    expect(inbox_private.messages.last).to \
      include(id: '1556696970-44152699-recipient')
  end

  it 'should #download a private domain email' do
    expect(inbox_private.messages.first.download(private_domain: true)).to \
      be_a(Mailinator::Models::Email)
    expect(inbox_private.messages.first.download(private_domain: true)).to \
      eq(Mailinator::Email.get(inbox_private.messages.first.id))
    inbox_private.messages.first.download do |message|
      expect(message).to \
        eq(Mailinator::Email.get(inbox_private.messages.first.id))
    end
  end

  it 'should #delete a private domain email' do
    expect(inbox_private.messages.first.delete).to eq('status' => 'ok')
  end
end
