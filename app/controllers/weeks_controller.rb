class WeeksController < ApplicationController
  # GET /weeks
  # GET /weeks.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weeks }
    end
  end

  # GET /weeks/1
  # GET /weeks/1.json
  def show
    @week = params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @week }
    end
  end


end
