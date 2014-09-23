require 'pry'
require 'fileutils'

namespace :greetings do
  desc "prints thank you"
  task :thank_you do
    puts "Why, thank you!"
  end
end

desc "prints Awesome"
task :default do
  puts "You are awesome"
end

desc "greets person"
task :greet_person, [:name] do |cmd, args|
  puts "Hello! #{args[:name]}"
end


namespace :cake do

  desc "Bake a Cake"
  task :bake => [:mix_up, :go_to_store] do
    puts "Cake is baked"
  end

  task :mix_up => [:add_flower, :add_eggs] do
    puts "Mix up ingredients"
  end

  task :add_flower => :get_flower do
    puts "Adding flower"
  end

  task :add_eggs => :go_to_store do
    puts "Adding Eggs"
  end

  task :get_flower => :go_to_store do
    puts "Get Flower"
  end


  task :go_to_store do
    puts "Go to Store"
  end

  desc "things I can't spell"
  task :learn_how_to_spell, [:word] do |cmd, args|
    puts "need to learn how to spell, #{args[:word]}"
  end
end

namespace :dozer do
  desc "print ENV"
  task :env do
    # executed in bash shell
    sh("ENV")
  end

  desc "print PWD"
  task :pwd do
    sh("pwd")
    system("pwd")
  end

  desc "adds views for a resource"
  task :make_views, [:resource] do |cmd, args|
    # adds views for index, show, edit, new
    sh("mkdir views/#{args[:resource]}")
    sh("touch views/#{args[:resource]}/index.erb")
    FileUtils.touch("views/#{args[:resource]}/show.erb")
    touch("views/#{args[:resource]}/edit.erb")
    touch("views/#{args[:resource]}/new.erb")
  end
end

namespace :db do
  desc "creates a db"
  task :create, [:dbname] do |cmd, args|
    sh("createdb #{args[:dbname]}")
  end

  desc "drop a db"
  task :drop, [:dbname] do |cmd, args|
    sh("dropdb #{args[:dbname]}")
  end

  desc "seed my db"
  task :seed, [:env] do |cmd, args|
    # default environment
    env = args[:env] || "development"
    # loadup my sinatra environment
    # then populate my db
    # calls rake environment[env]
    Rake::Task['environment'].invoke(env)
    require './db/seeds'
  end
end

namespace :bundler do
  task :setup do
    require 'rubygems'
    require 'bundler'
  end
end

task :environment, [:env] => 'bundler:setup' do |cmd, args|
  ENV["RACK_ENV"] = args[:env] || "development"
  Bundler.require(:default, ENV["RACK_ENV"])
  require "./config/boot"
end
