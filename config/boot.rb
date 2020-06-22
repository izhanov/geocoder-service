# frozen_string_litera: true

module Boot
  extend self

  def setup
    require_app
    initialize_app
  end

  private

  def require_app
    require_file "config/application"
    require_dir "app/services"
    require_dir "app"
  end

  def initialize_app
    require_file "config/initializers/dry_schema"
    require_file "config/initializers/dry_validation"
    require_file "config/initializers/i18n"
  end

  def require_file(path)
    require File.join(root, path)
  end

  def require_dir(path)
    path = File.join(root, path)
    Dir["#{path}/**/*.rb"].sort.each { |file| require file }
  end

  def root
    File.expand_path("..", __dir__)
  end
end
