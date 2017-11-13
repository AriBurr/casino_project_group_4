class Craps
  def initialize
    puts 'Let\'s play Craps!'
    menu
  end

  def game
    puts 'This is the game function'
    # Create the game
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
        puts 'Exiting the game...'
        exit 0
      else
        puts "Invalid user input #{selection}. Please try again"
    end
  end

  def user_stats
    puts 'This is the user stats function'
    # Create code to count how many wins & loses the player has
  end
end
