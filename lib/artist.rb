class Artist
    attr_accessor :name
    attr_reader :genres, :top_tracks, :popularity, :albums

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def search
       artist_search = RSpotify::Artist.search(self.name) 
    end

    def albums()
        self.find do ||
        end
        #input code in here once the artist is chosen, and look through their albums 
        #i want to display albums by the chosen artist
    end


    def self.search_history
        @@all
    end
   
end

#need a run file that accesses artists
#need to run environment.rb first
# blood_orange = Artist.new("Blood Orange")
# blood_orange.search