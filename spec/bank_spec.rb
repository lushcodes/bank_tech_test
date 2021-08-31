require 'bank'

describe Bank do
  
  it { is_expected.to respond_to(:deposit).with(1).argument }

  context 'when initialised' do

    it { is_expected.to respond_to(:deposit).with(1).argument }

    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'has an initial balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end


end