  class NflTickets::API
  
      #def self.fetch(input)
       #   url = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=m4EQzjgxMQBTg801rcvoUStJnEQ7Emqr&keyword=#{input}&countryCode=US&promoterId=705"
        #  response = HTTParty.get(url)
         # response["_embedded"]["events"].each do |game|
          #  team = game["name"]
           # url = game["url"]
            #date = game["dates"]["start"]["localDate"]
            #time = game["dates"]["start"]["localTime"]
            #binding.pry
            #venue = game["_embedded"]["venues"]["name"]
            #city = game["_embedded"]["venues"]["city"]["name"]
            #state = game["_embedded"]["venues"]["state"]["name"]
            #NflTickets::Games.new(team, date, time, venue, state, url, city)
        #end 
      #end 
        
        
      def self.fetch(input)
          url = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=m4EQzjgxMQBTg801rcvoUStJnEQ7Emqr&keyword=#{input}&countryCode=US&promoterId=705"
          response = HTTParty.get(url)
          response.parsed_response
          response["_embedded"]["events"].each do |game|
            team = game["name"]
            url = game["url"]
            date = game["dates"]["start"]["localDate"]
            time = game["dates"]["start"]["localTime"]
            NflTickets::Games.new(team, date, time, url)
        end 
        
      end 
      
 end 