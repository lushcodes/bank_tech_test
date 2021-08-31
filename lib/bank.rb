require 'timecop'

class Bank

  MAXIMUM_BALANCE = 20000

  attr_reader :balance, :date, :history

  def initialize
    @balance = 0
    @date = Date.today.strftime("%d/%m/%Y")
    @history = []
  end

  def deposit(amount)
    fail "Maximum balance exceeded!" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
    @history << { :balance => @balance, :credit => amount, :date => @date, :debit => 0 }
  end

  def withdraw(amount)
    fail "Insufficient funds" if (@balance - amount) < 0
    @balance -= amount
    @history << { :balance => @balance, :credit => 0, :date => @date, :debit => amount }
  end

  def print_statement

  end
end

