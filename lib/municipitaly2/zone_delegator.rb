# frozen_string_literal: true

module Municipitaly2
  # shared module to delegate Zone istance and its methods
  module ZoneDelegator
    extend Forwardable

    def_delegator :zone, :name, :zone_name

    def zone
      @zone ||= Search.zone_from_code(zone_code)
    end
  end
end
