require_relative 'player'
require_relative 'roulette'
require 'colorize'
require 'artii'
require 'pry'

class Casino
  attr_accessor :player
  def initialize()
    @player = Player.new()
    test()
  end

  def test()
    puts "#{@player.name} has $#{@player.wallet.amount}"
    Roulette.new(@player, self)
  end

  def menu()
    puts "This is the casino!"
      puts "#{@player.name} has $#{@player.wallet.amount}"
      @player.check_amount()
  end

end

Casino.new()
