# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create the teams
team1 = Team.create(:name => 'KingJames')
team2 = Team.create(:name => 'Gangster Clowns')
team3 = Team.create(:name => 'The Real Beal')
team4 = Team.create(:name => 'TheLarrySandersShow')
team5 = Team.create(:name => 'UncleDrew')
team6 = Team.create(:name => 'Heatles!')
team7 = Team.create(:name => 'thee LAKE show')
team8 = Team.create(:name => 'Ray-gun Allen')
team9 = Team.create(:name => 'RUNDLC')
team10 = Team.create(:name => 'Blakers')
team11 = Team.create(:name => 'The Manimals')
team12 = Team.create(:name => 'Victorious Secret')
team13 = Team.create(:name => 'Legends of the Ball')
team14 = Team.create(:name => 'Bosh.0')
team15 = Team.create(:name => 'knicks2013champs')
team16 = Team.create(:name => 'BALLER17')

#Create a portion of the schedule in the matchup table
Matchup.create(:week_number => 9,
	:team1_id => team5.id,
	:team2_id => team2.id)
Matchup.create(:week_number => 9,
	:team1_id => team9.id,
	:team2_id => team16.id)
Matchup.create(:week_number => 9,
	:team1_id => team12.id,
	:team2_id => team1.id)
Matchup.create(:week_number => 9,
	:team1_id => team4.id,
	:team2_id => team7.id)
Matchup.create(:week_number => 9,
	:team1_id => team14.id,
	:team2_id => team11.id)
Matchup.create(:week_number => 9,
	:team1_id => team10.id,
	:team2_id => team13.id)
Matchup.create(:week_number => 9,
	:team1_id => team6.id,
	:team2_id => team3.id)
Matchup.create(:week_number => 9,
	:team1_id => team15.id,
	:team2_id => team8.id)


Matchup.create(:week_number => 10,
	:team1_id => team5.id,
	:team2_id => team9.id)
Matchup.create(:week_number => 10,
	:team1_id => team16.id,
	:team2_id => team12.id)
Matchup.create(:week_number => 10,
	:team1_id => team1.id,
	:team2_id => team7.id)
Matchup.create(:week_number => 10,
	:team1_id => team11.id,
	:team2_id => team4.id)
Matchup.create(:week_number => 10,
	:team1_id => team14.id,
	:team2_id => team10.id)
Matchup.create(:week_number => 10,
	:team1_id => team15.id,
	:team2_id => team13.id)
Matchup.create(:week_number => 10,
	:team1_id => team2.id,
	:team2_id => team6.id)
Matchup.create(:week_number => 10,
	:team1_id => team8.id,
	:team2_id => team3.id)

Matchup.create(:week_number => 11,
	:team1_id => team5.id,
	:team2_id => team12.id)
Matchup.create(:week_number => 11,
	:team1_id => team6.id,
	:team2_id => team8.id)
Matchup.create(:week_number => 11,
	:team1_id => team7.id,
	:team2_id => team16.id)
Matchup.create(:week_number => 11,
	:team1_id => team1.id,
	:team2_id => team11.id)
Matchup.create(:week_number => 11,
	:team1_id => team13.id,
	:team2_id => team14.id)
Matchup.create(:week_number => 11,
	:team1_id => team4.id,
	:team2_id => team10.id)
Matchup.create(:week_number => 11,
	:team1_id => team8.id,
	:team2_id => team2.id)
Matchup.create(:week_number => 11,
	:team1_id => team15.id,
	:team2_id => team3.id)

Matchup.create(:week_number => 12,
	:team1_id => team5.id,
	:team2_id => team7.id)
Matchup.create(:week_number => 12,
	:team1_id => team8.id,
	:team2_id => team9.id)
Matchup.create(:week_number => 12,
	:team1_id => team6.id,
	:team2_id => team12.id)
Matchup.create(:week_number => 12,
	:team1_id => team11.id,
	:team2_id => team16.id)
Matchup.create(:week_number => 12,
	:team1_id => team1.id,
	:team2_id => team10.id)
Matchup.create(:week_number => 12,
	:team1_id => team4.id,
	:team2_id => team13.id)
Matchup.create(:week_number => 12,
	:team1_id => team14.id,
	:team2_id => team15.id)
Matchup.create(:week_number => 12,
	:team1_id => team2.id,
	:team2_id => team3.id)

WeeklyStat.create(
	:team_id => team5.id,
    :week_number => 8,
    :field_goal_percentage => 0.387,
    :free_throw_percentage => 0.815,
    :three_pointers_made => 35,
    :total_points => 403,
    :rebounds => 171,
    :assists => 96,
    :steals => 33,
    :blocks => 26,
    :turnovers => 70)

WeeklyStat.create(
	:team_id => team3.id,
    :week_number => 8,
    :field_goal_percentage => 0.474,
    :free_throw_percentage => 0.728,
    :three_pointers_made => 40,
    :total_points => 575,
    :rebounds => 239,
    :assists => 142,
    :steals => 21,
    :blocks => 20,
    :turnovers => 75)

WeeklyStat.create(
	:team_id => team9.id,
    :week_number => 8,
    :field_goal_percentage => 0.455,
    :free_throw_percentage => 0.808,
    :three_pointers_made => 24,
    :total_points => 482,
    :rebounds => 153,
    :assists => 53,
    :steals => 30,
    :blocks => 36,
    :turnovers => 52)

WeeklyStat.create(
	:team_id => team1.id,
    :week_number => 8,
    :field_goal_percentage => 0.478,
    :free_throw_percentage => 0.854,
    :three_pointers_made => 43,
    :total_points => 548,
    :rebounds => 191,
    :assists => 113,
    :steals => 40,
    :blocks => 18,
    :turnovers => 68)

WeeklyStat.create(
	:team_id => team12.id,
    :week_number => 8,
    :field_goal_percentage => 0.463,
    :free_throw_percentage => 0.851,
    :three_pointers_made => 26,
    :total_points => 450,
    :rebounds => 166,
    :assists => 110,
    :steals => 40,
    :blocks => 26,
    :turnovers => 62)

WeeklyStat.create(
	:team_id => team4.id,
    :week_number => 8,
    :field_goal_percentage => 0.473,
    :free_throw_percentage => 0.835,
    :three_pointers_made => 40,
    :total_points => 561,
    :rebounds => 187,
    :assists => 114,
    :steals => 44,
    :blocks => 23,
    :turnovers => 73)

WeeklyStat.create(
	:team_id => team7.id,
    :week_number => 8,
    :field_goal_percentage => 0.472,
    :free_throw_percentage => 0.811,
    :three_pointers_made => 10,
    :total_points => 391,
    :rebounds => 166,
    :assists => 63,
    :steals => 32,
    :blocks => 29,
    :turnovers => 60)

WeeklyStat.create(
	:team_id => team14.id,
    :week_number => 8,
    :field_goal_percentage => 0.44,
    :free_throw_percentage => 0.814,
    :three_pointers_made => 29,
    :total_points => 420,
    :rebounds => 134,
    :assists => 121,
    :steals => 31,
    :blocks => 11,
    :turnovers => 71)

WeeklyStat.create(
	:team_id => team11.id,
    :week_number => 8,
    :field_goal_percentage => 0.433,
    :free_throw_percentage => 0.673,
    :three_pointers_made => 37,
    :total_points => 427,
    :rebounds => 196,
    :assists => 117,
    :steals => 43,
    :blocks => 23,
    :turnovers => 57)

WeeklyStat.create(
	:team_id => team13.id,
    :week_number => 8,
    :field_goal_percentage => 0.408,
    :free_throw_percentage => 0.704,
    :three_pointers_made => 25,
    :total_points => 348,
    :rebounds => 174,
    :assists => 82,
    :steals => 27,
    :blocks => 16,
    :turnovers => 55)

WeeklyStat.create(
	:team_id => team15.id,
    :week_number => 8,
    :field_goal_percentage => 0.423,
    :free_throw_percentage => 0.829,
    :three_pointers_made => 25,
    :total_points => 363,
    :rebounds => 214,
    :assists => 97,
    :steals => 36,
    :blocks => 18,
    :turnovers => 52)

WeeklyStat.create(
	:team_id => team16.id,
    :week_number => 8,
    :field_goal_percentage => 0.538,
    :free_throw_percentage => 0.753,
    :three_pointers_made => 16,
    :total_points => 371,
    :rebounds => 144,
    :assists => 100,
    :steals => 27,
    :blocks => 22,
    :turnovers => 53)

WeeklyStat.create(
	:team_id => team2.id,
    :week_number => 8,
    :field_goal_percentage => 0.474,
    :free_throw_percentage => 0.786,
    :three_pointers_made => 22,
    :total_points => 483,
    :rebounds => 235,
    :assists => 104,
    :steals => 31,
    :blocks => 36,
    :turnovers => 58)

WeeklyStat.create(
	:team_id => team6.id,
    :week_number => 8,
    :field_goal_percentage => 0.412,
    :free_throw_percentage => 0.819,
    :three_pointers_made => 32,
    :total_points => 472,
    :rebounds => 201,
    :assists => 142,
    :steals => 38,
    :blocks => 25,
    :turnovers => 81)

WeeklyStat.create(
	:team_id => team8.id,
    :week_number => 8,
    :field_goal_percentage => 0.449,
    :free_throw_percentage => 0.833,
    :three_pointers_made => 31,
    :total_points => 391,
    :rebounds => 148,
    :assists => 83,
    :steals => 36,
    :blocks => 14,
    :turnovers => 41)