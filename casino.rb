require_relative 'player'
require_relative 'roulette'
require 'colorize'
require 'artii'
require 'pry'

class Casino
  attr_accessor :player
  def initialize()
    puts "Please enter name:"
    name = gets.strip
    puts "Please enter age:"
    age = gets.strip.to_i
    @player = Player.new(name, age)
    test()
  end

  def test()
    puts "#{@player.name} has $#{@player.money.amount}"
    Roulette.new(@player, self)
  end

  def menu()
    puts "This is the casino!"
      puts "#{@player.name} has $#{@player.money.amount}"
      @player.check_amount()
  end

end

Casino.new()
