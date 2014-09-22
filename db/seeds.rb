# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# require libs
# require 'rubyzip'
require 'sequel'
require 'yaml'

# connect to db
DB = Sequel.connect("postgres://localhost/dvr_development")

# require models (important to do this after connecting to the DB, remember!)
Dir["../models/*.rb"].each {|file| require file }

# get raw stations data
raw_stations = YAML.load File.read('../data/stations.yaml')

Station.unrestrict_primary_key # we are setting the KEY here, so you have to call this

Station.dataset.destroy # clean it out!

# iterate and insert
raw_stations.each do |raw_station|
  Station.create(
    id:           raw_station[:channel_id].to_i,
    name:         raw_station[:name],
    channel:      raw_station[:number],
    cable:        raw_station[:cable],
    subscription: raw_station[:subscription]
  )
end

# now we have to do the rest of the datasets!
