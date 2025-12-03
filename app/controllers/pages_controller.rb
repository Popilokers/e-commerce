class PagesController < ApplicationController
  def login
    
  end
  
  def login_check
    @customer = Customer.find_by(email: params[:email])
    
    if @customer&.authenticate(params[:password])

      session[:customer_first_name] = @customer.first_name   
      session[:customer_last_name] = @customer.last_name   
      session[:customer_full] = @customer.full_name    
      session[:customer_email] = @customer.email    
      session[:customer_id] = @customer.id    
      session[:customer_address] = @customer.address    
      session[:customer_province] = @customer.province.code   
      session[:customer_points] = @customer.points
      session[:province_id] = @customer.province.id   
      session[:province_gst] = @customer.province.gst   
      session[:province_pst] = @customer.province.pst   
      session[:province_hst] = @customer.province.hst   
      session[:cart] ||= []

      flash[:notice] = "Login successful"
      redirect_to root_path
    else
      flash[:alert] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def logout
    session[:customer_first_name] = nil
    session[:customer_last_name] = nil
    session[:customer_full] = nil
    session[:customer_email] = nil
    session[:customer_id] = nil
    session[:customer_address] = nil
    session[:customer_province] = nil
    session[:province_id] = nil
    session[:province_gst] = nil 
    session[:province_pst] = nil  
    session[:province_hst] = nil  
    session[:cart] = nil
    redirect_to login_path
  end

  def register
  end

  def cart
    # session[:cart] might be nil the first time, so we default to empty array
    @cart_items = (session[:cart] || []).map do |item|
      product = Product.find_by(id: item["product_id"])
      quantity = item["quantity"]
      price = product.price
      { product: product, quantity: quantity, price: price}
    end
  end

  def removeFromCart
    session[:cart] ||= []

    index = params[:index].to_i

    if index >= 0 && index < session[:cart].length
      session[:cart].delete_at(index)
      flash[:notice] = "Product removed from cart!"
    else
      flash[:alert] = "Invalid item!"
    end

    redirect_to cart_path
  end

  def update_quantity
    Rails.logger.info "Before update: #{session[:cart].inspect}"
    session[:cart] ||= []

    index = params[:index].to_i
    quantity = params[:quantity].to_i

    quantity = 1 if quantity < 1
      if index >= 0 && index < session[:cart].length
        session[:cart][index]["quantity"] = quantity
        head :ok
      else
        head :unprocessable_entity
      end
  end

  def update_province
      if params[:province_id].present?
        province = Province.find(params[:province_id])
        session[:province_id] = province.id
        session[:province_pst] = province.pst
        session[:province_gst] = province.gst
        session[:province_hst] = province.hst
      end

    @cart_items = session[:cart] || []
    redirect_to cart_path
  end

  def checkout

  end

  def invoice
    # session[:cart] might be nil the first time, so we default to empty array
    @cart_items = (session[:cart] || []).map do |item|
      product = Product.find_by(id: item["product_id"])
      quantity = item["quantity"]
      { product: product, quantity: quantity }
    end
  end

  def customer_info

  end

  def about
  end

  def contact
  end
end
