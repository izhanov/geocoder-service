# frozen_string_literal: true

ENV["RACK_ENV"] ||= "development"

require "bundler/setup"
Bundler.require(:default, ENV["RACK_ENV"])

require "dotenv"
Dotenv.load(".env", ".env.#{ENV["RACK_ENV"]}")


require_relative "boot"
Boot.setup
