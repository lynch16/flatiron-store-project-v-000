class CartsController < ApplicationController

  def checkout
    @cart = current_cart
    @cart.line_items.each do |line_item|
      item = Item.find(line_item.item_id)
      item.inventory -= line_item.quantity
      item.save
    end
    current_user.current_cart = nil
    current_user.save
    @cart.status = "submitted"
    @cart.save
    redirect_to cart_path(@cart)
  end

end
