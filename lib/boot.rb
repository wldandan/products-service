project_root = File.dirname(__FILE__) + '/..'
$LOAD_PATH << "#{project_root}/app"
require 'grape'
require 'api'
require "#{project_root}/app/project_root"

Dir["#{ProductsService.project_root}/app/**/*.rb"].each { |file| require file }


