class StaticpagesController < ApplicationController
  def home
  end
  def search
  	
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
end
