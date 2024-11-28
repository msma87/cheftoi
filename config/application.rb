require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

mmodule ChefToi
class Application < Rails::Application
  config.action_controller.raise_on_missing_callback_actions = false if Rails.version >= "7.1.0"
  config.generators do |generate|
    generate.assets false
    generate.helper false
    generate.test_framework :test_unit, fixture: false
  end

  config.load_defaults 7.1
  config.i18n.default_locale = :'pt-BR'
  config.time_zone = 'Brasilia'
  config.autoload_lib(ignore: %w(assets tasks))
end
end CopyRetryClaude does not have the ability to run the code it generates yet.
