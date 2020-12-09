require_relative "item_manager"
require_relative "ownable"
class Cart
  include Ownable
  include ItemManager

  def initialize(owner)
    self.owner = owner
    @items = []
  end

  def items
    @items
  end

  def add(item)
    @items << item
  end

  def total_amount
    @items.sum(&:price)
  end

  def check_out
    # ## 要件
    #   - カートの中身（Cart#items）のすべてのアイテムの購入金額が、カートのオーナーのウォレットからアイテムのオーナーのウォレットに移されること。
    self.owner.wallet.withdraw(self.total_amount)
    @items.first.owner.wallet.deposit(self.total_amount)

    #   - カートの中身（Cart#items）のすべてのアイテムのオーナー権限が、カートのオーナーに移されること。
    @items.map do |item|
      item.owner = self.owner
    end

    #   - カートの中身（Cart#items）が空になること。
    @items = []
  end

end