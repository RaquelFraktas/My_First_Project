class Track
  attr_accessor :name
  @@all = []


  def initialize(name)
    @name = name
    @@all << self
  end

  
  def search
    track_search = RSpotify::Track.search(self.name) 
    track_search
  end


  def self.search_history
    @@all.collect {|artist| artist.name}
  end

  
end
