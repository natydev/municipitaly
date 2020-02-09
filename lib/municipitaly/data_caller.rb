# frozen_string_literal: true

module Municipitaly
  # shared module to use Municipitaly::Data instance
  module DataCaller
    def self.included(base)
      base.send :extend, ClassMethods
    end

    # class methods
    module ClassMethods
      def data
        Data.new
      end
    end

    private

    def data
      @data ||= Data.new
    end
  end
end
