I created a Ruby CLI that gets data from the Spotify API.

## In order to use this app
Please get an API Key and Client ID from Github and create a .env file with the following keys:
```
SPOTIFY_CLIENT_ID=[YOUR CLIENT ID HERE]
SPOTIFY_KEY = [YOUR CLIENT KEY HERE]
```
To get the key, you must visit https://developer.spotify.com/dashboard/applications and click create an app. 

After you've created the .env file, and input the ID and private key, the `environment.rb` file pulls that data by calling `RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_KEY"])`. The data in your .env file was stored as a hash. 

This app relies heavily on the RSpotify gem. Additional information is located here: https://github.com/guilhermesad/rspotify

Run `bundle install` in the command line to install all the gems. 

Run the app with `ruby environment.rb`


## Deliverables
The purpose of this app is to grab information about artists and tracks/songs from Spotify's platform. It initializes a search, and returns details about the query, links you to Spotify's site depending on the query, and is able to save query options into arrays.  