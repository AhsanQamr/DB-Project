﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e) => Response.Redirect("StudentLogin.aspx");

    protected void Button2_Click(object sender, EventArgs e) => Response.Redirect("AdminPage.aspx");

    protected void Button3_Click(object sender, EventArgs e) => Response.Redirect("DirectorLogin.aspx");

    protected void Button4_Click(object sender, EventArgs e) => Response.Redirect("FypLogin.aspx");

    protected void Button5_Click(object sender, EventArgs e) => Response.Redirect("FinanceLogin.aspx");
}