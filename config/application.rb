require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TodoApplication
  class Application < Rails::Application
    config.load_defaults 7.2

    config.autoload_lib(ignore: %w[assets tasks])

    config.active_record.yaml_column_permitted_classes = [Symbol, Date, Time]
  end
end
