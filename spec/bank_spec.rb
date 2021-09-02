# frozen_string_literal: true

require 'bank'
require 'timecop'

describe Bank do
  subject { described_class.new }

  context 'when initialised' do
    it 'should initialize with a printer' do
      printer = double('printer')
      allow(Printer).to receive(:new) { printer }
      expect(subject.printer).to eq(printer)
    end

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

    it 'should add the deposit details to the history when called' do
      record = double('record')
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

    it 'should return an error if balance would drop below 0 when called' do
      expect { subject.withdraw(10) }.to raise_error 'Insufficient funds'
    end

    it 'should add the withdrawal details to the history when called' do
      record = double('record')
      allow(Record).to receive(:new) { record }

      subject.deposit(10)
      subject.withdraw(5)
      expect(subject.history.last).to be(record)
    end
  end

  describe '#print_statement' do
    it 'calls the printer print method' do
      printer = double('printer')
      allow(Printer).to receive(:new) { printer }
      expect(printer).to receive(:print).with(subject.history)
      subject.print_statement
    end
  end
end
