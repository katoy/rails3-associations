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

  ps = Part2.all
  xs = Xassembly.all
  xs[0].part2s = [ps[0], ps[1], ps[2]]
  xs[1].part2s = [       ps[1]       ]
  xs[2].part2s = [       ps[1], ps[2]]

  ys = Yassembly.all
  ys[0].part2s = [                   ]
  ys[1].part2s = [ps[0],        ps[2]]
  ys[2].part2s = [ps[0]              ]  
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

  p_a = []
  puts '------- Xassembly \ part2 -------'
  head = "\t|"
  Part2.all.each { |p| head += "#{p.name}|" }
  p_a << head
  Xassembly.all.each { |a|
    row = "#{a.name}\t| "
    unless a.part2s
      row += "\t|" * Part.count
    else
      part2s = a.part2s
      Part2.all.each { |p|
        cell = part2s.index(p) ? "  *\t|" : "\t|"
        row += cell
      }
    end
    p_a << row
  }
  puts p_a.join("\n")

  p_a = []
  puts '------- Yassembly \ part2 -------'
  head = "\t|"
  Part2.all.each { |p| head += "#{p.name}|" }
  p_a << head
  Yassembly.all.each { |a|
    row = "#{a.name}\t| "
    unless a.part2s
      row += "\t|" * Part.count
    else
      part2s = a.part2s
      Part2.all.each { |p|
        cell = part2s.index(p) ? "  *\t|" : "\t|"
        row += cell
      }
    end
    p_a << row
  }
  puts p_a.join("\n")

  p_a = []
  puts '------- part2 \ Assembly -------'
  head = "\t|Assemblies"
  p_a << head
  Part2.all.each { |p|
    row = "#{p.name}\t| "
    unless p.subscriptions
      row += "\t|"
    else
      p.subscriptions.each { |s|
        row += "#{s.attendee_type}:#{s.attendee.name}, "
      }
    end
    p_a << row
  }
  puts p_a.join("\n")
end

desc 'Show db using table_print'
task table_print: :connect do
  tp Assembly.includes(:parts), "name", "parts.name"
  puts
  tp Xassembly.includes(:part2s), "name", "part2s.name"
  puts
  tp Yassembly.includes(:part2s), "name", "part2s.name"
  puts
  tp Part2.includes(:subscriptions), "name", "subscriptions.attendee_type", "subscriptions.attendee.name"
  puts
  tp Subscription.all
end

task connect: :environment do
  config = ActiveRecord::Base.configurations
  ActiveRecord::Base.establish_connection(config)
end

namespace :mail do
  desc 'fixuters for xmail, ymail, address'
  task :fixtures => :conect do
  end
  desc ''
  desc 'show for xmail, ymail, address'
  task :show  => :connect do
  end
end

task :environment do
  db_config_path = File.join(File.dirname(File.expand_path(__FILE__)), 'config', 'database.yml')
  db_config = YAML.load_file(db_config_path)
  env = ENV['RAILS_ENV']
  env ||= 'development'
  ActiveRecord::Base.configurations = db_config[env]
end
