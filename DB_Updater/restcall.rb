require 'oauth'
#
#
#@callback_url = "http://127.0.0.1:3000/oauth/callback"
#
#@consumer = OAuth::Consumer.new(
#	"dj0yJmk9SWVLZjV4cnBPY1FBJmQ9WVdrOVFVWTNOalJFTkdFbWNHbzlNVEkxTnpnNE5UYzJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD0yNw--",
#	"5ba1bca4d7fcdc74420a778127eb24bebd14d6dc",
#	:site => "https://query.yahooapis.com/v1/yql?q=select%20*%20from%20fantasysports.leagues%20where%20league_key%3D'304.l.18720'&diagnostics=true")
#
#@request_token = @consumer.get_request_token(:oauth_callback => @callback_url)
#session[:request_token] = @request_token
#redirect_to @request_token.authorize_url(:oauth_callback => @callback_url)


consumer = OAuth::Consumer.new(	"dj0yJmk9SWVLZjV4cnBPY1FBJmQ9WVdrOVFVWTNOalJFTkdFbWNHbzlNVEkxTnpnNE5UYzJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD0yNw--",
 "5ba1bca4d7fcdc74420a778127eb24bebd14d6dc", {
        :site => "https://query.yahooapis.com/v1/public/yql?q=show%20tables&diagnostics=true/"})

requestToken = consumer.get_request_token