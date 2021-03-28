I created a Ruby CLI that gets data from the Spotify API.



## In order to use this app
Please get an API Key and Client ID from Github and create a .env file with the following keys:
```
SPOTIFY_CLIENT_ID=[YOUR CLIENT ID HERE]
SPOTIFY_KEY = [YOUR CLIENT KEY HERE]
```
To get the key, you must visit https://developer.spotify.com/dashboard/applications and click create an app. 

After you've created the .env file, and input the ID and private key, the `environment.rb` file pulls that data by calling `RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_KEY"])`. The data in your .env file was stored as a hash. 

