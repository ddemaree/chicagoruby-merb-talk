require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Demoapp
  class Application < Rails::Application
    config.action_view.javascript_expansions[:defaults] = %w()

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]
    
    config.before_initialize do
      # We need to tell merb controllers where their views will be so that
      # merb's template caching works. This must be done early on so that
      # when the controllers are eager loaded they have the right path.
      Merb.push_path(:view, "#{config.root}/app/views")
    end
    
    config.after_initialize do
      # Start the Merb application.
      Merb.start_environment(:environment => Rails.env.to_s)
    end
  end
end
