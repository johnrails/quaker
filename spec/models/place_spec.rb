require 'spec_helper'

describe Place do
  context 'in_us' do
    let!(:us){ State.create(state_full: 'California', state_abbrev: "Ca", state_long: "State of California", country_abbrev: "US",  country_name: "United States")}
    let(:place){ Place.create(name:'California')}

    it 'should be in the US' do
      place.update_attribute(:is_us, Place.is_us?(us.state_full))
      expect(place.is_us?).to eq(true)
    end
  end
end
