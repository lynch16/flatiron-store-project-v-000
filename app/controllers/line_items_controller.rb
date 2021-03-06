class LineItemsController < ApplicationController

  def create
    @item = Item.find_by(id: params[:item_id])
    if current_cart.nil?
      current_user.current_cart = Cart.create
    end

    current_cart.line_items << current_cart.add_item(@item.id)
    current_cart.save
    redirect_to cart_path(current_cart)
  end
end
