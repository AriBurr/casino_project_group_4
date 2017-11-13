class Wallet
  attr_accessor :amount
  def initialize()
    @amount = 100
  end

  # def add_wallet()
  #   @amount += 100
  # end
  #
  # def sub_wallet()
  #   @amount -= 100
  # end

  #defaults to win, if it's a loss pass in 'loss' as 2nd argument
  def change_wallet(difference, outcome = "win")
    outcome === "win" ? @amount += difference : @amounts -= difference
  end


end
