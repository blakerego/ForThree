
require './oauth_util.rb'
require 'net/http'
require 'oauth'
 
o = OauthUtil.new
 
o.consumer_key = 'dj0yJmk9SHRQVVN5M1VlUFZsJmQ9WVdrOVFVWTNOalJFTkdFbWNHbzlNVEkxTnpnNE5UYzJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD03YQ--';
o.consumer_secret = '251cfb9cc952cdf2ea47d24a4172a8eac2b4eb2b';
 
url = 'http://query.yahooapis.com/v1/yql?q=select%20*%20from%20fantasysports.leagues%20where%20league_key%3D\'304.l.18720\'&diagnostics=true';
 
parsed_url = URI.parse( url )



#http.use_ssl =  true;
Net::HTTP.start(parsed_url.host) do | http |
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