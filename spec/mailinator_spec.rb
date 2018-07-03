# frozen_string_literal: true

require 'spec_helper'

describe Mailinator do
  subject { described_class }

  describe 'configuration' do
    let(:token) { 'ABCD' }

    context 'when using a block' do
      before do
        subject.configure do |config|
          config.token = token
        end
      end

      it 'configures the token' do
        expect(subject.config.token).to eq token
      end
    end

    context 'when using the short version' do
      before { subject.config.token = token }

      it 'configures the token, short version' do
        expect(subject.config.token).to eq token
      end
    end
  end
end
