# frozen_string_literal: true

class GeoRoutes < Application
  route do |r|
    r.on "geo" do
      r.on "v1" do
        r.is "coordinates" do
          city = request.params.dig("city")
          r.post do
            operation = Operations::Geocoders::Determine.new
            result = operation.call(city)
            response.status = 201
            { coordinates: result }
          end
        end
      end
    end
  end
end
