require_relative "item_manager"
require_relative "wallet"
class User
  include ItemManager

  attr_accessor :name
  attr_reader :wallet

  def initialize(name)
    @name = name
    puts "test#{self}"
    @wallet = Wallet.new(self)
  end

end
