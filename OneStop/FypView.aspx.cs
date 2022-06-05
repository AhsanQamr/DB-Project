using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FypView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string query = "SELECT STUDENT.RollNo,FName AS FullName,ID AS RequestID,Req_stat AS Status,StartDate,Fypstatus FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN Fyp ON Fyp.Rollno=STUDENT.RollNo WHERE Req_stat = 'Pending' OR Req_stat='Finances Clear' OR Req_stat='Finances not clear'";
        string query2 = "SELECT COUNT(STUDENT.RollNo) AS RequestsCount FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN Fyp ON Fyp.Rollno=STUDENT.RollNo WHERE Req_stat = 'Pending' OR Req_stat='Finances Clear' OR Req_stat='Finances not clear'";
        loadTable(query, 1);
        loadquery2(query2, 1);
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
                    //case 2:
                    //    PlaceHolder2.Controls.Add(new Literal { Text = html.ToString() });
                    //    break;
                    default:
                        break;
                }
                con.Close();
            }
        }
    }

    private void loadquery2(string query, int placeholderID)
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

    public void updateStatus(string rollno)
    {
        SqlConnection sqlConnection = new SqlConnection("Data Source=DESKTOP-0JP7NF9\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True");
        sqlConnection.Open();
        if (Request.Cookies["RollNo"] != null)
        {
            rollno = Request.Cookies["RollNo"].Value.ToString();
        }
        SqlCommand sqlCommand;

        String query = "UPDATE REQUEST SET Req_stat = CASE WHEN Req_stat='Finances Clear' THEN 'Finances+Fyp Clear' WHEN Req_stat='Finances not clear' THEN 'Finances not clear, Fyp clear' ELSE 'Fyp Clear' END from STUDENT INNER JOIN REQUEST ON REQUEST.St_roll=STUDENT.RollNo WHERE STUDENT.RollNo = '" + rollno + "'";
        sqlCommand = new SqlCommand(query, sqlConnection);
        sqlCommand.ExecuteNonQuery();
        sqlCommand.Dispose();
        sqlConnection.Close();
        //ClientScript.RegisterClientScriptBlock(this.GetType(), "k",
        //        "swal('Status Updated 'Thank You!', 'success')", true);
    }

    public void updateRejection(string rollno)
    {
        SqlConnection sqlConnection = new SqlConnection("Data Source=DESKTOP-0JP7NF9\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True");
        sqlConnection.Open();
        if (Request.Cookies["RollNo"] != null)
        {
            rollno = Request.Cookies["RollNo"].Value.ToString();
        }
        SqlCommand sqlCommand;

        String query = "UPDATE REQUEST SET Req_stat = CASE WHEN Req_stat='Finances Clear' THEN 'Fyp not clear , Finances Clear' WHEN Req_stat='Finances not clear' OR Req_stat='Fyp not clear' THEN 'Fyp and Finances not clear' WHEN Req_stat='Fyp Clear' THEN 'Finance not clear, Fyp clear' ELSE 'Fyp not clear' END from STUDENT INNER JOIN REQUEST ON REQUEST.St_roll=STUDENT.RollNo WHERE STUDENT.RollNo = '" + rollno + "'";
        sqlCommand = new SqlCommand(query, sqlConnection);
        sqlCommand.ExecuteNonQuery();
        sqlCommand.Dispose();
        sqlConnection.Close();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("FypLogin.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        // insertion into fyp text box function
        insertFyp();
        /////----------
        string roll_num = TextBox2.Text;
        string req_status = DropDownList2.Text;
        if (req_status.ToString() == "Accept")
        {
            updateStatus(roll_num);
            ClientScript.RegisterClientScriptBlock(this.GetType(), "k",
                                            "swal('Status Updated', 'Thank You!', 'success')", true);
        }
        else
        {
            updateRejection(roll_num);
            ClientScript.RegisterClientScriptBlock(this.GetType(), "k",
                                            "swal('Status Updated', 'Thank You!', 'success')", true);
        }
    }
   // where all fyp status are to be updated
    private void insertFyp()
    {
        Session["fypresp"] = TextBox1.Text;
        //SqlConnection sqlConnection = new SqlConnection("Data Source=DESKTOP-0JP7NF9\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True");
        //sqlConnection.Open();
        //String rollno = null;
        //if (Request.Cookies["RollNo"] != null)
        //{
        //    rollno = Request.Cookies["RollNo"].Value.ToString();
        //}
        //string financeresp = null;
        //string fypresp = TextBox1.Text;
        //string adminresp = null;
        //SqlCommand sqlCommand;

        //String query = "INSERT INTO REMARKS VALUES ('" + rollno + "','" + fypresp + "','" + financeresp + "','" + adminresp + "')";//,'" + end_date + "')";
        //sqlCommand = new SqlCommand(query, sqlConnection);
        //sqlCommand.ExecuteNonQuery();
        //sqlCommand.Dispose();
        //sqlConnection.Close();

    }
}