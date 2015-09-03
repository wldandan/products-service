require_relative 'lib/boot'

run Rack::Cascade.new [API]

version = begin
  File.open('APP_VERSION', &:readline).chomp
rescue
  'unknown'
end
