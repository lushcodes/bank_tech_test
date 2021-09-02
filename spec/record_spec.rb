# frozen_string_literal: true

require 'record'
require 'timecop'

describe Record do
  describe '#initialize' do
    before :each do
      @subject = Record.new(balance: 0, credit: 1000, debit: 0)
    end

    it 'has todays date' do
      expect(@subject.date).to eq(Date.today.strftime('%d/%m/%Y'))
    end

    it 'should have a balance of 0' do
      expect(@subject.balance).to eq('0.00')
    end

    it 'should have a credit of 1000' do
      expect(@subject.credit).to eq('1000.00')
    end

    it 'should have a debit of 0' do
      expect(@subject.debit).to eq('0.00')
    end
  end
end
