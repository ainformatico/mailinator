require 'spec_helper'

describe Mailinator do
  describe 'configuration' do
    let(:token) { 'ABCD' }

    it 'should configure the token' do
      Mailinator.configure do |config|
        config.token = token
      end

      expect(Mailinator.config.token).to eq token
    end

    it 'should configure the token, short version' do
      Mailinator.config.token = token
      expect(Mailinator.config.token).to eq token
    end
  end
end
