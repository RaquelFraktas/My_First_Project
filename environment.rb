#this requires all the files so they can talk to each other
#this file needs to be read first before any of the required files get put into use
require 'bundler'
Bundler.require #loads all the gems from gemfile
Dotenv.load  


RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_KEY"])

require_relative './lib/cli'
require_relative './lib/track'
require_relative './lib/artist'


SearchItem.new.select
