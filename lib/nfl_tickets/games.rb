class NflTickets::Games
  attr_accessor :team, :date, :time, :venue, :state, :url, :city
  
  @@all = []
  
  def initialize(team, date, time, venue, state, url, city )
    @team = team 
    @date = date 
    @time = time 
    @venue = venue 
    @state = state 
    @url = url 
    @city = city 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 

  
end 