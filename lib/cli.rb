class SearchItem
    attr_accessor :prompt, :artist_object
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
      track_lookup
    end
  end


  def artist_actions
    multi_selector = @prompt.select("What would you like to do next?", ["Follow the artist", "See top tracks", "See albums", "Similar artists"])
           
    case multi_selector

      when "Follow the artist"
        @@followed_artists << @artist_object
      when "See top tracks"
        artist_search_object.top_tracks(:US) #HOW DO I PULL ALL THE NAMES OF HER TOP TRACKS?
      when "See albums" 
        artist_search_object.albums
    end
  end


  def artist_lookup
    answer =  prompt.ask("Please type in which artist you would like to search.", required: true) do |q|
      q.modify :strip, :collapse
    end

      @artist_object = Artist.new(answer)
      artist_search_object = artist_object.search
      puts "Artist's Name : #{artist_search_object.name}"
      puts "-----------"
      puts "Artist's genre(s) : #{artist_search_object.genres.join(', ')}"
      puts "-----------"
      puts "Artist's Spotify link : #{artist_search_object.external_urls["spotify"]}"
      puts "-----------"

      prompt_yes_or_no = prompt.yes?("Is this what you were looking for?")
            
    if prompt_yes_or_no
      artist_actions   
    else
      puts "Try your search again."
      select
    end
    
  end


  def track_lookup
    answer = prompt.ask("Please type in which track you would like to search.", required: true)do |q|
        q.modify :strip, :collapse
    end
    track_input = Track.new(answer) 
    track_search = track_input.search
       
    array_of_artists = track_search.collect  do |track| 
      track_artists = track.artists.collect {|object| object.name}
    
    end
        
    puts "Here's the artist(s) that were found with that song name: \n \n" 

    artist_array_with_num = array_of_artists.uniq.each_with_index do |artist, index| 
      number = index + 1
      puts "#{number}:#{artist.join(", ")}"
    end
        
    prompt_yes_or_no = prompt.yes?("Do you want to find out more information about an artist?")  
        
    if prompt_yes_or_no
       input= prompt.enum_select("Select the artist ", array_of_artists.uniq)
       @artist_object = Artist.new(input)
       artist_search_object = artist_object.search  
       puts "Click the link here for their Spotify page : " + artist_search_object.external_urls["spotify"]
        
    else
         exit_app
    end
  end
    

end