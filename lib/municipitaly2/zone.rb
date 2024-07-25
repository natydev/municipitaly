# frozen_string_literal: true

module Municipitaly2
  # Define data structure for a Zone
  class Zone
    include DataCaller

    def initialize(name:, code:)
      @name = name
      @code = code
    end

    attr_reader :name, :code

    # returns an array of all +Municipitaly2::Zone+ objects.
    def self.all
      data.zones
    end

    # returns an array of all +Municipitaly2::Region+ objects belongs to
    # current zone.
    def regions
      Search.regions_from_zone_code(code)
    end

    # returns an array of all +Municipitaly2::Province+ objects belongs
    # to current zone.
    def provinces
      @provinces ||= Search.provinces_from_zone_code(code)
    end

    # returns an array of all +Municipitaly2::Municipality+ objects belongs
    # to current zone.
    def municipalities
      @municipalities ||= Search.municipalities_from_zone_code(code)
    end
  end
end
