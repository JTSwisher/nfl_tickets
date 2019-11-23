class NflTickets::CLI 
  
  def call 
    list_games
  end 
  
  def list_games 
    puts "Team Games:"
    @games = NflTickets::API.games
    @games.each do |game|
      puts "#{game}"
    end 
  end 
  
  
  
end 