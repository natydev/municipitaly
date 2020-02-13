# frozen_string_literal: true

require 'municipitaly/zone'

RSpec.describe Municipitaly::Zone do
  let(:subject) do
    described_class.new(name: 'Centro', code: '3')
  end
  context 'has following attributes' do
    it 'name as String' do
      expect(subject.name).to be_kind_of(String)
      expect(subject.name).to eq('Centro')
    end
    it 'code as String' do
      expect(subject.code).to be_kind_of(String)
      expect(subject.code).to eq('3')
    end
  end
  context '.all' do
    it 'returns array of all zones' do
      expect(described_class.all).to be_kind_of(Array)
      expect(described_class.all.first).to be_kind_of(Municipitaly::Zone)
      expect(described_class.all.size).to eq(5)
    end
  end
  context 'regions' do
    it 'returns all regions belongs current zone' do
      expect(subject.regions).to be_kind_of(Array)
      expect(subject.regions.first).to be_kind_of(Municipitaly::Region)
      expect(subject.regions.size).to eq(4)
    end
  end
  context 'provinces' do
    it 'returns all provinces belongs current zone' do
      expect(subject.provinces).to be_kind_of(Array)
      expect(subject.provinces.first).to be_kind_of(Municipitaly::Province)
      expect(subject.provinces.size).to eq(22)
    end
  end
  context 'municipalities' do
    it 'returns all municipalities belongs current zone' do
      expect(subject.municipalities).to be_kind_of(Array)
      expect(subject.municipalities.first)
        .to be_kind_of(Municipitaly::Municipality)
      expect(subject.municipalities.size).to eq(971)
    end
  end
end
