class Bank
  attr_reader :balances

  def initialize
    @balances = {checking: 0, savings: 0, credit: 100000}
  end

  def balance(account)
    balances[account.to_sym]
  end

  def withdraw(amount, account)
    if balance(account) < amount
      raise "You don't have that much money in #{account}" 
    end
    balances[account.to_sym] -= amount
  end

  def deposit(amount, account)
    balances[account.to_sym] += amount
  end

  def transfer(amount, from, to)
    withdraw(amount, from)
    deposit(amount, to)
  end

end
