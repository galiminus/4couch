require 'spec_helper'

describe PlacesController do
  describe "get index" do
    before {
      3.times { Fabricate(:place) }
    }

    it "should allow to get places summaries" do
      get :index, format: :json
      places = JSON.parse(response.body)

      places.size.should == 3
      places.first.keys.sort.should == ['id', 'latitude', 'longitude']
    end
  end
end
