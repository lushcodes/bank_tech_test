require 'bank'

describe Bank do

  context 'when initialised' do

    it { is_expected.to respond_to(:deposit).with(1).argument }

    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'has an initial balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'should increase the balance by the amount given' do
      subject.deposit(5)
      expect(subject.balance).to eq(5)
    end
  end

  describe '#withdraw' do
    it 'should decrease the balance by the amount given' do
      subject.deposit(5)
      subject.withdraw(5)
      expect(subject.balance).to eq(0)
    end
  end


end