ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rails-controller-testing'
Rails::Controller::Testing.install


class ActiveSupport::TestCase

  fixtures :all

end