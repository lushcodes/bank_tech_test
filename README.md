# Bank Tech Test

This is a command line application that allows a user to make deposits and withdrawals to their account. It returns a bank statement that shows the user a history of their transactions and a record of when those transactions were made.

### How to run

1. Clone the repo to your local machine
2. Run ```bundle install ``` to install the required gems
3. Open the irb REPL in your terminal (irb) and enter the below:

Example Input:

```
% require './lib/bank'
% bank = Bank.new
% bank.deposit(300)
% bank.withdraw(150)
% bank.print_statement

```
Example Output:

```
date        || credit || debit || balance
01/09/2021  || 300     || 0    || 300
01/09/2021  || 0       || 150  || 150 

```

### How to test

1. Once you have run 'bundle install', run rspec in your terminal to run the test suite.

### Approach

This project was completed using a TDD approach. I made sure to not write any code unless I had written a failing test for it first.
I then passed that test with the simplest code I could and refactored if necessary.

I started by making sure that the balance started at 0 and could not go above/below set amounts. I then made sure deposit and withdrawal methods were working correctly before moving on to the next phase which was adding the record to a history when a deposit or withdrawal was made.

After that I created a method to allow the printing of the history to the console.

The project is linted and has 100% test coverage.

### Improvements

As amazing and functional as the app is, ideally I would like to learn how to separate the functionality into 3 classes.

I have diagrammed my thought process below:

![Domain Model & CRC Cards](./dom-model.png)

I would also try to use mocking for the behaviour of the different classes when testing.



