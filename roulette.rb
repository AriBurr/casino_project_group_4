require 'colorize'
require 'pry'
require_relative 'player'
require_relative 'roulette_data'

class Roulette
  attr_accessor :player
  def initialize(player)
    @player = player
    @betting_profile = []
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
        return
      else
        puts "Invalid Input -- Please Try Again"
        roulette_menu()
    end
    roulette_menu()
  end

  def roulette_rules()
    puts "==========================".yellow
    puts "| Outside Bets - $10 min |".yellow
    puts "==========================".yellow
    @outside_1_1 = ["even", "odd", "red", "blue", "1-18", "19-36"]
    puts "1:1 payout:".upcase
    @outside_1_1.each { |bet| puts "* #{bet}" }
    @outside_2_1 = ["1-12", "12-24", "24-36"]
    puts "2:1 payout:".upcase
    @outside_2_1.each { |bet| puts "* #{bet}" }
    puts "========================".yellow
    puts "| Inside Bets - $5 min |".yellow
    puts "========================".yellow
    @inside_bets = ["Pick a single, 35:1 PAYOUT", "Pick a pair, 17:1 PAYOUT", "Pick a row, 11:1 PAYOUT"]
    @inside_bets.each { |bet| puts "* #{bet}" }
  end

  def bet_inside()
    @inside_bets = ["Pick a single, 35:1 PAYOUT", "Pick a pair, 17:1 PAYOUT", "Pick a row, 11:1 PAYOUT"]
    @inside_bets.each_with_index { |bet, i| puts "[#{i + 1}] #{bet}" }
    puts "Which inside bet would you like to make? Press [4] to return."
    print "> "
    choice = gets.to_i
    case choice
      when 1
        puts "Pick a single"
        print "> "
        @single = gets.to_i
        @betting_profile << @single
        @player.wallet.sub_wallet(10)
      when 2
        puts "Pick a pair (1,2)"
        print "> "
        @row = gets.strip.split(",").map(&:to_i)
        @betting_profile << @row
        @player.wallet.sub_wallet(10)
      when 3
        puts "Pick a row (1,2,3)"
        print "> "
        @pair = gets.strip.split(",").map(&:to_i)
        @betting_profile << @pair
        @player.wallet.sub_wallet(10)
      when 4
        roulette_menu
      else
        "Invalid Input -- Please Try Again!"
    end
    bet_inside()
  end

  def bet_outside()
    puts "Please select [1] 1:1 bets or [2] 2:1 bets. Press [3] to continue."
    print "> "
    choice = gets.to_i
    case choice
      when 1
        @outside_1_1 = ["even", "odd", "red", "blue", "1-18", "19-36"]
        @outside_1_1.each_with_index { |bet, i| puts "[#{i + 1}] #{bet}" }
        puts "Choose your bet:"
        print "> "
        @outside_1_1_bet = @outside_1_1[gets.to_i - 1]
        @betting_profile << @outside_1_1_bet
      when 2
        @outside_2_1 = ["1-12", "12-24", "24-36"]
        @outside_2_1.each_with_index { |bet, i| puts "[#{i + 1}] #{bet}" }
        puts "Choose your bet:"
        print "> "
        @outside_2_1_bet = @outside_2_1[gets.to_i - 1]
      when 3
        roulette_menu()
      else
        "Invalid Input -- Please Try Again!"
        bet_outside()
      end
    bet_outside()
  end

  def spin_wheel()
    binding.pry
    single_num = 1
    puts "The winning number is #{single_num}"
    @betting_profile.each do |bet|
      if bet === single_num
        puts "You picked the number!"
      elsif single_num % 2 === 0 && bet == "even" || bet == "blue"
        puts "You picked even or blue!"
        @player.wallet.add_wallet(10 * 2)
        puts "You have #{@player.wallet.amount}"
      elsif single_num % 2 != 0 && bet == "odd" || bet == "red"
        puts "You picked odd or red!"
        @player.wallet.add_wallet(10 * 2)
        puts "You have #{@player.wallet.amount}"
      elsif bet.include?(single_num) && bet.length == 2
        puts "You picked a pair!"
      elsif bet.include?(single_num) && bet.length == 3
        puts "You picked a row!"
      else
        puts "No dice!"
      end
    end
  end

end

player = Player.new()
Roulette.new(player)
