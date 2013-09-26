require 'spec_helper'

describe QuakesController do

  describe "GET 'quake'" do
    it "returns http success" do
      get 'quake'
      response.should be_success
    end
  end

end
