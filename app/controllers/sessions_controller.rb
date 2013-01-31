class SessionsController < ApplicationController
  attr_accessor :flag
  def create
  	customer = Customer.find_by_email(params[:session][:email].downcase)
    password = customer.password

    if password == params[:session][:password]
     flag = true
    else flag = false
    end

   if customer && flag

      sign_in customer
      redirect_back_or customer
      
    else
      puts "#{flag}"
      puts "signinnot"
      render 'new'
    end
  end

  def new
  end

  def destroy
  	redirect_to root_url
  end
end
