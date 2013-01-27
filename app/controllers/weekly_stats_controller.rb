class WeeklyStatsController < ApplicationController
  # GET /weekly_stats
  # GET /weekly_stats.json
  def index

    week_number = params[:week_number]

    if week_number.nil?
      @weekly_stats = WeeklyStat.all
    else 
      @weekly_stats = WeeklyStat.find_all_by_week_number(week_number)
    end

    puts @weekly_stats.size

    puts '******************************************************'
    puts @weekly_stats.to_json(:include => [:team])
    puts '******************************************************'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weekly_stats.to_json(:include => [:team]) }
      format.js { render json: @weekly_stats.to_json(:include => [:team]) }      
    end
  end

  # GET /weekly_stats/1
  # GET /weekly_stats/1.json
  def show
    @weekly_stat = WeeklyStat.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weekly_stat.to_json(:include => [:team]) }
      format.js { render :layout=>false }
    end
  end

  # GET /weekly_stats/new
  # GET /weekly_stats/new.json
  def new
    @weekly_stat = WeeklyStat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weekly_stat }
    end
  end

  # GET /weekly_stats/1/edit
  def edit
    @weekly_stat = WeeklyStat.find(params[:id])
  end

  # POST /weekly_stats
  # POST /weekly_stats.json
  def create

    puts '******************** Creating Weekly Stats ***************************'
    puts params[:team]
    
    teamName = params[:team][:name]
    puts(teamName)


    team = Team.find_by_name(teamName)
    if team.nil? && !teamName.nil?
      team = Team.create(:name => teamName)
    end


    #@weekly_stat = WeeklyStat.new(params[:weekly_stat])

    
    @weekly_stat = WeeklyStat.find_by_team_id_and_week_number(team.id, params[:weekly_stat][:week_number])
    #stats = WeeklyStat.where("team_id = ? AND week_number = ?", team.id, params[:weekly_stat][:week_number])
    updateSuccessful = false

    if (@weekly_stat.nil?)
      puts '############# No existing stat found :( ###############################'            
      @weekly_stat = WeeklyStat.new(params[:weekly_stat])
      updateSuccessful = @weekly_stat.save
    else 
      puts '############# FOUND EXISTING STAT RECORD ###############################'   
      updateSuccessful = @weekly_stat.update_attributes(params[:weekly_stat])   
    end
    
    @weekly_stat.team = team



    respond_to do |format|
      if updateSuccessful
        format.html { redirect_to @weekly_stat, notice: 'Weekly stat was successfully created.' }
        format.json { render json: @weekly_stat, status: :created, location: @weekly_stat }
      else
        format.html { render action: "new" }
        format.json { render json: @weekly_stat.errors, status: :unprocessable_entity }
      end
    end
  end



  # PUT /weekly_stats/1
  # PUT /weekly_stats/1.json
  def update
    @weekly_stat = WeeklyStat.find(params[:id])

    respond_to do |format|
      if @weekly_stat.update_attributes(params[:weekly_stat])
        format.html { redirect_to @weekly_stat, notice: 'Weekly stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weekly_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekly_stats/1
  # DELETE /weekly_stats/1.json
  def destroy
    @weekly_stat = WeeklyStat.find(params[:id])
    @weekly_stat.destroy

    respond_to do |format|
      format.html { redirect_to weekly_stats_url }
      format.json { head :no_content }
    end
  end
end
