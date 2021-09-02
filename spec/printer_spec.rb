# frozen_string_literal: true

require 'printer'

describe Printer do
  describe '#print' do
    it 'should print the records in the account history' do
      record = double('record', balance: '600.00', credit: '400.00', debit: '400.00', date: '01/09/201')
      history = [record]
      expect do
        subject.print(history)
      end.to output("date || credit || debit || balance\n
        #{record.date} ||
        #{record.credit} ||
        #{record.debit} || #{record.balance}\n").to_stdout
    end
  end
end
