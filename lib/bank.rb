class Bank 

  attr_reader :balance
  def initialize
    @balance = 0

  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    fail "Insufficient funds" if (@balance - amount) < 0
    @balance -= amount
  end
end
