# frozen_string_literal: true

require 'timecop'

# RECORD CLASS
class Record
  attr_reader :date, :balance, :credit, :debit

  def initialize(credit:, debit:, balance:)
    @date = Date.today.strftime('%d/%m/%Y') # date formatting
    @credit = format('%.2f', credit)
    @debit = format('%.2f', debit)
    @balance = format('%.2f', balance)
  end
end
