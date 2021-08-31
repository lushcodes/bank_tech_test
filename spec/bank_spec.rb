require 'bank'

describe Bank do

  context 'when initialised' do
    it 'has an initial balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end
end