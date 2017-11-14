# To Do
# Gameplay menu
# Add money
# Subtract Money


require 'colorize'
require 'pry'
require_relative 'player'
require_relative 'dice'


class Craps
  attr_accessor :player
  def initialize(player)
    @dice = Dice.new
    @player = player
    puts "----- Let\'s play Craps, #{@player.name}! -----"
   @player.check_amount
   @win_amount = 0
   @loss_amount = 0
    menu
  end


  def game_one
    @first_roll = 0
    @roll = 0
    @point = 0
    puts "\n\t------ Game One - The Come Out Roll ------\n"
    puts 'Press Enter/Return to Throw the Dice.'.colorize(:light_blue)
    input = $stdin.gets.strip
    @first_roll = @dice.roll
    puts "First Roll = #{@first_roll}."

    if @first_roll == 7 || @first_roll == 11
      puts 'Player wins!'
      @win_amount += 1
      menu
    elsif @first_roll == 2 || @first_roll == 3 || @first_roll == 12
      puts "Player loses."
      puts ""
      @loss_amount  += 1
      menu
    else
      @point = @first_roll
      puts "The point is #{@point}"
      is_won = false
      game_two
    end
  end


def game_two
  puts "\n\t----- Game Two - The Point -----\n"
  puts 'Press Enter/Return to Throw the Dice.'.colorize(:light_blue)
  puts "The Point is #{@point}!".colorize(:yellow)
  input = $stdin.gets.strip
  while !@is_won
    @roll = @dice.roll
    if @roll == @point
      puts "Rolled a #{@roll}."
      puts "Player wins!"
      puts "House looses."
      @win_amount += 1
      secondary_loop
    else
      if @roll == 7
        puts "Rolled a #{@roll}."
        puts 'Player loses...'
        @loss_amount +=  1
        isWon = true
        puts "House wins!"
        user_stats
      end
    end
  end
end


  def user_stats
    puts 'User Win/Lose Stats'
    puts "Wins: #{@win_amount}.".colorize(:green)
    puts "Losses: #{@loss_amount}.".colorize(:red)
    menu
  end
  end


  def quit
    puts 'Thanks for playing!'
    casino
  end


  def menu
    puts '1.) To Play the game, press 1'
    puts '2.) To View player stats, press 2'
    puts '3.) To Exit the game, press 3'
    print '> '
    selection = $stdin.gets.strip.downcase

    case selection
      when '1' || include?('play')
        game_one
      when '2' || include?('view') || include?('stats')
        user_stats
      when '3' || include?('quit')
        quit
      else
        puts "Invalid user input #{selection}. Please try again"
    end
  end

# player= Player.new
# Craps.new(player)
