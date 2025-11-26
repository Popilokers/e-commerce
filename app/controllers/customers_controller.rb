class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer =Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
      if @customer.save
          redirect_to root_path, notice: "Successfully Registered!"
      else
        Rails.logger.error(@customer.errors.full_messages)
        render :new
      end
  end

    private

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :password,  :address, :province)
    end
end
