# frozen_string_literal: true

require 'csv'
require 'forwardable'

require_relative 'municipitaly/version'
require_relative 'municipitaly/data'
require_relative 'municipitaly/zone_delegator'
require_relative 'municipitaly/region_delegator'
require_relative 'municipitaly/data_caller'
require_relative 'municipitaly/zone'
require_relative 'municipitaly/region'
require_relative 'municipitaly/province'
require_relative 'municipitaly/municipality'
require_relative 'municipitaly/search'

# top level namespace
module Municipitaly
  # :nodoc:
  
  # returns a sanitized term removing everything except letters to make
  # matches less prone to errors (case insensitive and accent insensitive)
  #
  # example usage:
  #   sanitized_term = Search.sanitize_term('Forlì Cesena')
  def self.sanitize_term(term) # :doc:
    term.strip.downcase.tr('àâçèéêìòôù', 'aaceeeioou').gsub(/[^a-z]/, '')
  end
end
