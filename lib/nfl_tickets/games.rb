class NflTickets::Games
  attr_accessor :team, :date, :time, :url, :venue, :state, :city
      
  @@all = []
      
  def initialize(team, date, time, url, venue, state, city)
    @team = team 
    @date = date 
    @time = time 
    @url = url 
    @venue = venue 
    @state = state 
    @city = city 
    @@all << self 
  end 
      
  def self.all 
    @@all.uniq do |game|
      game.team
    end 
  end
      

  def self.destroy_all 
    @@all.clear 
  end 
        
end