using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Domain;

namespace ForThree.Implementations
{
    public class TeamWeekParser : ITeamWeekInput
    {
        #region Members
        public String mRawString;
        #endregion 

        #region Constructor
        public TeamWeekParser(string input)
        {
            mRawString = input; 
        }
        #endregion 

        #region Public API
        public Team Fetch()
        {
            String[] parts = mRawString.Split('\t');
            int size = parts.Length;
            Team team = null;

            if (size == 11 || size == 10)
            {
                team = new Team
                {
                    Name = parts[0],
                    FieldGoalPercentage = Double.Parse(parts[1]),
                    FreeThrowPercentage = Double.Parse(parts[2]),
                    ThreePointsMade = Int16.Parse(parts[3]), 
                    Points = Int16.Parse(parts[3]), 
                    Rebounds = Int16.Parse(parts[4]), 
                    Assists = Int16.Parse(parts[5]), 
                    Steals = Int16.Parse(parts[6]),
                    Blocks = Int16.Parse(parts[7]), 
                    Turnovers = Int16.Parse(parts[8])
                };
                return team;
            }

            return team;
        }
        #endregion 

    }
}
