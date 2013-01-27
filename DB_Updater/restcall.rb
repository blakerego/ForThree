
require './oauth_util.rb'
require 'net/http'
require 'oauth'
 
o = OauthUtil.new
 
o.consumer_key = 'dj0yJmk9SWVLZjV4cnBPY1FBJmQ9WVdrOVFVWTNOalJFTkdFbWNHbzlNVEkxTnpnNE5UYzJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD0yNw--';
o.consumer_secret = '5ba1bca4d7fcdc74420a778127eb24bebd14d6dc';
 
url = 'http://query.yahooapis.com/v1/yql?q=select%20*%20from%20fantasysports.leagues%20where%20league_key%3D\'304.l.18720\'&diagnostics=true';
 
#parsed_url = URI.parse( url )



#http.use_ssl =  true;
#Net::HTTP.start(parsed_url.host) do | http |
#  req = Net::HTTP::Get.new(url.request_uri)
#  response = http.request(req)
#  print req
#  print response.read_body
#  

@consumer=OAuth::Consumer.new o.consumer_key,
							o.consumer_secret,
							{:site=>"http://query.yahooapis.com"}

@request_token = @consumer.get_request_token

puts @request_token.authorize_url