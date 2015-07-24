require 'rspec'
require 'rack/test'

require_relative '../lib/init'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
