class Bank

  MAXIMUM_BALANCE = 20000

  attr_reader :balance
  def initialize
    @balance = 0
  end

  def deposit(amount)
    fail "Maximum balance exceeded!" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def withdraw(amount)
    fail "Insufficient funds" if (@balance - amount) < 0
    @balance -= amount
  end
end

