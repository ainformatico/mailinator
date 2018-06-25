# frozen_string_literal: true

require 'spec_helper'

describe Mailinator::Api do
  let(:token) { 'ABCD' }

  before do
    Mailinator.configure do |config|
      config.token = token
    end
  end

  context 'when success' do
    let(:params) { { custom: :custom, token: token } }
    let(:url) { 'url' }
    let(:response) { double(:response, code: '200', body: { id: 1 }.to_json) }

    let(:uri) do
      uri = URI("#{subject.send(:base_url)}/#{url}")
      uri.query = URI.encode_www_form(params.merge(params))

      uri
    end

    before do
      expect(subject)
        .to receive(:perform_request)
        .with(uri)
        .and_return(response)
    end

    it 'GET' do
      subject.get(url, params)
    end
  end

  context 'when failure' do
    it 'raises error when the document is not found' do
      expect { subject.get('not-found') }
        .to raise_error(described_class::NotFound)
    end

    it 'raises error when an error occurred' do
      expect { subject.get('error') }
        .to raise_error(described_class::RequestError)
    end
  end
end
