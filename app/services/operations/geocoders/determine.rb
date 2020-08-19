# frozen_string_literal: true

require "csv"

module Operations
  module Geocoders
    class Determine
      DATA_PATH = File.join(Application.root, "db/data/city.csv")

      def call(city)
        return if city.nil?

        data[city]
      end

      private

      def data
        @data || load_data!
      end

      def load_data!
        @data = CSV.read(DATA_PATH, headers: true).reduce({}) do |result, row|
          city = row["city"]
          lat = row["geo_lat"].to_f
          lon = row["geo_lon"].to_f
          result[city] = { lat: lat, lon: lon }
          result
        end
      end
    end
  end
end
