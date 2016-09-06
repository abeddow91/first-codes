class Account
    attr_reader :name, :balance, :type
    def initialize(name, balance=100)
        @name=name
        @balance=balance
        @type="Current Account"
    end

    def display_balance(pin_number)
      puts pin_number = pin ? "#{@type} Balance: $#{@balance}" : pin_error
    end

    def withdraw(pin_number, amount)
        if pin_number == pin
            @balance -= amount
            if @balance<0
              puts "Sorry, you do not have enough in your #{@type}"
              @balance+=amount
              puts "You can only withdraw a maximum of #{@balance}"
            else
            puts "Withdrew #{amount}. New #{@type} balance: #{@balance}"
            end
        else
            puts pin_error
        end
    end

    def deposit(pin_number, amount)
      if pin_number == pin
        @balance+=amount
        puts "Deposited #{amount}. New #{@type} balance: #{@balance}"
      else
        puts pin_error
      end
    end

    private
    def pin
       @pin=1234
    end

    def pin_error
       "Access denied: incorrect PIN."
    end
end

class SavingAccount < Account
  def initialize(name, balance=100)
      @name=name
      @balance=balance
      @type="Saving Account"
  end
end

class CheckingAccount < Account
  def initialize(name, balance=100)
      @name=name
      @balance=balance
      @type="Checking Account"
  end
end

my_account = Account.new("Eric", 1_000_000)
my_account.withdraw(11, 500_000)
my_account.display_balance(1234)
my_account.withdraw(1234, 1_100_000)
my_account.deposit(1234, 500)
my_account.display_balance(1234)

my_saving_account = SavingAccount.new("Anna", 500)
my_saving_account.display_balance(1234)
