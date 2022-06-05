using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;

public partial class StudentView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           showInformation();
        }
        string rollno = null;
        if (Request.Cookies["RollNo"] != null)
        {
            rollno = Request.Cookies["RollNo"].Value.ToString();
        }

        string query = "SELECT STUDENT.RollNo,FName AS FullName,StartDate,Req_stat AS Status FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN Finance ON Finance.Rollno=STUDENT.RollNo INNER JOIN Fyp ON Fyp.RollNo=STUDENT.RollNo WHERE STUDENT.RollNo = '" + rollno +"'";
        loadTable(query, 1);
        // showing admin response from remarks table
        showAdminResponse();
        // logout implementataion
        // Label11.Text = Session["RollNo"].ToString(); 

    }


    private void showAdminResponse()
    {
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-0JP7NF9\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True");
        connection.Open();
        string value = null;
        if (Request.Cookies["RollNo"] != null)
        {
            value = Request.Cookies["RollNo"].Value.ToString();
        }
        SqlCommand sqlCmd = new SqlCommand("SELECT * from REMARKS WHERE Rollnum = '" + value + "'", connection);// WHERE RollNo = @rollno and SPassword = @pswd", connection);
        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);

        sqlDa.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            TextBox1.Text = dt.Rows[0]["Adminremarks"].ToString();

        }
        connection.Close();
    }


    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        //Session["RollNo"] = Label2.Text;
        Response.Redirect("StudentPage.aspx");
    }

    
    protected void logout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("StudentLogin.aspx");
                
    }
    protected void loadTable(string query, int placeholderID)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {

                cmd.Connection = con;
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();

                //Building an HTML string.
                StringBuilder html = new StringBuilder();

                //PlaceHolder1.Controls.Clear();
                //Table start.
                html.Append("<table style=\"width:100%; border-collapse: collapse;\">");

                int index = 1;
                while (sdr.Read())
                {
                    if (index == 1)
                    {
                        html.Append("<tr>");
                        for (int i = 0; i < sdr.FieldCount; i++)
                        {
                            html.Append("<th style=\"padding-top: 12px; padding-bottom: 12px; color:white; background-color:#645F88; color:white;\">");
                            html.Append(sdr.GetName(i));
                            html.Append("</th>");
                        }
                        html.Append("</tr>");
                    }
                    index++;

                    string temp;
                    html.Append("<tr>");
                    for (int i = 0; i < sdr.FieldCount; i++)
                    {
                        temp = sdr.GetValue(i).ToString();
                        html.Append("<td style=\"border: 1px solid #ddd; padding: 8px;\">");
                        if (temp == "")
                            html.Append("Not Assigned");
                        else
                            html.Append(temp);
                        html.Append("</td>");
                    }
                    html.Append("</tr>");
                }

                html.Append("</table>");
                html.Append("<br/>");
                //Table end.


                //Append the HTML string to Placeholder.
                switch (placeholderID)
                {
                    case 1:
                        PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
                        break;
                    default:
                        break;
                }
                con.Close();
            }
        }
    }
    private void showInformation()
    {

        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-0JP7NF9\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True");
        connection.Open();
        string value = null;
        if (Request.Cookies["RollNo"] != null)
        {
            value = Request.Cookies["RollNo"].Value.ToString();
        }
        SqlCommand sqlCmd = new SqlCommand("SELECT * from STUDENT WHERE RollNo = '"+value+"'", connection);// WHERE RollNo = @rollno and SPassword = @pswd", connection);
        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);

        sqlDa.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Label12.Text = dt.Rows[0]["FName"].ToString();
            Label2.Text = dt.Rows[0]["FName"].ToString();
            Label4.Text = dt.Rows[0]["Section"].ToString();
            Label6.Text = dt.Rows[0]["Cgpa"].ToString();
            Label8.Text = dt.Rows[0]["RollNo"].ToString();
            Label10.Text = dt.Rows[0]["Batch"].ToString();
        }
        connection.Close();
    }

    protected void transcript_Click(object sender, EventArgs e)
    {
        // show transcript
        ClientScript.RegisterClientScriptBlock(this.GetType(), "k",
                "swal('Request Submitted!', 'Transcript will be emailed to you shortly!', 'info')", true);
    }
}