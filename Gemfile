# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby "2.7.0"

gem "bunny", "~> 2.15.0"
gem "dotenv", "~> 2.7.5"
gem "dry-monads", "~> 1.3.5"
gem "dry-validation", "~> 1.5.1"
gem "fast_jsonapi", "~> 1.5"
gem "i18n"
gem "ougai", "~> 1.8.5"
gem "rake", "~> 13.0.1"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
end

group :test do
  gem "factory_bot", "~> 5.2.0"
  gem "faker", git: "https://github.com/stympy/faker.git"
  gem "rack-test", "~> 1.1.0"
  gem "rspec"
end
