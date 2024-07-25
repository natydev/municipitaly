# frozen_string_literal: true

module Municipitaly2
  # Define data structure for a Region
  class Region
    include DataCaller
    include ZoneDelegator

    def initialize(zone_code:, name:, istat:, partial_iso3166:)
      @zone_code = zone_code
      @name = name
      @istat = istat
      @partial_iso3166 = partial_iso3166
    end

    attr_reader :zone_code, :name, :istat, :partial_iso3166

    # returns an array of all +Municipitaly2::Region+ objects.
    def self.all
      data.regions
    end

    # returns an array of all +Municipitaly2::Province+ objects belongs
    # to current region.
    def provinces
      @provinces ||= Search.provinces_from_region_istat(istat)
    end

    # returns an array of all +Municipitaly2::Municipality+ objects belongs
    # to current region.
    def municipalities
      @municipalities ||= Search.municipalities_from_region_istat(istat)
    end

    # returns ISO 3166-2 code for current province.
    def iso3166_2
      "IT-#{partial_iso3166}"
    end

    alias iso3166 iso3166_2
  end
end
