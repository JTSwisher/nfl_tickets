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
    puts "Would you like to see more information on this game(YES/NO)?"
    input = gets.chomp
    
    case input.upcase
      when  "YES"
        NflTickets::Games.all.each do |game|
          puts " Date of game:".colorize(:blue) + " #{game.date}" 
          puts " Time of game:".colorize(:blue) + " #{game.time}" 
          puts " Game venue:".colorize(:blue) + " #{game.venue}" 
          puts " Game location:\n".colorize(:blue) + "    City: ".colorize(:light_blue) + "#{game.city}\n" + "    State: ".colorize(:light_blue) + "#{game.state}" 
          puts " Tickets for purchase:".colorize(:blue) + " #{game.url}"
        end 
      when "NO"
        call 
    end 
    
    puts "Would you like information on a different game(YES/NO)?"
    input = gets.chomp
    
    case input.upcase
      when "YES"
        call
      when "NO"
        exit
      end
    end 
  end 
  
  
  
  
  