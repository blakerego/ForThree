﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ForThree.Implementations;

namespace ForThree
{
    public partial class Form1 : Form
    {

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            TeamWeekParser mTeamWeekInput = new TeamWeekParser(textBox1.Text);
            mTeamWeekInput.Fetch(); 
        }
    }
}
