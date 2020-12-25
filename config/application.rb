require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StuFru
  class Application < Rails::Application
    #fix rails server error
    if Rails.env.development?
      config.web_console.whitelisted_ips = '10.0.2.2'
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Configuration for the application, engines, and railties goes here.
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.

    #Change flash message to japanese
    config.i18n.default_locale = :ja
    #Change timezone to JST
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    #Change error messages to japanese
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    config.active_model.i18n_customize_full_message = true
  end
end
