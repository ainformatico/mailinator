# frozen_string_literal: true

require 'mailinator'
require 'coveralls'

Coveralls.wear!

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.color = true
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.before(:suite) do
    FakeWeb.allow_net_connect = false
  end

  config.after(:suite) do
    FakeWeb.allow_net_connect = true
  end
end
