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
    
    # @client_data = {};
    # @client_data[:assists] = @assists;
    # @client_data[:blocks] = @blocks;
    # @client_data[:field_goal_percentage] = @fgp;
    # @client_data[:free_throw_percentage] = @ftp;
    # @client_data[:rebounds] = @rebounds; 
    # @client_data[:steals] = @steals; 
    # @client_data[:total_points] = @points; 
    # @client_data[:turnovers] = @turnovers; 
    # @client_data = @client_data.to_json;

    @client_data = [@tpm, @assists, @blocks, @rebounds, @steals, @points].to_json;

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @week }
    end
  end


end
