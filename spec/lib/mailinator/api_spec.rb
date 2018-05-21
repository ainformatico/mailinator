require 'spec_helper'

describe Mailinator::Api do
  let(:token) { 'ABCD' }

  before do
    Mailinator.configure do |config|
      config.token = token
    end
  end

  it 'should raise when document not found' do
    api = Mailinator::Api.new
    expect { api.get('not-found') }.to raise_error(Mailinator::Api::NotFound)
  end

  it 'should raise when an error occurred' do
    api = Mailinator::Api.new
    expect { api.get('error') }.to raise_error(Mailinator::Api::RequestError)
  end

  it 'should GET' do
    api = Mailinator::Api.new
    params = { custom: :custom, token: token }
    url = 'url'
    uri = URI("#{api.send(:base_url)}/#{url}")
    uri.query = URI.encode_www_form(params.merge(params))
    response = double(:response, code: '200', body: { id: 1 }.to_json)

    expect(api)
      .to receive(:get)
      .with(url, params)
      .and_call_original

    expect(api)
      .to receive(:perform_request)
        .with(uri) { response }

    api.get(url, params)
  end
end
