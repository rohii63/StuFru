require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StuFru
  class Application < Rails::Application
    #fix rails server error
    unless Rails.env.production?
      config.web_console.whitelisted_ips = '10.0.2.2'
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    #Change flash message to japanese
    config.i18n.default_locale = :ja
    #Change timezone to JST
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    #Change error messages to japanese
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
  end
end
