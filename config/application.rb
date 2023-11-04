require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleAdminApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      if html_tag =~ /^<label/
        "<div class='field_with_errors'>#{html_tag}</div>".html_safe
      else
        attribute = instance.instance_values['method_name']
        error_msg = ''

        instance.object.errors.messages[attribute.to_sym].each do |msg|
          error_msg += "<p>#{attribute.humanize} #{msg}</p>"
        end

        "<div class='field_with_errors'>#{html_tag} #{error_msg}</div>".html_safe
      end
    end
  end
end
