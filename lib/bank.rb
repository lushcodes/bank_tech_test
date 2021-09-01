# frozen_string_literal: true

require 'timecop'
require_relative 'record'
require_relative 'printer'

# BANK CLASS

class Bank
  MAXIMUM_BALANCE = 20_000

  attr_reader :balance, :history, :printer

  def initialize
    @printer = Printer.new
    @balance = 0.00
    @history = []
  end

  def deposit(amount)
    raise 'Maximum balance exceeded!' if (@balance + amount) > MAXIMUM_BALANCE

    @balance += amount
    @history << Record.new(balance: @balance, credit: amount, debit: 0)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if (@balance - amount).negative?

    @balance -= amount
    @history << Record.new(balance: @balance, credit: 0, debit: amount)
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @history.each do |record|
      puts "#{record.date} || #{record.credit} || #{record.debit} || #{record.balance}"
    end
  end
end
