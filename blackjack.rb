require_relative 'player'
require 'colorize'
require 'artii'
require 'pry'
require_relative 'wallet'
require_relative 'card'
require_relative 'deck'


class Blackjack
  attr_accessor :player, :deck
  def initialize(player)
    @player = player
    @deck = Deck.new

    init_blackjack()
  end

  def init_blackjack()
    puts "===================================".yellow
    puts "***** ~ WELCOME TO BLACKJACK ~ ****".yellow
    puts "===================================".yellow
#binding.pry
blackjack_menu()
end

def blackjack_menu()
  puts "Rules - Deal, decide--hit or stay---over 21 is a bust"
  menu_options = ["Deal", "Hit me!", "Back to Casino"]
  #puts = "Rules are: Deal, hit but you must stay below 21 or you will bust!"
  menu_options.each_with_index { |opt, i| puts "[#{i + 1}] #{opt}" }
  #puts = menu_options
action = gets.strip.to_i
case action
  when 1
    deal()
  when 2
#binding.pry
  when 3
    hit()
  when 4
    return
  else
    puts "Invalid Input -- Please Try Again"
  end
end

def blackjack_rules()
puts "==========================".yellow
puts "| Deal - $5 per hand |".yellow
puts "==========================".yellow
  end
#binding.pry

#Deck.new()
#Card.new()
# Deal two cards
#binding.pry
def deal()
#binding.pry
  shuffled = @deck.shuffle_cards
  #binding.pry
  dealer_cards = shuffled.shift(2)
  user_cards = shuffled.shift(2)
  #binding.pry
  puts "Dealer hand #{dealer_cards[0].rank} of #{dealer_cards[0].suit} and #{dealer_cards[1].rank} of #{dealer_cards[1].suit}"
  puts "Your hand #{user_cards[0].rank} of #{user_cards[0].suit} and #{user_cards[1].rank} of #{user_cards[1].suit}"

end
end
def deal2()
  shuffled = @deck.shuffle_cards
  dealer_cards = shuffled.shift(2)
end
end
  def blackjack_menu()
    puts "Rules - Deal, decide--hit or stay---over 21 is a bust"
    menu_options = ["Deal", "Hit me!", "Back to Casino"]
    #puts = "Rules are: Deal, hit but you must stay below 21 or you will bust!"
    menu_options.each_with_index { |opt, i| puts "[#{i + 1}] #{opt}" }
    #puts = menu_options
  action = gets.strip.to_i
  case action
    when 1
      deal()
    when 2
  #binding.pry
    when 3
      hit()
    when 4
      return
    else
      puts "Invalid Input -- Please Try Again"
    end
  end

# wait for hit or stay
# deal one card
# evaluate whether the combination of cards is above 21
player = Player.new()
Blackjack.new(player)
