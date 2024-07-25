# frozen_string_literal: true

require 'municipitaly2/zone'

RSpec.describe Municipitaly2::Data do
  context 'zones' do
    it 'is an array' do
      expect(described_class.new.zones).to be_kind_of(Array)
    end
    it 'contains all Municipitaly2::Zone objects' do
      expect(described_class.new.zones.first).to be_kind_of(Municipitaly2::Zone)
      expect(described_class.new.zones.last).to be_kind_of(Municipitaly2::Zone)
    end
  end
  context 'regions' do
    it 'is an array' do
      expect(described_class.new.regions).to be_kind_of(Array)
    end
    it 'contains all Municipitaly2::Region objects' do
      expect(described_class.new.regions.first)
        .to be_kind_of(Municipitaly2::Region)
      expect(described_class.new.regions.last)
        .to be_kind_of(Municipitaly2::Region)
    end
  end
  context 'provinces' do
    it 'is an array' do
      expect(described_class.new.provinces).to be_kind_of(Array)
    end
    it 'contains all Municipitaly2::Province objects' do
      expect(described_class.new.provinces.first)
        .to be_kind_of(Municipitaly2::Province)
      expect(described_class.new.provinces.last)
        .to be_kind_of(Municipitaly2::Province)
    end
  end
  context 'municipalities' do
    it 'is an array' do
      expect(described_class.new.municipalities).to be_kind_of(Array)
    end
    it 'contains all Municipitaly2::Municipality objects' do
      expect(described_class.new.municipalities.first)
        .to be_kind_of(Municipitaly2::Municipality)
      expect(described_class.new.municipalities.last)
        .to be_kind_of(Municipitaly2::Municipality)
    end
  end
end
