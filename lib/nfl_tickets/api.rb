class NflTickets::API
        
  def self.fetch(input)
    url = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=m4EQzjgxMQBTg801rcvoUStJnEQ7Emqr&keyword=#{input}&countryCode=US&promoterId=705"
    response = HTTParty.get(url)
    response.parsed_response
    
    if response["page"]["totalElements"] == 0 
      puts "There are no active game for that team."
      NflTickets::CLI.new.game_generator
    else
    response["_embedded"]["events"].each do |game|
      team = game["name"]
      url = game["url"]
      date = game["dates"]["start"]["localDate"]
      time = game["dates"]["start"]["localTime"]
      
      game["_embedded"]["venues"].each do |game|
        venue = game["name"]
        state = game["state"]["name"]
        city = game["city"]["name"]
        NflTickets::Games.new(team, date, time, url, venue, state, city)
      end 
    end
   end
  end
  
end