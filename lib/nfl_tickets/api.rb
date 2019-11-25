class NflTickets::API
  
  def self.fetch(input)
    url = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=m4EQzjgxMQBTg801rcvoUStJnEQ7Emqr&keyword=#{input}&countryCode=US&promoterId=705"
    response = HTTParty.get(url)
      
    team = response["_embedded"]["events"][0]["name"]
    url = response["_embedded"]["events"][0]["url"]
    date = response["_embedded"]["events"][0]["dates"]["start"]["localDate"]
    time = response["_embedded"]["events"][0]["dates"]["start"]["localTime"]
    venue = response["_embedded"]["events"][0]["_embedded"]["venues"][0]["name"]
    city = response["_embedded"]["events"][0]["_embedded"]["venues"][0]["city"]["name"]
    state = response["_embedded"]["events"][0]["_embedded"]["venues"][0]["state"]["name"]
    NflTickets::Games.new(team, date, time, venue, state, url, city)
  end 
  

end 