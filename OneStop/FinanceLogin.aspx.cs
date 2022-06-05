using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class FinanceLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }

    protected void login_Click(object sender, EventArgs e)
    {
        SqlConnection sqlConnection = new SqlConnection("Data Source=DESKTOP-0JP7NF9\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True");
        sqlConnection.Open();

        SqlCommand sqlCommand = new SqlCommand("Select * from FINCDEPT where EmplNo= @employee and Pswd = @password ", sqlConnection);

        //String query = "";
        sqlCommand.Parameters.AddWithValue("@employee", TextBox1.Text);
        sqlCommand.Parameters.AddWithValue("@password", TextBox2.Text);
        SqlDataAdapter sda = new SqlDataAdapter(sqlCommand);
        DataTable dataTable = new DataTable();
        sda.Fill(dataTable);
        //sqlCommand = new SqlCommand(query, sqlConnection);
        sqlCommand.ExecuteNonQuery();
        sqlCommand.Dispose();
        sqlConnection.Close();

        if (dataTable.Rows.Count > 0)
        {
            // Request.QueryString["RollNo"];
            Response.Redirect("FinanceView.aspx");

        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "Username or password Incorrect";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainPage.aspx");
    }
}