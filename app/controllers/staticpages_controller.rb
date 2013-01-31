class StaticpagesController < ApplicationController
  def home
  end
  def search

      require 'net/http'

      ip_address=params[:search]
     # url = URI.parse('http://freegeoip.net/json/50.16.105.214')
      url = URI.parse('http://freegeoip.net/json/'+ip_address)
      req = Net::HTTP::Get.new(url.path)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }

      require 'json'

      @hash = JSON.parse(res.body)

      puts "*****************************************"

      @hash.keys.sort.each do |key|

          puts "#{key}----- #{@hash[key]}"

      end

      respond_to do |format|
        format.js #{render :content_type => 'text/javascript', :locals => {:hash => @hash}}
      end

  end
end
