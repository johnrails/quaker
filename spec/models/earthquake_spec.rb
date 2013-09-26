require 'spec_helper'

describe Earthquake do
  context "#set_coordinate" do
    it "should raise an error" do
      q = Earthquake.new
      c = [-12.3,172]
      expect {q.set_coordinate(c)}.to raise_error
    end

    it 'should set_coordinate' do
      q = Earthquake.new
      c = [-12.3,172, 32]
      q.set_coordinate(c)
      expect(q.coordinate.depth).to eq(32)
    end
  end

  context '#set_sources' do
    let(:sources) {',ci,mt,bv'}
    let(:empty_sources) {','}
    let(:quake) { Earthquake.new  }
    it 'should not be empty' do
      quake.set_sources sources
      expect(quake.sources.empty?).to be_false
    end

    it "should have correct sources" do
      quake.set_sources sources
      expect( quake.sources.map { |e| e.code }.join(',')).to eq(sources)
    end

    it "should be empty" do
      quake.set_sources empty_sources
      expect(quake.sources.empty?).to be_true
    end
  end

  context '#set_types' do
    let(:types) {',quake-watch,sonic-boom,bourn-identity'}
    let(:empty_types) {','}
    let(:quake) { Earthquake.new  }
    it 'should not be empty' do
      quake.set_types types
      expect(quake.product_types.empty?).to be_false
    end

    it "should have correct sources" do
      quake.set_types types
      expect( quake.product_types.map { |e| e.name }.join(',')).to eq(types)
    end

    it "should be empty" do
      quake.set_types empty_types
      expect(quake.product_types.empty?).to be_true
    end
  end
end
