using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Domain;

namespace ForThree.Implementations
{
    /// <summary>
    /// This represents a way for a team's weekly input to be entered into the system. 
    /// </summary>
    public interface ITeamWeekInput
    {
        Team Fetch(); 
    }
}
