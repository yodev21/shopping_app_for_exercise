require_relative "ownable"
class Wallet
  include Ownable
  attr_reader :balance

  def initialize(owner)
    puts "testtesttest#{owner}"
    puts "tttttt#{self}"
    puts self.methods
    # puts "aaaaaaa#{self.is_a?}"
    self.owner = owner
    @balance = 0
  end

  def deposit(amount)
    @balance += amount.to_i
  end

  def withdraw(amount)
    return unless @balance >= amount
    @balance -= amount.to_i
    amount
  end

end