class Wallet
  attr_accessor :amount
  def initialize(amount)
    @amount = amount
  end

  def add_wallet(num)
    @amount += num
  end

  def sub_wallet(num)
    @amount -= num
  end

  #defaults to win, if it's a loss pass in 'loss' as 2nd argument
  # def change_wallet(difference, outcome = "win")
  #   outcome === "win" ? @amount += difference : @amount -= difference
  # end


end
