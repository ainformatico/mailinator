# frozen_string_literal: true

require 'spec_helper'

describe Mailinator::Config do
  it 'should assign the token propery' do
    token = 'ABCD'
    config = subject
    config.token = token
    expect(config.token).to eq(token)
  end

  it 'should raise an error if no token specified' do
    expect { subject.token }.to raise_error(Mailinator::TokenError)
  end
end
