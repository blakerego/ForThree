class YahooReceiverController < ApplicationController

  def index
    puts "************************************************"
    @oauth_verifier = params[:oauth_verifier]
  end
end
