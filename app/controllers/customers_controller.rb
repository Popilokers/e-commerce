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
          redirect_to login_path, notice: "Successfully Registered!"
      else
        Rails.logger.error(@customer.errors.full_messages)
      end
  end

  def update
  end

    private

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :password,  :address, :province)
    end
end
