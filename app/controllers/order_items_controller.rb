class OrderItemsController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:orderid])
    @items = @order.order_items
  end
end
