require './initialization.rb'
require_rel 'tasks'
namespace :db do
  desc "migrate your database"
  task :migrate do
    require 'bundler'
    Bundler.require
    ActiveRecord::Migrator.migrate('./db/migrations')
  end
end
