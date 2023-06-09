require 'simplecov'
# require 'webmock/rspec'
require 'capybara/rspec'
# WebMock.disable_net_connect!(allow_localhost: false)
SimpleCov.start do
  add_filter '/spec'
  add_filter '/config'
  add_group "Helpers", "app/helpers/"
  add_group "Configs", "config/"
  add_group "Specs", "spec/"
  add_group 'Requests', '/app/controllers/api'
  add_group 'Models', '/app/models'
  add_group 'Helpers', '/app/helpers'
  add_group 'Channels', '/app/channels'
  add_group 'Services', '/app/services'
  add_group 'Serializers', '/app/serializers'
  add_group 'Policies', '/app/policies'
  add_group 'Uploaders', '/app/uploaders'
end
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.before(:each, type: :system) do
  end  
end
