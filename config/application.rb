# frozen_string_literal: true

class Application
  include Dry::Monads[:result]

  class << self
    attr_accessor :logger

    def root
      File.expand_path("..", __dir__)
    end

    def environment
      ENV.fetch("RACK_ENV").to_sym
    end
  end
end
