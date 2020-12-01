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
  end

end