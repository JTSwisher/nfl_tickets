class NflTickets::CLI 
  
  def call
    greeting
    game_generator
  end 
  
  
  def greeting 
    puts "\n0000    00  00000000  00        
00 00   00  00        00           
00  00  00  00000     00          
00   00 00  00        00           
00    0000  00        00000000\n".colorize(:magenta)
    puts "00000000  00  00000000  00   00  00000000  00000000  00000000
   00     00  00        00  00   00           00     00
   00     00  00        0000     000000       00     00000000
   00     00  00        00  00   00           00           00
   00     00  00000000  00   00  00000000     00     00000000\n".colorize(:magenta)
  end 
  
  def game_generator 
    puts "Who is your favorite team?"
    input = gets.chomp
      NflTickets::API.fetch(input)
        NflTickets::Games.all.each do |game|
         puts "#{game.team}".colorize(:blue)
          menu
      end
  end 
  
  def menu 
    puts "Would you like to see more infomration on this game(Y/N)?"
    input = gets.chomp 
    
    case input
    when input == "Yes" || "yes"
      NflTickets::Games.all.each do |game|
        puts " Date of game:".colorize(:blue) + " #{game.date}" 
        puts " Time of game:".colorize(:blue) + " #{game.time}" 
        puts " Game venue:".colorize(:blue) + " #{game.venue}" 
        puts " Game location:\n".colorize(:blue) + "    City: ".colorize(:light_blue) + "#{game.city}\n" + "    State: ".colorize(:light_blue) + "#{game.state}" 
        puts " Tickets for purchase:".colorize(:blue) + " #{game.url}"
      end 
    when input == "No" || "no"
      call 
    end 
  end 
end 