require 'hashie'

module Mailinator
  module Models
    class Base < Hashie::Mash
      def initialize(data)
        @data = data
        super(transform_data)
      end

      def original
        @data
      end

      def transform_data
        @data
      end
    end
  end
end
