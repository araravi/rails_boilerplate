require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBoilerplate
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:9000', 'production.shiip.io'
        resource '*', :headers => :any, :methods => [:get, :post, :options, :delete, :put, :patch], :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client']
      end
    end
  end
end
