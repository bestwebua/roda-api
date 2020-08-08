# frozen_string_literal: true

require 'rom/sql/rake_task'
require_relative './config/system/loader'

namespace :db do
  database_url = ENV['DATABASE_URL']
  # rake db:create_migration[create_users]
  # rake db:migrate
  # rake db:clean
  # rake db:reset
  task(:setup) { ROM.container(ROM::Configuration.new(:sql, database_url)) }

  # rake db:create RACK_ENV=test
  # rake db:drop RACK_ENV=test
  %i[create drop].each do |task_name|
    task(task_name) { system "#{task_name}db #{database_url[/(.+)\/(.+)\z/, 2]}" }
  end
end
