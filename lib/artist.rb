class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def search
       artist_search = RSpotify::Artist.search(self.name) 
    end


    def self.search_history
        @@all
    end
   
end

#need a run file that accesses artists
#need to run environment.rb first
blood_orange = Artist.new("Blood Orange")
blood_orange.search