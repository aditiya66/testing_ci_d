require 'simplecov'
SimpleCov.start 'rails'

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'support/factory_bot'
require 'shoulda/matchers'
require 'faker'
require "rspec-sidekiq"

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include ActionCable::TestHelper
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.include Warden::Test::Helpers
  config.filter_rails_from_backtrace!
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  ActiveJob::Base.queue_adapter = :test
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end