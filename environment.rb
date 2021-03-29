require 'bundler'
Bundler.require #loads all the gems from gemfile
Dotenv.load  


RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_KEY"])

require_relative './lib/cli'
require_relative './lib/track'
require_relative './lib/artist'


SearchItem.new
