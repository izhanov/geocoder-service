# frozen_string_literal: true

require "securerandom"
require "json"

module AdsService
  module RpcApi
    def update_coordinates(id, coordinates)
      payload = JSON.generate({ id: id, **coordinates })
      publish(payload, type: "update_coordinates")
    end
  end
end
