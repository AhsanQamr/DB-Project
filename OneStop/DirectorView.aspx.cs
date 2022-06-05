using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DirectorView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string query = "SELECT RollNo,FName AS FullName,ID AS RequestID,Req_stat AS Status ,StartDate FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll WHERE Req_stat='Pending' ";
        string query2 = "SELECT RollNo,FName AS FullName,ID AS RequestID,Req_stat AS Status ,StartDate FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll WHERE Req_stat ='Finances+Fyp Clear' OR Req_stat ='Finances Clear' OR Req_stat ='Fyp Clear' OR Req_stat='Fyp not clear' OR Req_stat='Finances not clear' OR Req_stat='Fyp and Finances not clear' ";
        string query3= "SELECT RollNo,FName AS FullName,ID AS RequestID,Req_stat AS Status ,StartDate,Adminremarks FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN REMARKS ON REMARKS.Rollnum = STUDENT.RollNo WHERE Req_stat ='Accepted'";
        string query4 = "SELECT RollNo,FName AS FullName,ID AS RequestID,Req_stat AS Status ,StartDate,Adminremarks FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN REMARKS ON REMARKS.Rollnum = STUDENT.RollNo WHERE Req_stat ='Rejected'";  // ,  
        loadTable(query, 1);
        loadTable(query2, 2);
        loadTable(query3, 3);
        loadTable(query4, 4);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("DirectorLogin.aspx");
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
                    case 2:
                        PlaceHolder2.Controls.Add(new Literal { Text = html.ToString() });
                        break;
                    case 3:
                        PlaceHolder3.Controls.Add(new Literal { Text = html.ToString() });
                        break;
                    case 4:
                        PlaceHolder4.Controls.Add(new Literal { Text = html.ToString() });
                        break;
                    default:
                        break;
                }
                //PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
                con.Close();
            }
        }
    }

}