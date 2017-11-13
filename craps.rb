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
    menu
  end

  def game
    @first_roll = 0
    @roll = 0
    @point = 0
    @win_amount = 0
    @loss_amount = 0
    # @first_roll = @dice.roll.show_dice # Roll the Dice
    puts 'Press Enter/Return to Roll the Dice.'
    input = $stdin.gets.strip
    @first_roll = @dice.roll
    puts "First Roll = #{@first_roll}."

    if @first_roll == 7 || @first_roll == 11
      puts 'Player wins!'
      @win_amount += 1
      game
    elsif @first_roll == 2 || @first_roll == 3 || @first_roll == 12
      puts "Player loses"
      @loss_amount = @loss_amount + 1
      game
    else
      @point = @first_roll
      puts "The point is #{@point}"
      is_won = false
      secondary_loop
    end
  end

def secondary_loop
  puts 'Press Enter/Return to roll the dice.'
  input = $stdin.gets.strip
  while !@is_won
    @roll = @dice.roll
    if @roll == @point
      puts "Rolled a #{@roll}."
      puts "Player wins!"
      @win_amount += 1
      secondary_loop
    else
      if @roll == 7
        puts "Rolled a #{@roll}."
        puts 'Player loses...'
        @loss_amount += 1
        isWon = true
        user_stats
      end
    end
  end
end

  def user_stats
    puts 'This is the user stats function'
    # Create code to count how many wins & loses the player has
    puts "Wins: #{@win_amount}."
    puts "Losses: #{@loss_amount}."
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
    puts '3.) To Exit the game, press 4'
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
