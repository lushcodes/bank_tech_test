require 'bank'
require 'timecop'

describe Bank do

  before :each do
    subject { described_class.new }
  end

  context 'when initialised' do
    it { is_expected.to respond_to(:deposit).with(1).argument }
    it { is_expected.to respond_to(:withdraw).with(1).argument }
    it 'has an initial balance of 0' do
      expect(subject.balance).to eq(0)
    end
    it 'has todays date' do
      expect(subject.date).to eq(Date.today.strftime('%d/%m/%Y'))
    end

    it 'starts with an empty history' do
      expect(subject.history).to eq([])
    end
  end

  describe '#deposit' do
    it 'should increase the balance by the amount given' do
      subject.deposit(5)
      expect(subject.balance).to eq(5)
    end

    it 'should return an error if balance exceeds the maximum balance' do
      expect{ subject.deposit(20001) }.to raise_error "Maximum balance exceeded!"
    end

    it 'should add the deposit details to the history' do
      subject.deposit(10)
      expect(subject.history).to include({:balance => subject.balance, :credit => 10, :date => subject.date, :debit => 0 })
    end
  end

  describe '#withdraw' do
    it 'should decrease the balance by the amount given' do
      subject.deposit(5)
      subject.withdraw(5)
      expect(subject.balance).to eq(0)
    end

    it 'should return an error if balance would drop below 0 when trying to withdraw' do
      expect{ subject.withdraw(10) }.to raise_error "Insufficient funds"
    end

    it 'should add the withdrawal details to the history' do
      subject.deposit(20)
      subject.withdraw(10)
      expect(subject.history).to include({:balance => subject.balance, :credit => 0, :date => subject.date, :debit => 10 })
    end
  end

  describe '#print_statement' do
    it 'should print the records in the account history' do
      subject.deposit(50)
      expect {subject.print_statement }.to output("date || credit || debit || balance\n#{subject.date} || 50 || 0 || 50\n").to_stdout
    end
  end


end