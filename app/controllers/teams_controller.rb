class TeamsController < ApplicationController
  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @assists = []
    @blocks = []
    @field_goal_percentage = []
    @free_throw_percentage = []
    @rebounds = []
    @steals = []
    @three_pointers_made = []
    @total_points = []
    @turnovers = []



    @team = Team.find(params[:id])

    @teamWeeklyStats = WeeklyStat.find_all_by_team_id(@team.id, :order => 'week_number ASC')

    ####################### Generating Numbers Relating to the Team #################################
    @teamWeeklyStats.each do |stat|
      @assists.push({:week_number => stat.week_number, :value => stat.assists})
      @blocks.push({:week_number => stat.week_number, :value => stat.blocks })
      @field_goal_percentage.push({:week_number => stat.week_number, :value => stat.field_goal_percentage})
      @free_throw_percentage.push({:week_number => stat.week_number, :value => stat.free_throw_percentage})
      @rebounds.push({:week_number => stat.week_number, :value => stat.rebounds })
      @steals.push({:week_number => stat.week_number, :value => stat.steals})
      @three_pointers_made.push({:week_number => stat.week_number, :value => stat.three_pointers_made})
      @total_points.push({:week_number => stat.week_number, :value => stat.total_points})
      @turnovers.push({:week_number => stat.turnovers, :value => stat.turnovers})
    end

    @assists = @assists.to_json
    @blocks = @blocks.to_json
    @field_goal_percentage = @field_goal_percentage.to_json
    @free_throw_percentage = @free_throw_percentage.to_json
    @rebounds = @rebounds.to_json
    @steals = @steals.to_json
    @three_pointers_made = @three_pointers_made.to_json
    @total_points = @total_points.to_json
    @turnovers = @turnovers.to_json


    ####################### Generating League Averages #################################################

    @leagueAssistAvgs = GetArrayFromQuery(WeeklyStat.average(:assists, :group => :week_number, :order => 'week_number ASC'));
    @leagueBlocksAvgs = GetArrayFromQuery(WeeklyStat.average(:blocks, :group => :week_number, :order => 'week_number ASC'));
    @leagueFGPAvgs = GetArrayFromQuery(WeeklyStat.average(:field_goal_percentage, :group => :week_number, :order => 'week_number ASC'));
    @leagueFTPAvgs = GetArrayFromQuery(WeeklyStat.average(:free_throw_percentage, :group => :week_number, :order => 'week_number ASC'));
    @leagueReboundsAvgs = GetArrayFromQuery(WeeklyStat.average(:rebounds, :group => :week_number, :order => 'week_number ASC'));
    @leagueStealsAvgs = GetArrayFromQuery(WeeklyStat.average(:steals, :group => :week_number, :order => 'week_number ASC'));
    @league3PMAvgs =GetArrayFromQuery(WeeklyStat.average(:three_pointers_made, :group => :week_number, :order => 'week_number ASC'));
    @leaguePointsAvgs = GetArrayFromQuery(WeeklyStat.average(:total_points, :group => :week_number, :order => 'week_number ASC'));
    @leagueTurnoversAvgs = GetArrayFromQuery(WeeklyStat.average(:turnovers, :group => :week_number, :order => 'week_number ASC'));

    ####### Merge Team Assists and League Averages into a single hash. ###############################
    ## use as reference: http://www.ruby-doc.org/core-1.9.3/Hash.html#method-i-merge
    #@leagueAssistAvgs = @leagueAssistAvgs.merge(@assists)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  def GetArrayFromQuery(collection)
    result = []
    collection.each do |week_number, value|
      result.push({:week_number => week_number, :value => value})
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
end
