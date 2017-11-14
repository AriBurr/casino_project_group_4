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
    puts "==============================================".yellow
    puts "***** ~ WELCOME TO THE DEVPOINT CASINO ~ *****".yellow
    puts "==============================================".yellow
    @options = ["Roulette", "Blackjack", "Slots", "Craps", "Exit"]
    puts "What game would you like to play?"
    @options.each_with_index { |opt, i| puts "[#{i + 1}] #{opt}"}
    print "> "
    choice = gets.to_i
    case choice
      when 1
        Roulette.new(@player, self)
      when 2
        Blackjack.new(@player, self)
      when 3
        Slots.new(@player, self)
      when 4
        Craps.new(@player, self)
      when 5
        puts "Thanks for playing!"
        exit(1)
      else
        "Invalid -- Please Try Again"
        menu()
    end
    menu()
  end

end

Casino.new()
