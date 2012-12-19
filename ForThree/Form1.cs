using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ForThree.Implementations;
using Domain;

namespace ForThree
{
    public partial class Form1 : Form
    {

        protected List<Team> mTeams = new List<Team>(); 

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            TeamWeekParser mTeamWeekInput = new TeamWeekParser(textBox1.Text);
            mTeamWeekInput.Fetch(); 
        }

        public void AddTeamToView(Team team)
        {
            mTeams.Add(team); 
        }
    }
}
