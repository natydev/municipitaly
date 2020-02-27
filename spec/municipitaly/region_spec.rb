# frozen_string_literal: true

require 'municipitaly/region'

RSpec.describe Municipitaly::Region do
  let(:subject) do
    described_class.new(zone_code: '4', name: 'Molise', istat: '14',
                        partial_iso3166: '67')
  end
  context 'has following attributes' do
    it 'zone_code as String' do
      expect(subject.zone_code).to be_kind_of(String)
      expect(subject.zone_code).to eq('4')
    end
    it 'name as String' do
      expect(subject.name).to be_kind_of(String)
      expect(subject.name).to eq('Molise')
    end
    it 'istat as String' do
      expect(subject.istat).to be_kind_of(String)
      expect(subject.istat).to eq('14')
    end
    it 'iso3166_2' do
      expect(subject.iso3166_2).to be_kind_of(String)
      expect(subject.iso3166_2).to eq('IT-67')
    end
    it 'alias iso3166 to iso3166_2' do
      expect(subject.iso3166).to be_kind_of(String)
      expect(subject.iso3166).to eq('IT-67')
    end
  end
  context '.all' do
    it 'returns array of all regions' do
      expect(described_class.all).to be_kind_of(Array)
      expect(described_class.all.first).to be_kind_of(Municipitaly::Region)
      expect(described_class.all.size).to eq(20)
    end
  end
  context 'provinces' do
    it 'returns all provinces belongs current region' do
      expect(subject.provinces).to be_kind_of(Array)
      expect(subject.provinces.first).to be_kind_of(Municipitaly::Province)
      expect(subject.provinces.size).to eq(2)
    end
  end
  context 'municipalities' do
    it 'returns all municipalities belongs current region' do
      expect(subject.municipalities).to be_kind_of(Array)
      expect(subject.municipalities.first)
        .to be_kind_of(Municipitaly::Municipality)
      expect(subject.municipalities.size).to eq(136)
    end
  end
  context 'zone' do
    it 'return the belongs zone' do
      expect(subject.zone)
        .to be_kind_of(Municipitaly::Zone)
      expect(subject.zone.name)
        .to eq('Sud')
    end
  end
  context 'zone_name' do
    it 'delegate to zone#name' do
      expect(subject.zone_name)
        .to eq('Sud')
    end
  end
end
