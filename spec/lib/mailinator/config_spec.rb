# frozen_string_literal: true

require 'spec_helper'

describe Mailinator::Config do
  before { subject.token = token }

  context 'when success' do
    let(:token) { 'ABCD' }

    it 'assigns the token properly' do
      expect(subject.token).to eq(token)
    end
  end

  context 'when failure' do
    let(:token) { nil }

    it 'raises an error if no token is specified' do
      expect { subject.token }.to raise_error(Mailinator::TokenError)
    end
  end
end
