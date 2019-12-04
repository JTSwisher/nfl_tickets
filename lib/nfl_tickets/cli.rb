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
00    0000  00        00000000 \n".colorize(:magenta)
      puts "00000000  00  00000000  00   00  00000000  00000000  00000000
   00     00  00        00  00   00           00     00
   00     00  00        0000     000000       00     00000000
   00     00  00        00  00   00           00           00
   00     00  00000000  00   00  00000000     00     00000000\n".colorize(:magenta)
     puts "Hello fellow NFL fan!".colorize(:cyan)
  end 
    
  def game_generator 
    puts "Enter the name of the team you would like to see play.".colorize(:cyan)
    input = gets.chomp.capitalize
      NflTickets::Games.create_by_name(input)
      select_game
  end

  def select_game 
    puts ""
    NflTickets::Games.all.each_with_index do |game, i|
      puts "#{i + 1}. #{game.team}".colorize(:blue) 
    end
    
    puts "Select a game by number for additional information.".colorize(:cyan)
    input = gets.chomp.to_i
      
      NflTickets::Games.all[input-1].tap do |game|
        puts " Teams playing:".colorize(:blue) + " #{game.team}"
        puts " Date of game:".colorize(:blue) + " #{game.date}" 
        puts " Time of game:".colorize(:blue) + " #{game.time}" 
        puts " Game venue:".colorize(:blue) + " #{game.venue}"
        puts " Game location:".colorize(:blue) + " #{game.city}," + " #{game.state}"
        puts " Tickets for purchase:".colorize(:blue) + " #{game.url}"
      end 
      menu
  end 
    
  def menu 
    puts ""  
    puts "Enter ".colorize(:cyan) + "more ".colorize(:red) + "to see information on a different game from the current list.".colorize(:cyan) 
    puts "Enter ".colorize(:cyan) + "search ".colorize(:red) + "to find additional games for a different team. ".colorize(:cyan) 
    puts "Enter ".colorize(:cyan) + "clear ".colorize(:red) + "to clear current list of games or ".colorize(:cyan) + "exit ".colorize(:red) + "to exit.".colorize(:cyan)
      input = gets.chomp
        
    case input.upcase
      when "MORE"
        select_game
      when "SEARCH"
        puts ""
        game_generator
      when "CLEAR"
        NflTickets::Games.destroy_all
        puts ""
        puts "The current list of games has been cleared.".colorize(:cyan)
        game_generator
      when "EXIT"
        puts "Thank you goodbye!".colorize(:cyan)
        exit 
      else
        puts "Sorry, that input is not recognized.".colorize(:red)
        menu
      end 
    end 
end  
  
  