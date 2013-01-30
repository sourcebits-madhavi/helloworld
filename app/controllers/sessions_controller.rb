class SessionsController < ApplicationController
  def create
  	customer = Customer.find_by_email(params[:session][:email].downcase)
    if customer && customer.authenticate(params[:session][:password])
      sign_in customer
      redirect_back_or customer
    else
     
      render 'new'
    end
  end

  def new
  end

  def destroy
  	redirect_to root_url
  end
end
