class SearchItem
    attr_accessor :prompt
    
    def initialize
        puts "Welcome to Raquel's Spotify CLI"
        @prompt = TTY::Prompt.new
      
    end

    def select
        input = @prompt.select("What would you like to look up?", %w(Artist Track))

        if input == "Artist"
            artist_lookup
            
        else  
            prompt.ask("Please type in which track you would like to search.", value: input)
            Track.new(input)
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
            prompt.multi_select("Select drinks?", ["Follow the artist", "See top tracks", "See albums" ])

            else
                puts "Try your search again."
            end
    
    end
    
end