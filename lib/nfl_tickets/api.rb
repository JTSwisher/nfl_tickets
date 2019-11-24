class NflTickets::API
  
  attr_accessor :team, :date, :time, :venue, :state, :url, :city
  
def self.games 
   games = []
   games << self.fetch
   games
end 
  
  
  
  
  
  def self.fetch 
    url = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=m4EQzjgxMQBTg801rcvoUStJnEQ7Emqr&locale=*&countryCode=US&promoterId=705"
    response = HTTParty.get(url)
    
    game = self.new
    game.team = response["_embedded"]["events"][0]["name"]
    game.url = response["_embedded"]["events"][0]["url"]
    game.date = response["_embedded"]["events"][0]["dates"]["start"]["localDate"]
    game.time = response["_embedded"]["events"][0]["dates"]["start"]["localTime"]
    game.venue = response["_embedded"]["events"][0]["_embedded"]["venues"][0]["name"]
    game.city = response["_embedded"]["events"][0]["_embedded"]["venues"][0]["city"]["name"]
    game.state = response["_embedded"]["events"][0]["_embedded"]["venues"][0]["state"]["name"]
    game
    binding.pry
  end 
  

end 