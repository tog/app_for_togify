RAILS_GEM_VERSION = '2.1.1' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.action_controller.session = {
    :session_key => '_workshop_session',
    :secret      => '0e0f3bbd3eac27c9cd21de1b9021c97a5d152228db9bffa481eeed89921d89cd88bd72323e2fea0bc3697780b31aeb3a58bdce7b53f8c5eb9d66bd48d4f1e594'
  }
  config.active_record.observers = :user_observer
end
