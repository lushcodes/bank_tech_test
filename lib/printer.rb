class Printer 

  def print(history)
    puts 'date || credit || debit || balance'
    history.each do |record|
      puts "#{record.date} || #{record.credit} || #{record.debit} || #{record.balance}"
    end
  end
end

