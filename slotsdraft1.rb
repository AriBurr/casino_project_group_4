
require 'pry'
require 'colorize'
require_relative 'player'

class Slots
  attr_accessor :player
  def initialize(player)
    @player = player
    slots
  end

def slots

  slotList = [
 "\u{1F378}",
 "\u{1F347}",
 "\u{1F36d}",
 "\u{1F3B0}",
 "\u{1F308}"]
   winningslots = []
   slots1 = slotList.sample
   winningslots << slots1
   slots2 = slotList.sample
   winningslots << slots2
   slots3 = slotList.sample
   winningslots << slots3


    puts 'Hello! Welcome to Slots'.yellow
    puts 'would you like to spin?'.yellow
    puts '1) Spin ($1)'.yellow
    puts '2) Exit'.yellow
    response = gets.to_i

case response
when 1
  @player.wallet.sub_wallet(1)
      sleep(1)
      puts winningslots[0]
      sleep(1)
      puts winningslots[1]
      sleep(1)
      puts winningslots[2]
      binding.pry
    if winningslots[0] == winningslots[1] && winningslots[0] == winningslots[2]
      puts 'JACKPOT!!!'.yellow
      @player.wallet.add_wallet(100)
    #  puts "#{@player.name} has $#{@player.wallet.amount}"
    elsif
      winningslots[0] == winningslots[1]
      puts 'YOU GOT A PAIR!'.yellow
     @player.wallet.add_wallet(25)
     puts "#{@player.name} has $#{@player.wallet.amount}"
    elsif
    winningslots[1] == winningslots[2]
    puts 'YOU GOT A PAIR!'.yellow
    @player.wallet.add_wallet(25)
    #puts "#{@player.name} has $#{@player.wallet.amount}"

    else
    puts "LOSER".red
    puts "has $#{@player.wallet.amount}"
#     @player.wallet.add(0)
    end
when 2
  exit
else
  puts "invalid choice"
  puts "please answer"
  response2 = gets.to_i
end

spin_again

end

def spin_again
  puts "Would you like to play again?"
  puts "1) Yes"
  puts "2) Exit"
  response2 = gets.to_i

  case response2
  when 1
    slots

  when 2
    exit

  else
    puts "invalid choice"
    puts "please answer"
    response2 = gets.to_i
  end
end

end

player = Player.new()
Slots.new(player)
