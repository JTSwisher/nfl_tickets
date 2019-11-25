class NflTickets::CLI 
  
  def call 
    puts "who is your favorite team?"
    input = gets.chomp
    NflTickets::API.fetch(input)
    
    NflTickets::Games.all.each do |game|
      puts game.team
    end 
  end 
  
 
end 