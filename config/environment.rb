require "bundler/setup"
require 'active_record'

Bundler.require
require 'yaml'
require 'pry'
Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

RAKE_APP ||= begin
  app = Rake.application
  app.init
  app.load_rakefile
  app
end
