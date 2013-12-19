require 'rubygems'
require 'oauth'
require 'json'

class Twitter
  def intialize(searchterm)
    baseurl = "https://api.twitter.com"
    path    = "/1.1/statuses/search/tweets.json"
    query   = URI.encode_www_form("q" => searchterm )
    address = URI("#{baseurl}#{path}?#{query}")
    request = Net::HTTP::Get.new address.request_uri
  
    #do i show?
    
  
    # Set up HTTP.
    http             = Net::HTTP.new address.host, address.port
    http.use_ssl     = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    consumer_key ||= OAuth::Consumer.new "6rDmJYkHZgugK046HLL9w", "h2cH2KoDQxSiWgkkF8L7Vpw6UvLoRxGhnpPZEZsW5Q"

 
    request.oauth! http, consumer_key
    http.start
    response = http.request request

  
    tweet = nil
    if response.code == '200' then
      tweet = JSON.parse(response.body)
      search(tweet)
    end
   end 
   
  def search(tweet)
    
    @title = 'Twitter'
    @text = tweet
  end
  def html()
    Cards.cardTemplate( @image ,@title, @text)
  end
  def show
      true
  end
end
