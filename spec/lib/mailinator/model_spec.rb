# frozen_string_literal: true

require 'spec_helper'

describe Mailinator::Models::Base do
  let(:data) { { custom: :custom } }

  describe '#transform_data ' do
    let(:klass) { CustomModel.new(data) }

    context 'when default class' do
      class CustomModel < Mailinator::Models::Base; end

      it 'merges data with defaults' do
        expect(klass).to be_a(Mailinator::Models::Base)
        expect(klass.custom).to eq(data[:custom])
        expect(klass.original).to eq(data)
      end
    end

    context 'when custom class' do
      it 'defines methods out of a hash' do
        class CustomModel < Mailinator::Models::Base
          def transform_data
            {
              foo: @data[:custom]
            }
          end
        end

        expect(klass).to be_a(Mailinator::Models::Base)
        expect(klass.foo).to eq(data[:custom])
        expect(klass.original).to eq(data)
      end
    end
  end
end
