require 'colorize'
require_relative 'roulette_data'

class Roulette
  attr_accessor :player
  def initialize(player, casino)
    @casino = casino
    @player = player
    init_roulette()
  end

  def init_roulette()
    puts "===================================".yellow
    puts "***** ~ WELCOME TO ROULETTE ~ *****".yellow
    puts "===================================".yellow
    (1..36).each do |num|
      print "       #{num.to_s.blue}  " if num.between?(1, 9) && num % 2 === 0
      print "       #{num.to_s.red}  " if num.between?(1, 9) && num % 2 != 0
      print "       #{num.to_s.blue} " if num.between?(10, 36) && num % 2 === 0
      print "       #{num.to_s.red} " if num.between?(10, 36) && num % 2 != 0
      puts "\n".ljust(1) if num % 3 === 0
    end
    roulette_menu()
  end

  def roulette_menu()
    menu_options = ["Rules -- Please Read First", "Bet Outside", "Bet Inside", "Spin the Wheel!", "Back to Casino"]
    menu_options.each_with_index { |opt, i| puts "[#{i + 1}] #{opt}" }
    print "> "
    action = gets.strip.to_i
    case action
      when 1
        roulette_rules()
      when 2
        bet_outside()
      when 3
        bet_inside()
      when 4
        spin_wheel()
      when 5
        @player.money.change_wallet(100, "win")
        @casino.menu()
      else
        puts "Invalid Input -- Please Try Again"
    end
  end

  def roulette_rules()
    puts "==========================".yellow
    puts "| Outside Bets - $10 min |".yellow
    puts "==========================".yellow
    outside_1_1 = ["even/odd", "red/blue", "1-18", "19-36"]
    puts "1:1 payout:".upcase
    outside_1_1.each { |bet| puts "* #{bet}" }
    outside_2_1 = ["1-12", "12-24", "24-36"]
    puts "2:1 payout:".upcase
    outside_2_1.each { |bet| puts "* #{bet}" }
    puts "========================".yellow
    puts "| Inside Bets - $5 min |".yellow
    puts "========================".yellow
    inside_bets = ["Pick a single, 35:1 PAYOUT", "Pick a pair, 17:1 PAYOUT", "Pick a row, 11:1 PAYOUT"]
    inside_bets.each { |bet| puts "* #{bet}" }
  end

  def bet_inside()
  end

  def bet_outside()
  end

  def spin_wheel()
  end

end
