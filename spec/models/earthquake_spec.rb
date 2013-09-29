require 'spec_helper'

describe Earthquake do
  let(:quake) { Earthquake.new  }

  context "#parse_location" do
    it 'should return a hash of location attributes' do
      place = "79km NNW of Road Town, British Virgin Islands"
      expect(quake.parse_place(place)).to eq("British Virgin Islands")
    end
  end

  context '#set_sources' do
    let(:sources) {',ci,mt,bv'}
    let(:empty_sources) {','}
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

  context "#is_us?" do
    let(:not_state) {'Rome'}
    let!(:state){State.create(state_full: 'California', state_abbrev: "Ca", state_long: "State of California", country_abbrev: "US",  country_name: "United States")}

    it 'should be true' do
      expect(quake.is_us?(state.state_full)).to eq(true)
    end

    it 'should ignore case' do
      expect(quake.is_us?(state.state_full.downcase)).to eq(true)
    end

    it 'should be false' do
      expect(quake.is_us?(not_state)).to eq(false)
    end
  end

  context '#set_places' do
    let(:place){Place.create(name:"California",is_us: true)}
    it "should set the place" do
      quake.set_place(place.name)
        expect(quake.place_id).to eq(place.id)
    end
  end
end
