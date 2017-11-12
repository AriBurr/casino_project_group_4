require_relative 'wallet'

class Player
  attr_accessor :name, :age, :money
  def initialize(name, age)
    @name = name
    @age = age
    @money = Wallet.new()
  end

  def check_amount()
    puts @money.amount === 0 ? "You have no money!" : "You have money!"
  end

  def win_money()
    @money.amount += 100
  end

  def lose_money()
    @money.amount -= 100
  end

end
