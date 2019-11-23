class NflTickets::API
  
  attr_accessor :team_name, :date, :time, :venue, :state, :url 
  
  def self.games 
    games = []
    games << fetch
    games
  end 
  
  
  
  
  
  def self.fetch 
  
    url = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=m4EQzjgxMQBTg801rcvoUStJnEQ7Emqr&locale=*&countryCode=US&promoterId=705"
    response = HTTParty.get(url)
    binding.pry
  end 
  
end 