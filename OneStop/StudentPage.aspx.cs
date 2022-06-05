using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class StudentPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }



    protected void Button3_Click(object sender, EventArgs e)
    {
        // going to generate a random number

        if(String.IsNullOrEmpty(TextBox1.Text))
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "Required";
        }
        if (String.IsNullOrEmpty(TextBox4.Text))
        {
            Label2.ForeColor = System.Drawing.Color.Red;
            Label2.Text = "Required";
        }
        if (String.IsNullOrEmpty(TextBox3.Text))
        {
            Label3.ForeColor = System.Drawing.Color.Red;
            Label3.Text = "Required";
        }
        if (String.IsNullOrEmpty(TextBox11.Text))
        {
            Label4.ForeColor = System.Drawing.Color.Red;
            Label4.Text = "Required";
        }
        if (String.IsNullOrEmpty(TextBox16.Text))
        {
            Label5.ForeColor = System.Drawing.Color.Red;
            Label5.Text = "Required";
        }
        
        Random random = new Random();
        int random_number = random.Next(10, 400);
        DateTime now = DateTime.UtcNow.Date;
        Console.WriteLine(now);  // just for seeing the result
        SqlConnection sqlConnection = new SqlConnection("Data Source=DESKTOP-0JP7NF9\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True");
        sqlConnection.Open();
        String rollno = null;
        if (Request.Cookies["RollNo"] != null)
        {
            rollno = Request.Cookies["RollNo"].Value.ToString();
        }
        string req_status = "Pending";
        string start_date = now.ToString();       //.UtcNow.Date.ToString();
        string end_date = null;
        SqlCommand sqlCommand;

        String query = "INSERT INTO REQUEST VALUES ('" + rollno + "','" + random_number + "','" + req_status + "','" + start_date + "','"+ end_date+"')";
       // String query2 = "INSERT INTO Finance VALUES('"+ rollno+"','"+ feestatus +"')";

        sqlCommand = new SqlCommand(query, sqlConnection);
       // sqlCommand = new SqlCommand(query2, sqlConnection);
        sqlCommand.ExecuteNonQuery();
        sqlCommand.Dispose();
        sqlConnection.Close();

        runFinanceQuery();
        runFypQuery();

  
        ClientScript.RegisterClientScriptBlock(this.GetType(), "k",
                        "swal('Request Submitted!', 'You will be informed shortly!', 'success')", true);
        
    }

    public void runFinanceQuery()
    {
        string[] array = new string[] { "paid", "unpaid" };
        Random random = new Random();
        int index = random.Next(array.Length);
        string feestatus = array[index]; 



        SqlConnection sqlConnection = new SqlConnection("Data Source=DESKTOP-0JP7NF9\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True");
        sqlConnection.Open();
        String rollno = null;
        if (Request.Cookies["RollNo"] != null)
        {
            rollno = Request.Cookies["RollNo"].Value.ToString();
        }

        SqlCommand sqlCommand;

        String query = "INSERT INTO Finance VALUES('" + rollno + "','" + feestatus + "')";
        

        sqlCommand = new SqlCommand(query, sqlConnection);
        sqlCommand.ExecuteNonQuery();
        sqlCommand.Dispose();
        sqlConnection.Close();

    }
    
    public void runFypQuery()
    {
        string[] array = new string[] { "submitted", "not submitted" };
        Random random = new Random();
        int index = random.Next(array.Length);
        string fypstatus = array[index];

        SqlConnection sqlConnection = new SqlConnection("Data Source=DESKTOP-0JP7NF9\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True");
        sqlConnection.Open();
        String rollno = null;
        if (Request.Cookies["RollNo"] != null)
        {
            rollno = Request.Cookies["RollNo"].Value.ToString();
        }

        SqlCommand sqlCommand;

        String query = "INSERT INTO Fyp VALUES('" + rollno + "','" + fypstatus + "')";


        sqlCommand = new SqlCommand(query, sqlConnection);
        sqlCommand.ExecuteNonQuery();
        sqlCommand.Dispose();
        sqlConnection.Close();
    }


    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        //PageUtility.MessageBox(this, "Success !");
        
    }

    public static class PageUtility
    {
        public static void MessageBox(System.Web.UI.Page page, string strMsg)
        {
            //+ character added after strMsg "')"
            ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "alertMessage", "alert('" + strMsg + "')", true);

        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentView.aspx");
    }

}
