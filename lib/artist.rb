class Artist
  attr_accessor :name, :prompt
  attr_reader :genres, :albums
  @@all = []


  def initialize(name)
    @name = name
    @prompt = TTY::Prompt.new
    @@all << self
  end  


  def search
    artist_search = RSpotify::Artist.search(self.name) 
    first_search = artist_search.first
  end  


  def albums
    album_names = self.search.albums.collect {|album| album.name}
    
    album_with_num = album_names.uniq.each_with_index do |album, i| 
      i+=1 
      puts "#{i}: #{album}"
    end  
  end  


  def track_list_on_album
    input = prompt.enum_select("Select an album to view tracks.", albums)
    album = RSpotify::Album.search(input)
    external_url = album.map {|album| album.external_urls["spotify"]}
    puts "Click the following link to open up Spotify and view the tracks on the selected album: #{external_url.first}"
  end  


  def self.search_history
    @@all.collect {|artist| artist.name}
  end

    
end
