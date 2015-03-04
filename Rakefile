require_relative 'config/environment.rb'

namespace :db do

  desc "Migrate the db"
  task :migrate do
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.migrate("db/migrations/")
  end

  desc "drop and recreate the db"
  task :reset => [:drop, :migrate]

  desc "drop the db"

  task :drop do
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.down("db/migrations", 0)
  end

end