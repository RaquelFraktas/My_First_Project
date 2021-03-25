class Artist
    attr_accessor :name, :album_names, :prompt
    attr_reader :genres, :top_tracks, :albums

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
        @album_names = self.search.albums.collect do|album|
            album.name
       end
       album_with_num = album_names.uniq.each_with_index do |album, i| 
            i+=1 
            puts "#{i}: #{album}"
       end

    end

    def track_list
        input = prompt.enum_select("Select an album to view tracks.", albums)
        albums = RSpotify::Album.search(input)
        # binding.pry

        # external_url = tracks.map {|album| album.external_urls["spotify"]}
        # puts "Click the following to play the song #{external_url}"
    end




    def self.search_history
        @@all
    end
   
end

#need a run file that accesses artists
#need to run environment.rb first
# blood_orange = Artist.new("Blood Orange")
# blood_orange.search