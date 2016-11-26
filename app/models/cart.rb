class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = line_items.collect do |line_item|
      item = Item.find(line_item.item_id)
      (item.price * line_item.quantity)
    end
    total.reduce(0.0, :+)
  end

  def add_item(new_item)
    line_item = line_items.find_by(item_id: new_item)
    if !!line_item
      line_item.quantity += 1
      line_item.save
    else
      line_item = LineItem.new(item_id: new_item, cart_id: self.id)
    end
    line_item
  end
end
