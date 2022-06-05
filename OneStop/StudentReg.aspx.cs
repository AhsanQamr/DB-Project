using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class StudentReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
       
        Response.Redirect("StudentLogin.aspx");
    }

    protected void signup_Click(object sender, EventArgs e)
    {

        SqlConnection sqlConnection = new SqlConnection("Data Source=DESKTOP-0JP7NF9\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True");
        sqlConnection.Open();

        SqlCommand sqlCommand;


        String rollno = TextBox1.Text;
        string result = rollno.Substring(0, 3);
        if (!(result.Contains("i17") || result.Contains("i16") || result.Contains("i15")))
        {
            Label1.Visible = true;
            Label1.Text = "Sorry, You are not eligible for the Degree Clearance";
            Label1.ForeColor = System.Drawing.Color.Red;
            return;
        }
        String fullname = TextBox2.Text;
        String password = TextBox3.Text;
        int pswd = password.Length;
        if (pswd < 8)
        {
            Label2.Visible = true;
            Label2.Text = "Password must be greater than 8 characters";
            Label2.ForeColor = System.Drawing.Color.Red;
            return;
        }
        String batch = DropDownList1.Text;
        int btch = int.Parse(batch);
        String cgpa = TextBox5.Text;
        float gpa =  float.Parse(cgpa);
        if (gpa > 4.0)
        {
            Label6.Visible = true;
            Label6.Text = "Cgpa can't be greater than 4";
            Label6.ForeColor = System.Drawing.Color.Red;
            return;
        }
        String section = TextBox6.Text;
        char sec = char.Parse(section);

        String query = "INSERT INTO STUDENT VALUES ('" + rollno + "','" + fullname + "','" + password + "','"+ gpa+"','"+batch+"','"+sec+"')";
        sqlCommand = new SqlCommand(query, sqlConnection);
        sqlCommand.ExecuteNonQuery();
        sqlCommand.Dispose();
        sqlConnection.Close();
        Response.Redirect("StudentLogin.aspx");
    }
}
