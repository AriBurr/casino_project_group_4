require_relative 'player'
require_relative 'roulette'
require_relative 'craps'
require 'colorize'
require 'artii'
require 'pry'

class Casino
  attr_accessor :player
  def initialize()
    @player = Player.new()
    menu()
  end

  def menu()
    @options = ["Roulette", "Blackjack", "Slots", "Craps"]
    puts "What game would you like to play?"
    @options.each_with_index { |opt, i| puts "[#{i + 1}] #{opt}"}
    print "> "
    choice = gets.to_i
    case choice
      when 1
        Roulette.new(@player)
      when 2
        Blackjack.new(@player)
      when 3
        Slots.new(@player)
      when 4
        Craps.new(@player)
      else
        "Invalid -- Please Try Again"
        menu()
    end
    menu()
  end

end

Casino.new()
