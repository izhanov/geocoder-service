# frozen_string_literal: true

RSpec.describe GeoRoutes, type: :routes do
  describe "POST /geo/coordinates" do
    context "when params are missing" do
      it "returns coordinates null" do
        post "/geo/v1/coordinates"

        expect(response.status).to eq(201)
        expect(response.body).to include(coordinates: nil)
      end
    end
  end
end
