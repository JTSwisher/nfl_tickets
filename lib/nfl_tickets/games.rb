class NflTickets::Games
  attr_accessor :team, :date, :time, :url
  
  @@all = []
  
  def initialize(team, date, time, url)
    @team = team 
    @date = date 
    @time = time 
    @url = url 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 

  
end 