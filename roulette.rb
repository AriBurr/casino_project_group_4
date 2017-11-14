require 'colorize'
require 'pry'
require_relative 'player'
require_relative 'roulette_data'

class Roulette
  attr_accessor :player
  def initialize(player)
    @player = player
    @betting_profile = []
    roulette_menu()
  end

  def display_roulette()
    (1..36).each do |num|
      print "       #{num.to_s.blue}  " if num.between?(1, 9) && num % 2 === 0
      print "       #{num.to_s.red}  " if num.between?(1, 9) && num % 2 != 0
      print "       #{num.to_s.blue} " if num.between?(10, 36) && num % 2 === 0
      print "       #{num.to_s.red} " if num.between?(10, 36) && num % 2 != 0
      puts "\n".ljust(1) if num % 3 === 0
    end
  end

  def roulette_menu()
    puts "===================================".yellow
    puts "***** ~ WELCOME TO ROULETTE ~ *****".yellow
    puts "===================================".yellow
    display_roulette()
    @player.check_amount()
    puts "#{@player.name} has $#{@player.wallet.amount.round(2)}"
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
    puts "======================".yellow
    puts "| Outside Bets - $10 |".yellow
    puts "======================".yellow
    @outside_1_1 = ["even", "odd", "red", "blue", "1-18", "19-36"]
    puts "1:1 payout:".upcase
    @outside_1_1.each { |bet| puts "* #{bet}" }
    @outside_2_1 = ["1-12", "12-24", "24-36"]
    puts "2:1 payout:".upcase
    @outside_2_1.each { |bet| puts "* #{bet}" }
    puts "===============".yellow
    puts "| Inside Bets |".yellow
    puts "===============".yellow
    @inside_bets = ["Pick a single, 35:1 PAYOUT", "Pick a pair, 17:1 PAYOUT", "Pick a row, 11:1 PAYOUT"]
    @inside_bets.each { |bet| puts "* #{bet}" }
    puts "Press [enter] to continue!".cyan
    action = gets.strip
    if action == ""
      roulette_menu()
    end
  end

  def bet_inside()
    puts "You can put down whatever amount you want on an inside bet!".red
    @inside_bets = ["Pick a single, 35:1 PAYOUT", "Pick a pair, 17:1 PAYOUT", "Pick a row, 11:1 PAYOUT"]
    @inside_bets.each_with_index { |bet, i| puts "[#{i + 1}] #{bet}" }
    puts "Which inside bet would you like to make? Press [4] to return."
    print "> "
    choice = gets.to_i
    case choice
      when 1
        @single_arr = []
        puts "Pick a single"
        print "> "
        @single_arr << gets.to_i
        puts "How much?"
        print "> "
        @bet_single = gets.to_i
        if @player.wallet.amount < @bet_single
          puts "You don't have enough money!"
        else
          @player.wallet.sub_wallet(@bet_single)
          @betting_profile << @single_arr
        end
      when 2
        puts "Pick a pair (1,2)"
        print "> "
        @row = gets.strip.split(",").map(&:to_i)
        puts "How much?"
        print "> "
        @bet_row = gets.to_i
        if @player.wallet.amount < @bet_row
          puts "You don't have enough money!"
        else
          @player.wallet.sub_wallet(@bet_row)
          @betting_profile << @row
        end
      when 3
        puts "Pick a row (1,2,3)"
        print "> "
        @pair = gets.strip.split(",").map(&:to_i)
        puts "How much?"
        print "> "
        @bet_pair = gets.to_i
        if @player.wallet.amount < @bet_pair
          puts "You don't have enough money!"
        else
          @player.wallet.sub_wallet(@bet_pair)
          @betting_profile << @pair
        end
      when 4
        roulette_menu
      else
        "Invalid Input -- Please Try Again!"
    end
    bet_inside()
  end

  def bet_outside()
    @bet = 10
    puts "All outside bets are $10.".red
    puts "Please select [1] 1:1 bets or [2] 2:1 bets. Press [3] to continue.".red
    print "> "
    choice = gets.to_i
    case choice
      when 1
        @outside_1_1 = ["even", "odd", "red", "blue", "1-18", "19-36"]
        @outside_1_1.each_with_index { |bet, i| puts "[#{i + 1}] #{bet}" }
        puts "Choose your bet:"
        print "> "
        @outside_1_1_bet = gets.to_i
        if @outside_1_1_bet === 5 || @outside_1_1_bet === 6
          bet_arr = @outside_1_1[@outside_1_1_bet - 1].split("-").map(&:to_i)
          bet_range = (bet_arr[0]..bet_arr[1])
          if @player.wallet.amount < @bet
            puts "You don't have enough money!"
          else
            @player.wallet.sub_wallet(@bet)
            @betting_profile << bet_range
          end
        else
          if @player.wallet.amount < @bet
            puts "You don't have enough money!"
          else
            @player.wallet.sub_wallet(@bet)
            @betting_profile << @outside_1_1[@outside_1_1_bet - 1]
          end
        end
      when 2
        @outside_2_1 = ["1-12", "12-24", "24-36"]
        @outside_2_1.each_with_index { |bet, i| puts "[#{i + 1}] #{bet}" }
        puts "Choose your bet:"
        print "> "
        bet_arr = @outside_2_1[gets.to_i - 1].split("-").map(&:to_i)
        bet_range = (bet_arr[0]..bet_arr[1])
        if @player.wallet.amount < @bet
          puts "You don't have enough money!"
        else
          @player.wallet.sub_wallet(@bet)
          @betting_profile << bet_range
        end
      when 3
        roulette_menu()
      else
        "Invalid Input -- Please Try Again!"
        bet_outside()
      end
    bet_outside()
  end

  def spin_wheel()
    puts "=====================".yellow
    puts "| Bets on the Table |".yellow
    puts "=====================".yellow
    @betting_profile.each_with_index { |bet, i| puts "[#{i + 1}] #{bet}" }
    single_num = rand(1..36)
    sleep(1)
    puts "The winning number is #{single_num}".cyan
    sleep(1)
    @betting_profile.each do |bet|
      if bet.is_a? String
        if single_num % 2 === 0 && bet == "even" || bet == "blue"
          puts "You picked even or blue! Woohoo!".blue
          @player.wallet.add_wallet(@bet * 2)
        elsif single_num % 2 != 0 && bet == "odd" || bet == "red"
          puts "You picked odd or red! Woohoo!".red
          @player.wallet.add_wallet(@bet * 2)
        else
          puts "...no dice!".red
        end
      else bet.is_a? Array || Range
        if bet.include?(single_num) && bet.size === 2
          puts "You picked a pair correctly!".cyan
          @player.wallet.add_wallet(@bet_pair + (@bet_pair * 17))
        elsif bet.include?(single_num) && bet.size === 3
          puts "You picked a row correctly!".cyan
          @player.wallet.add_wallet(@bet_row + (@bet_row * 11))
        elsif bet.include?(single_num) && bet.size === 12
          puts "You picked a 12-number range correctly!".cyan
          @player.wallet.add_wallet(@bet + (@bet * 2))
        elsif bet.include?(single_num) && bet.size === 13
          puts "You picked a 12-number range correctly!".cyan
          @player.wallet.add_wallet(@bet + (@bet * 2))
        elsif bet.include?(single_num) && bet.size === 18
          puts "You picked an 18-number range correctly!".cyan
          @player.wallet.add_wallet(@bet * 2)
        elsif bet.include?(single_num) && bet.size === 1
          puts "You picked a single correctly! Hope you bet a lot!".cyan
          @player.wallet.add_wallet(@bet_single + (@bet_single * 35))
        else
          puts "...no dice!"
        end
      end
    end
    puts "Would you like to play again?\n[1] Yes!\n[2] No!"
    if gets.to_i === 1
      @betting_profile = []
      roulette_menu()
    else
      return
    end
  end

end
