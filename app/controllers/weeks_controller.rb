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

    @weekStats = WeeklyStat.find_all_by_week_number(params[:id])

    # Return key, value pairs for each statistical category. 
    

    # attr_accessible  :three_pointers_made
    # attr_accessible  :assists
    # attr_accessible  :blocks
    # attr_accessible  :field_goal_percentage
    # attr_accessible  :free_throw_percentage
    # attr_accessible  :rebounds
    # attr_accessible  :steals
    # attr_accessible  :team_id
    # attr_accessible  :week_number
    # attr_accessible  :turnovers
    # attr_accessible  :total_points


    @teamNames = [];
    @tpm = []; 
    @assists = [];
    @blocks = []; 
    @fgp = []; 
    @ftp = []; 
    @rebounds = []; 
    @steals = []; 
    @points = []; 
    @turnovers = []; 

    @weekStats.each do |week| 
      @teamNames.append(week.team.name); 
      @tpm.append(week.three_pointers_made); 
      @assists.append(week.assists);
      @blocks.append(week.blocks); 
      @fgp.append(week.field_goal_percentage); 
      @ftp.append(week.free_throw_percentage); 
      @rebounds.append(week.rebounds); 
      @steals.append(week.steals); 
      @points.append(week.total_points);
      @turnovers.append(week.turnovers); 
    end


    @weekStats = @weekStats.to_json;    
    @teamNames = @teamNames.to_json; 
    
    @client_data = [@tpm, @assists, @blocks, @fgp, @ftp, @rebounds, @steals, @points, @turnovers].to_json;
    @dataMap = {
      0 => "3PM", 
      1 => "Assists", 
      2 => "Blocks", 
      3 => "FG%", 
      4 => "FT%", 
      5 => "Rebounds", 
      6 => "Steals", 
      7 => "Points", 
      8 => "TO"
    }.to_json
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @week }
    end
  end


end
