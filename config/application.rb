require File.expand_path('../boot', __FILE__)

ENV['RAILS_ENV'] = 'production'

require "active_record/railtie"

if defined?(Bundler)
  Bundler.require(:default, Rails.env)
end

module RoundThreeDataLoader
  class Application < Rails::Application
    config.time_zone = 'Eastern Time (US & Canada)'
    config.encoding = "utf-8"
  end
end
