using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Domain
{
    public class Team
    {
        public string Name { get; set; }

        public double FieldGoalPercentage { get; set; }

        public double FreeThrowPercentage { get; set; }

        public int ThreePointsMade { get; set; }

        public int Rebounds { get; set; }

        public int Points { get; set; }

        public int Assists { get; set; }

        public int Steals { get; set; }

        public int Blocks { get; set; }

        public int Turnovers { get; set; } 
    }
}
