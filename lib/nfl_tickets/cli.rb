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
    puts "Who is your favorite team?".colorize(:cyan)
    input = gets.chomp
      #implement find or create by name 
      NflTickets::API.fetch(input)
      NflTickets::Games.all.each_with_index do |game, i|
         puts "#{i + 1}. #{game.team}".colorize(:blue)
      end
      menu
  end 
  
  def menu 
    puts "Which game would you like more info about?".colorize(:cyan)
    input = gets.chomp.to_i
    
      NflTickets::Games.all[input-1].tap do |game|
        puts " Teams playing:".colorize(:blue) + " #{game.team}"
        puts " Date of game:".colorize(:blue) + " #{game.date}" 
        puts " Time of game:".colorize(:blue) + " #{game.time}" 
        puts " Tickets for purchase:".colorize(:blue) + " #{game.url}"
      end 
  end 
    
  
end 
  
  
  
  
  