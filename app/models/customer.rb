class Customer < ActiveRecord::Base

  attr_accessible :email, :password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence:   true,
	                    format:     { with: VALID_EMAIL_REGEX },
	                    uniqueness: { case_sensitive: false }

  before_save { |customer| customer.email = email.downcase }
  before_save :create_remember_token

   private

    	def create_remember_token
      		self.remember_token = SecureRandom.urlsafe_base64
    	end

  
end
