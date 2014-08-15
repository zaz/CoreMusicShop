require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module CoreMusicShop
  class Application < Rails::Application
    config.cache_store = :file_store, Rails.root.join('tmp', 'cache', 'pages')
    config.active_record.observers = :index_sweeper

    config.lograge.enabled = true
    config.lograge.formatter = ->(data) {
      "%s %s %s %s#%s %sms (%s+%s) %s" % [
        data[:method], data[:path], data[:format], data[:controller],
        data[:action], data[:duration], data[:view], data[:db], data[:status]
      ]
    }
  end
end
