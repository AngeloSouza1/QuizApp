require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QuizApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Configuration for the application, engines, and railties goes here.
    config.time_zone = 'America/Sao_Paulo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :pt

    # Add any custom paths to autoload_paths here
    # config.autoload_paths += %W(#{config.root}/lib)

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_paths -= %W(#{config.root}/lib/assets #{config.root}/lib/tasks)
  end
end
