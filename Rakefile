#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails3Associations::Application.load_tasks

require 'active_record'
require 'yaml'

desc 'Load fixtures for more'
task fixtures: :connect do
  ps = Part.all
  as = Assembly.all
  as[0].parts = [ps[0], ps[1], ps[2]]
  as[1].parts = [       ps[1]       ]
  as[2].parts = [       ps[1], ps[2]]
end

desc 'Show db'
task show: :connect do

  p_a = []
  puts '------- assembly \ part -------'
  head = "\t|"
  Part.all.each { |p| head += "#{p.name}\t|" }
  p_a << head
  Assembly.all.each { |a|
    row = "#{a.name}\t| "
    unless a.parts
      row += "\t|" * Part.count
    else
      parts = a.parts
      Part.all.each { |p|
        cell = parts.index(p) ? "  *\t|" : "\t|"
        row += cell
      }
    end
    p_a << row
  }
  puts p_a.join("\n")

  a_p = []
  puts '------- part \ assembly -------'
  head = "\t|"
  Assembly.all.each { |a| head += "#{a.name}\t|" }
  a_p << head
  Part.all.each { |p|
    row = "#{p.name}\t| "
    if p.assemblies
      assemblies = p.assemblies
      Assembly.all.each { |a|
        cell = assemblies.index(a) ? "  *\t|" : "\t|"
        row += cell
      }
    else
      row += "\t|" * Assembly.count
    end
    a_p << row
  }
  puts a_p.join("\n")
end

task connect: :environment do
  config = ActiveRecord::Base.configurations
  ActiveRecord::Base.establish_connection(config)
end

task :environment do
  db_config_path = File.join(File.dirname(File.expand_path(__FILE__)), 'config', 'database.yml')
  db_config = YAML.load_file(db_config_path)
  env = ENV['RAILS_ENV']
  env ||= 'development'
  ActiveRecord::Base.configurations = db_config[env]
end
