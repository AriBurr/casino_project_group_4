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

  def game
    @first_roll = 0
    @roll = 0
    @point = 0
    # @first_roll = @dice.roll.show_dice # Roll the Dice
    puts 'Press Enter/Return to Roll the Dice.'.colorize(:light_blue)
    input = $stdin.gets.strip
    @first_roll = @dice.roll
    puts "First Roll = #{@first_roll}."

    if @first_roll == 7 || @first_roll == 11
      puts 'Player wins!'
      @win_amount += 1
      game
    elsif @first_roll == 2 || @first_roll == 3 || @first_roll == 12
      puts "Player loses"
      @loss_amount  += 1
      game
    else
      @point = @first_roll
      puts "The point is #{@point}"
      is_won = false
      puts "First roll is done. Now onto the challenging part.\n\n"
      secondary_loop
    end
  end

def secondary_loop
  puts 'Press Enter/Return to roll the dice.'.colorize(:light_blue)
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
    exit 0
  end


  def menu
    puts '1.) To Play the game, press 1'
    puts '2.) To View player stats, press 2'
    puts '3.) To Exit the game, press 3'
    print '> '
    selection = $stdin.gets.strip.downcase

    case selection
      when '1' || include?('play')
        game
      when '2' || include?('view') || include?('stats')
        user_stats
      when '3' || include?('quit')
        quit
      else
        puts "Invalid user input #{selection}. Please try again"
    end
  end

player= Player.new
Craps.new(player)
