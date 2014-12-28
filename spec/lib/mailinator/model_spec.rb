require 'spec_helper'

describe Mailinator::Models::Base do

  let(:data) { {custom: :custom} }

  it 'should #transform_data with defaults' do
    class CustomModel < Mailinator::Models::Base; end

    klass = CustomModel.new(data)

    expect(klass).to be_a(Mailinator::Models::Base)
    expect(klass.custom).to eq(data[:custom])
    expect(klass.original).to eq(data)
  end

  it 'should #transform_data' do
    class CustomModel < Mailinator::Models::Base
      def transform_data
        {
          custom: @data[:custom]
        }
      end
    end

    klass = CustomModel.new(data)

    expect(klass).to be_a(Mailinator::Models::Base)
    expect(klass.custom).to eq(data[:custom])
    expect(klass.original).to eq(data)
  end
end
