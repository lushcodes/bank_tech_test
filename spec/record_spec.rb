require 'record'
require 'timecop'

describe Record do
  
  before :each do
    subject { described_class.new }
  end

  context 'when initialised' do
    before do
      Timecop.freeze(Time.now)
    end

    after do
      Timecop.return
    end

   it 'return the date the record was made' do
     expect(subject.log_date).to eq(Time.now)
   end
  end
end