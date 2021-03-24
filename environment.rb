#this requires all the files so they can talk to each other
#this file needs to be read first before any of the required files get put into use
require 'bundler'
Bundler.require #loads all the gems from gemfile
Dotenv.load  #does this need to be here or gemfile?
#require 'net/http' put this somewhere else


RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_KEY"])

require_relative './lib/cli'
require_relative './lib/track'
require_relative './lib/artist'


SearchItem.new.select

# require_relative './lib/api'
# puts ENV["SPOTIFY_KEY"]
# puts ENV["SPOTIFY_CLIENT_ID"]
# binding.pry