class SearchItem
    attr_accessor :prompt
    @@followed_artists = []
    
    def initialize
        puts "Welcome to Raquel's Spotify CLI"
        @prompt = TTY::Prompt.new
      
    end

    def select
        input = @prompt.select("What would you like to look up?", %w(Artist Track))

        if input == "Artist"
            artist_lookup
            
        else  
            answer = prompt.ask("Please type in which track you would like to search.", required: true)do |q|
            q.modify :strip, :collapse
          end
            track_input = Track.new(answer) 
            track_search = track_input.search
            track_search.collect  do |track| 
                track.artists.select {|object| object.match(/\A @name=/)}
                binding.pry
            end
            puts "Here are the artists we came up with that have that song name: #{}"
             
        end
    end


    def artist_lookup
        answer =  prompt.ask("Please type in which artist you would like to search.", required: true) do |q|
            q.modify :strip, :collapse
          end
            
            artist_object = Artist.new(answer)
            artist_search_object = artist_object.search
            puts "Artist's Name : #{artist_search_object.name}"
            puts "-----------"
            puts "Artist's genre(s) : #{artist_search_object.genres.join(', ')}"
            puts "-----------"
            puts "Artist's Spotify link : #{artist_search_object.external_urls["spotify"]}"
            puts "-----------"
           prompt_yes_or_no = prompt.yes?("Is this what you were looking for?")
            
           if prompt_yes_or_no
                multi_selector = prompt.select("What would you like to do next?", ["Follow the artist", "See top tracks", "See albums", "Similar artists"])
                   
                case multi_selector
                    when "Follow the artist"
                        @@followed_artists << artist_object
                    when "See top tracks"
                        artist_search_object.top_tracks(:US) #HOW DO I PULL ALL THE NAMES OF HER TOP TRACKS?
                        binding.pry
                    when "See albums" 
                        artist_search_object.albums
                    end
                    
            else
                puts "Try your search again."
                select
            end
    
    end
    
end