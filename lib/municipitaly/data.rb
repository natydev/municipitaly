# frozen_string_literal: true

module Municipitaly
  # Define collection
  class Data
    @@zones = []
    @@regions = []
    @@provinces = []
    @@municipalities = []

    def zones
      if @@zones.empty?
        CSV.foreach(find_csv('zones.csv'), headers: true) do |row|
          @@zones << Zone.new(name: row[0], code: row[1])
        end
      end
      @@zones
    end

    def regions
      if @@regions.empty?
        CSV.foreach(find_csv('regions.csv'), headers: true) do |row|
          @@regions << Region.new(zone_code: row[0], name: row[1],
                                  istat: row[2], partial_iso3166: row[3])
        end
      end
      @@regions
    end

    def provinces
      if @@provinces.empty?
        CSV.foreach(find_csv('provinces.csv'), headers: true) do |row|
          @@provinces << Province.new(region_istat: row[0], name: row[1],
                                      istat: row[2], acronym: row[3])
        end
      end
      @@provinces
    end

    def municipalities
      if @@municipalities.empty?
        CSV.foreach(find_csv('municipalities.csv'), headers: true) do |row|
          @@municipalities <<
            Municipality.new(province_istat: row[0],
                             name: row[1], partial_istat: row[2],
                             cadastrial_code: row[3], postal_codes: row[4],
                             population: row[5], area: row[6],
                             latitude: row[7], longitude: row[8])
        end
      end
      @@municipalities
    end

    def find_csv(file)
      File.expand_path(File.join(File.dirname(__FILE__),
                                 "../../vendor/data/#{file}"))
    end
  end
end
