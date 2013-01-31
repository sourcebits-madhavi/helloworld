class Customer < ActiveRecord::Base

  attr_accessible :email, :password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence:   true,
	                    format:     { with: VALID_EMAIL_REGEX },
	                    uniqueness: { case_sensitive: false }

  before_save { |customer| customer.email = email.downcase }
  before_save :create_remember_token

  def self.search(search)
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"


     puts "*****************************************"

      require 'net/http'

      url = URI.parse('http://freegeoip.net/json/50.16.105.214')
      req = Net::HTTP::Get.new(url.path)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }

      puts res.body

      require 'json'

      hash = JSON.parse(res.body)

      puts hash

      puts "*****************************************"

      hash.keys.sort.each do |key|

      puts "#{key}----- #{hash[key]}"

    end

  end

   private

    	def create_remember_token
      		self.remember_token = SecureRandom.urlsafe_base64
    	end

  
end
