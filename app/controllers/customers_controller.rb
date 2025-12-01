class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer =Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.points ||= 0
      if @customer.save
          redirect_to login_path, notice: "Successfully Registered!"
      else
        Rails.logger.error(@customer.errors.full_messages)
        # Re-render the form so user can fix mistakes
        flash.now[:alert] = "Please fix the errors below."
      end
  end

  def update
  end

    private

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :password,  :address, :province_id, :points)
    end
end
