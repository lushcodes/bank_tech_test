# frozen_string_literal: true

require 'bank'
require 'timecop'
require 'record'

describe Bank do

  before :each do
    subject { described_class.new }
  end

  context 'when initialised' do
    it { is_expected.to respond_to(:deposit).with(1).argument }
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'has an initial balance of 0' do
      expect(subject.balance).to eq(0.00)
    end

    it 'starts with an empty history' do
      expect(subject.history).to eq([])
    end
  end

  describe '#deposit' do

    it 'should increase the balance by the amount given' do
      subject.deposit(5)
      expect(subject.balance).to eq(5.00)
    end

    it 'should return an error if balance exceeds the maximum balance' do
      expect { subject.deposit(20_001.00) }.to raise_error 'Maximum balance exceeded!'
    end

    it 'creates a record class' do
      record = double("record")
      allow(Record).to receive(:new) { record }

      subject.deposit(10)
      expect(subject.history).to include(record)

    end
  end

  describe '#withdraw' do
    it 'should decrease the balance by the amount given' do
      subject.deposit(5)
      subject.withdraw(5)
      expect(subject.balance).to eq(0.00)
    end

    it 'should return an error if balance would drop below 0 when trying to withdraw' do
      expect { subject.withdraw(10) }.to raise_error 'Insufficient funds'
    end

    it 'should add the withdrawal details to the history' do
      record = double("record")
      allow(Record).to receive(:new) { record }

      subject.deposit(10)
      subject.withdraw(5)
      expect(subject.history.last).to be(record)
    end
  end

  describe '#print_statement' do
    it 'should print the records in the account history' do
      date = Date.today.strftime('%d/%m/%Y')
      subject.deposit(50)
      expect do
        subject.print_statement
      end.to output("date || credit || debit || balance\n#{date} || 50.00 || 0.00 || 50.00\n").to_stdout
    end
  end
end
