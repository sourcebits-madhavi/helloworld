class UserMailer < ActionMailer::Base
  default from: "madhu.padimi1989@gmail.com"

  def welcome_email(customer)

  	@customer = customer
  	puts "#{customer.email}"
  	mail(:to => customer.email, :subject => "Confirmation mail")
  end
end
