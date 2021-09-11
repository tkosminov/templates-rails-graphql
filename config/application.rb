require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module ReportsApi
  class Application < Rails::Application
    config.load_defaults 6.1

    config.api_only = true

    config.time_zone = 'UTC'
    config.active_record.default_timezone = :utc

    config.active_record.schema_format = :sql

    config.middleware.insert(0, Rack::UTF8Sanitizer)

    config.middleware.insert_before(0, Rack::Cors) do
      allow do
        origins '*'
        resource '*', headers: :any, methods: %i[get post options]
      end
    end

    config.middleware.use(Rack::Attack)

    BCrypt::Engine.cost = 10

    db_yml = Rails.root.join('config', 'database.yml')
    db_yml_example = Rails.root.join('config', 'database.yml.example')
    if !File.exist?(db_yml) && File.exist?(db_yml_example)
      FileUtils.cp(db_yml_example, db_yml)
    end
  end
end
