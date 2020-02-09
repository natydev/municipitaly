# frozen_string_literal: true

require 'municipitaly/zone'

RSpec.describe Municipitaly::Data do
  context 'zones' do
    it 'is an array' do
      expect(described_class.new.zones).to be_kind_of(Array)
    end
    it 'contains all Municipitaly::Zone objects' do
      expect(described_class.new.zones.first).to be_kind_of(Municipitaly::Zone)
      expect(described_class.new.zones.last).to be_kind_of(Municipitaly::Zone)
    end
  end
  context 'regions' do
    it 'is an array' do
      expect(described_class.new.regions).to be_kind_of(Array)
    end
    it 'contains all Municipitaly::Region objects' do
      expect(described_class.new.regions.first)
        .to be_kind_of(Municipitaly::Region)
      expect(described_class.new.regions.last)
        .to be_kind_of(Municipitaly::Region)
    end
  end
  context 'provinces' do
    it 'is an array' do
      expect(described_class.new.provinces).to be_kind_of(Array)
    end
    it 'contains all Municipitaly::Province objects' do
      expect(described_class.new.provinces.first)
        .to be_kind_of(Municipitaly::Province)
      expect(described_class.new.provinces.last)
        .to be_kind_of(Municipitaly::Province)
    end
  end
  context 'municipalities' do
    it 'is an array' do
      expect(described_class.new.municipalities).to be_kind_of(Array)
    end
    it 'contains all Municipitaly::Municipality objects' do
      expect(described_class.new.municipalities.first)
        .to be_kind_of(Municipitaly::Municipality)
      expect(described_class.new.municipalities.last)
        .to be_kind_of(Municipitaly::Municipality)
    end
  end
end
