class SearchItem
    attr_accessor :prompt
    
    def initialize
        puts "Welcome to Raquel's Spotify CLI"
        @prompt = TTY::Prompt.new
      
    end

    def select
        input = @prompt.select("What would you like to look up?", %w(Artist Track))
        binding.pry

        if input == "Artist"
            prompt.ask("Please type in which artist you would like to search.", value: input)
            Artist.new(input)
        else  
            prompt.ask("Please type in which track you would like to search.", value: input)
            Track.new(input)

            # puts "Please type in which track you would like to search."
            # track_search = gets.strip
        end
    
    end
    # binding.pry
end