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
        @products = @products.where("updated_at >= ?", 3.days.ago)
      end
    end

    # paginate *after* filtering
    @products = @products.page(params[:page]).per(9)
  end


  def show
    @product = Product.find(params[:id])
  end

  def addToCart
  end
end
