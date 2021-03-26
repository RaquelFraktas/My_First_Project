class SearchItem
    attr_accessor :prompt, :artist_object, :track_input
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
  

  def artist_lookup
    answer =  prompt.ask("Please type in which artist you would like to search.", required: true) {|q| q.modify :strip, :collapse}
      create_artist_and_search(answer)
      puts "\n"
      puts "Artist's Name : #{@artist_search_object.name}"
      puts "Artist's genre(s) : #{@artist_search_object.genres.join(', ')}"
      puts "Artist's Spotify link : #{@artist_search_object.external_urls["spotify"]}"
    
      prompt_yes_or_no = prompt.yes?("Is this what you were looking for?")
            
    if prompt_yes_or_no
      artist_actions   
    else
      puts "Try your search again."
      select
    end
    
  end


  def artist_actions
    multi_selector = @prompt.select("What would you like to do next?", ["Follow the artist", "List albums"])
           
    case multi_selector
      when "Follow the artist"
        follow_artist
        current_followed_artists
      when "List albums" 
        @artist_object.albums
       end

    puts  ans = prompt.select("Select what you want to do next.", ["Look at an album", "Search again" , "Exit the App"])
    case ans
     when "Look at an album"
         @artist_object.track_list
         search_again?
     when "Search again"
         select
     when "Exit the App"
         exit_app
        end
    end

    
  

  def track_lookup
    answer = prompt.ask("Please type in which track you would like to search.", required: true)do |q|
        q.modify :strip, :collapse
    end
    
    create_track_and_search(answer)
       
    array_of_artists = @track_search.collect  do |track| 
      track_artists = track.artists.collect {|object| object.name}
    end
        
    puts "Here's the artist(s) that were found with that search entry: \n \n" 

    artist_array_with_num = array_of_artists.uniq.each_with_index do |artist, index| 
      number = index + 1
      puts "#{number}:#{artist.join(", ")}"
    end
        
    prompt_yes_or_no = prompt.yes?("Do you want to find out more information about one of the artists?")  
        
    if prompt_yes_or_no
       input= prompt.enum_select("Select the artist ", array_of_artists.uniq)
       create_artist_and_search(input)
       puts "Click the link here for their Spotify page : " + @artist_search_object.external_urls["spotify"]
       search_again?
    else
      search_again?
    end
  end


  def follow_artist
    @@followed_artists << @artist_search_object
    @@followed_artists
  end

  def current_followed_artists
    followed_artist_names = @@followed_artists.collect {|artist| artist.name}
    puts "Here is the list of artists you currently follow: #{followed_artist_names.uniq.join(", ")}"
  end

  def create_artist_and_search(arg)
    @artist_object = Artist.new(arg)
    @artist_search_object = @artist_object.search
  end

  def create_track_and_search(arg)
    @track_input = Track.new(arg) 
    @track_search = @track_input.search
  end

  def search_again?
    prompt_y_or_n = prompt.yes?("Do you want to search again?")
    prompt_y_or_n ? select : exit_app
  end
    

  def exit_app
    puts "CYA!"
  end

end

#refractoring needs to be done
#put stuff in artists and track classes
#figure out how to get a list of tracks from an album
#write a read me page
#figure out what to do about licensing
