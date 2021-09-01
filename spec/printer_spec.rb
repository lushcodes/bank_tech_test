# require 'printer'
# require 'record'

# describe Printer do
#   it 'should print the records in the account history' do
#     expect do
#       subject.print
#     end.to output("date || credit || debit || balance\n#{Record.date} || 50.00 || 0.00 || 50.00\n").to_stdout
#   end
# end