class NflTickets::Games
    attr_accessor :team, :date, :time, :url, :venue, :state, :city
      
    @@all = []
      
    def initialize(team, date, time, url, venue, state, city)
      @team = team 
      @date = date 
      @time = time 
      @url = url 
      @venue = venue 
      @state = state 
      @city = city 
      @@all << self 
    end 
      
    def self.all 
      @@all.uniq do |game|
        game.team
      end 
    end
      
    def self.find_by_name(team_name)
      @@all.detect do |game| 
        #game.team.include?(team_name)
     end 
    end
      
      
    def self.create_by_name(team_name)
      NflTickets::API.fetch(team_name) 
    end 
      
    def self.find_or_create_by_name(team_name)
      self.find_by_name(team_name) || self.create_by_name(team_name)
    end 
    
   # def self.destroy_all
   #   self.all.clear 
   # end 
end 