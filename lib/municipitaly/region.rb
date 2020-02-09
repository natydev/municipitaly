# frozen_string_literal: true

module Municipitaly
  # Define data structure for a Region
  class Region
    include DataCaller
    include ZoneDelegator

    def initialize(zone_code:, name:, istat:)
      @zone_code = zone_code
      @name = name
      @istat = istat
    end

    attr_reader :zone_code, :name, :istat

    # returns an array of all +Municipitaly::Region+ objects.
    def self.all
      data.regions
    end

    # returns an array of all +Municipitaly::Province+ objects belongs
    # to current region.
    def provinces
      @provinces ||= Search.provinces_from_region_istat(istat)
    end

    # returns an array of all +Municipitaly::Municipality+ objects belongs
    # to current region.
    def municipalities
      @municipalities ||= Search.municipalities_from_region_istat(istat)
    end
  end
end
