# frozen_string_literal: true

module Municipitaly2
  # shared module to delegate Region istance and its methods
  module RegionDelegator
    extend Forwardable

    def_delegator :region, :name, :region_name
    def_delegator :region, :zone_code, :zone_code

    def region
      @region ||= Search.region_from_istat(region_istat)
    end
  end
end
