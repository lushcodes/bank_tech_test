# frozen_string_literal: true

require 'timecop'

# BANK CLASS
class Bank
  MAXIMUM_BALANCE = 20_000

  attr_reader :balance, :date, :history, :credit, :debit

  def initialize
    @balance = 0.00
    @date = Date.today.strftime('%d/%m/%Y') # date formatting
    @history = []
  end

  def deposit(amount)
    raise 'Maximum balance exceeded!' if (@balance + amount) > MAXIMUM_BALANCE

    @balance += amount
    @history << { balance: format('%.2f', @balance), credit: '%.2f' % amount, date: @date, debit: format('%.2f', 0) }
  end

  def withdraw(amount)
    raise 'Insufficient funds' if (@balance - amount).negative?

    @balance -= amount
    @history << { balance: format('%.2f', @balance), credit: format('%.2f', 0), date: @date, debit: '%.2f' % amount }
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @history.each do |record|
      puts "#{record[:date]} || #{record[:credit]} || #{record[:debit]} || #{record[:balance]}"
    end
  end
end
