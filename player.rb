require_relative 'wallet'

class Player
  MIN_AGE = 21
  attr_accessor :name, :age, :money
  def initialize()
    puts "Please enter name:"
    @name = gets.strip
    puts "Please enter age:"
    @age = gets.to_i
    @money = Wallet.new()
    age_verification()
  end

  def age_verification()
    if @age < MIN_AGE
      puts "Get out of here!"
      exit(0)
    end
  end

  def check_amount()
    puts @money.amount === 0 ? "You have no money!" : "You have money!"
  end

end
