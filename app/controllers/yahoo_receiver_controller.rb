class YahooReceiverController < ApplicationController

  def index
    puts "************************************************"
      if (!params[:oauth_verifier].nil?)
        @oauth_verifier = params[:oauth_verifier]
      end
  end
end
