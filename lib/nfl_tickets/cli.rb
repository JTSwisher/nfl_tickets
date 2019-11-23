class NflTickets::CLI 
  
  def call 
    list_games
  end 
  
  def list_games 
    NflTickets::API.games
  end 
  
  
  
end 