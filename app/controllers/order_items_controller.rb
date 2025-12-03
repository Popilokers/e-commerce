class OrderItemsController < ApplicationController
  def show
    @order = Order.find(params[:order_id])
    @items = @order.order_items
  end
end
