
require './oauth_util.rb'
require 'net/http'
require 'oauth'
 
o = OauthUtil.new
 
o.consumer_key = 'dj0yJmk9SHRQVVN5M1VlUFZsJmQ9WVdrOVFVWTNOalJFTkdFbWNHbzlNVEkxTnpnNE5UYzJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD03YQ--';
o.consumer_secret = '251cfb9cc952cdf2ea47d24a4172a8eac2b4eb2b';


#######  CREATE HTTPS REQUEST ###################
test_string = 'https://api.login.yahoo.com/oauth/v2/  
 get_request_token?oauth_nonce=ce2130523f788f313f76314ed3965ea6  
 &oauth_timestamp=1361416583  
 &oauth_consumer_key=dj0yJmk9SHRQVVN5M1VlUFZsJmQ9WVdrOVFVWTNOalJFTkdFbWNHbzlNVEkxTnpnNE5UYzJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD03YQ  
 &oauth_signature_method=plaintext  
 &oauth_signature=251cfb9cc952cdf2ea47d24a4172a8eac2b4eb2b%26  
 &oauth_version=1.0  
 &xoauth_lang_pref="en-us"  
 &oauth_callback="http://localhost:3000/yahoo_receiver"'


require "net/https"
require "uri"

uri = URI.parse(URI.encode(test_string))
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)
response.body
response.status
response["header-here"] # All headers are lowercase 

#######  END HTTPS REQUEST ###################


 
url = URI.parse( URI.encode(test_string) )


req = Net::HTTP.new(url.path)
req.use_ssl = true
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body


#http.use_ssl =  true;
Net::HTTP.start(parsed_url.host) do | http |
  # req = Net::HTTP::Get.new "#{ parsed_url.path }?#{ o.sign(parsed_url).query_string }"
  req = Net::HTTP::Get.new "#{ parsed_url.path }?#{ o.sign(parsed_url).query_string }"
  response = http.request(req)
  puts req
  puts response.read_body
end
  

#@consumer=OAuth::Consumer.new o.consumer_key,
#							o.consumer_secret,
#							{:site=>"http://query.yahooapis.com"}
#
#@request_token = @consumer.get_request_token
#
#puts @request_token.authorize_url