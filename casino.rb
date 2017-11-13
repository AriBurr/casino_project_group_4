require_relative 'player'
require_relative 'roulette'
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
    @options = ["Roulette", "Blackjack", "Slots"]
    puts "What game would you like to play?"
    @options.each_with_index { |opt, i| puts "[#{i + 1}] #{opt}"}
    choice = gets.to_i
    case choice
      when 1
        Roulette.new(@player, self)
      when 2
        Blackjack.new(@player, self)
      when 3
        Slots.new(@player, self)
      else
        "Invalid -- Please Try Again"
        menu()
    end
  end

  # puts "This is the casino!"
  #   puts "#{@player.name} has $#{@player.wallet.amount}"
  #   @player.check_amount()

end

Casino.new()
