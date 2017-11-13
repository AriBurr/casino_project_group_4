require 'colorize'
require 'pry'

class Craps
  attr_accessor :player
  def initialize(player)
    @player = player
    puts "Let\'s play Craps, #{player}!"
    menu
  end

  def game
    puts 'This is the game function'
    puts 'Press enter/return to roll the dice.'
    input = $stdin.gets.chomp.downcase
    if input == 'quit'
      quit
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

  def user_stats
    puts 'This is the user stats function'
    # Create code to count how many wins & loses the player has
    menu
  end
end

# new_game = Craps.new('Jace')
