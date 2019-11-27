class NflTickets::Games
  attr_accessor :team, :date, :time, :url
  
  @@all = []
  
  def initialize(team, date, time, url)
    @team = team 
    @date = date 
    @time = time 
    @url = url 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.find_by_name(team_name)
    self.all.detect {|game| game.team == team_name} 
  end
  
  def self.create_by_name(team_name)
    NflTickets::API.fetch(team_name) 
    NflTickets::Games.all.each_with_index do |game, i|
      puts "#{i + 1}. #{game.team}".colorize(:blue)
    end
  end 
  
  def self.find_or_create_by_name(team_name)
    self.find_by_name(team_name) || self.create_by_name(team_name)
  end 

  def self.destroy_all
    self.all.clear 
  end 
end 