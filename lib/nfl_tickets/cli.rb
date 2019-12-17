class NflTickets::CLI 
  
  def call
    greeting
    menu
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
     puts "Hello, fellow NFL fan!".colorize(:cyan)
  end

  def game_generator 
    puts "Enter the name of the team you would like to see play.".colorize(:cyan)
    input = gets.chomp.capitalize
     NflTickets::API.fetch(input)
  end

  def select_game 

    if NflTickets::Games.all.size > 0 
      puts ""
      NflTickets::Games.all.each_with_index do |game, i|
        puts "#{i + 1}. #{game.team}".colorize(:blue) 
      end
    
      puts "Select a game by number for additional information.".colorize(:cyan)
      input = gets.chomp.to_i
    else
      puts ""
      puts "There are no games in the current list.".colorize(:red) 
      menu
    end   
      
    if input > 0 && input <= NflTickets::Games.all.size 
      NflTickets::Games.all[input-1].tap do |game|
        puts " Teams playing:".colorize(:blue) + " #{game.team}"
        puts " Date of game:".colorize(:blue) + " #{game.date}" 
        puts " Time of game:".colorize(:blue) + " #{game.time}" 
        puts " Game venue:".colorize(:blue) + " #{game.venue}"
        puts " Game location:".colorize(:blue) + " #{game.city}," + " #{game.state}"
        puts " Tickets for purchase:".colorize(:blue) + " #{game.url}"
      end 
    else 
      puts ""
      puts "You must enter a valid game number.".colorize(:red)
      select_game
    end 
  end

  def clear_list 
    if NflTickets::Games.all.size > 0 
      NflTickets::Games.destroy_all
        puts ""
        puts "The current list of games has been cleared.".colorize(:cyan)
        menu
    else 
      puts ""
     puts "There are no games in the current list to clear.".colorize(:red)
      menu
    end 
  end 
    
  def menu 
    puts ""  
    puts "Enter ".colorize(:cyan) + "search ".colorize(:red) + "to find games.".colorize(:cyan) 
    puts "Enter ".colorize(:cyan) + "list ".colorize(:red) + "to see information on a different game from the current list.".colorize(:cyan)  
    puts "Enter ".colorize(:cyan) + "clear ".colorize(:red) + "to clear current list of games or ".colorize(:cyan) + "exit ".colorize(:red) + "to exit.".colorize(:cyan)
      input = gets.chomp
        
    case input.upcase
      when "SEARCH"
        puts ""
        game_generator
        select_game
        menu
      when "LIST"
        select_game
        menu
      when "CLEAR"
       clear_list
      when "EXIT"
        puts "Thank you, goodbye!".colorize(:cyan)
        exit 
      else
        puts ""
        puts "Sorry, that input is not recognized.".colorize(:red)
        menu
    end 
  end 

end   
  
  