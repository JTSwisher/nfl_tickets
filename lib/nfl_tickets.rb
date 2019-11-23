require 'pry'
require 'httparty'

require_relative "nfl_tickets/version"
require_relative 'nfl_tickets/cli'
require_relative 'nfl_tickets/games'
require_relative 'nfl_tickets/api'



module NflTickets
  class Error < StandardError; end
  # Your code goes here...
end
