using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class StudentLogin : System.Web.UI.Page { 
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void LinkButton1_Click(object sender, EventArgs e) => Response.Redirect("StudentReg.aspx");

    protected void login_Click(object sender, EventArgs e)
    {

        HttpCookie httpCookie = new HttpCookie("RollNo");
        httpCookie.Secure = true;
        httpCookie.Value = TextBox1.Text;
        httpCookie.Expires = DateTime.Now.AddHours(1);
        Response.Cookies.Add(httpCookie);

        SqlConnection sqlConnection = new SqlConnection("Data Source=DESKTOP-0JP7NF9\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True");
        sqlConnection.Open();

        SqlCommand sqlCommand = new SqlCommand("Select * from STUDENT where RollNo= @rollno and Paswrd = @password ", sqlConnection);

        //String query = "";
        sqlCommand.Parameters.AddWithValue("@rollno", TextBox1.Text);
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
            Response.Redirect("StudentView.aspx");

        }
        else
        {
            Label1.Text = "Username or password Incorrect";
            Label1.ForeColor = System.Drawing.Color.Red;
        }


        //Response.Redirect("StudentView.aspx");

    }



    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainPage.aspx");
    }
}