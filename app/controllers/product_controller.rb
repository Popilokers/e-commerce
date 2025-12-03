class ProductController < ApplicationController
  def index
    @products = Product.all

    # apply search filter
    if params[:query].present?
      @products = @products.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%")
    end

    # apply category filter
    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end

    if params[:date_filter].present?
      if params[:date_filter] == 'new'
        @products = @products.where("created_at >= ?", 3.days.ago)
      elsif params[:date_filter] == 'update'
        @products = @products.where("updated_at >= ? AND DATE(updated_at) != DATE(created_at)", 3.days.ago)
      end
    end

    # paginate *after* filtering
    @products = @products.page(params[:page]).per(9)
  end


  def show
    @product = Product.find(params[:id])
  end

  def addToCart
    session[:cart] ||=[]
    @product = Product.find(params[:id])
    flash[:notice] = "#{@product.name} added to cart!"
    session[:cart] << { product_id: @product.id, quantity: params[:quantity].to_i, price: @product.price.to_f }
     puts session[:cart].inspect 
    redirect_to root_path
  end
end
