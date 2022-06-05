<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentPage.aspx.cs" Inherits="StudentPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Form</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            height: 70px;
        }
        h1{
            text-align:center;
            font-weight:bolder;
            text-decoration-line:underline;
        }
        h2{
            color:red;
        }
        .buttons{
                font-family: 'Times New Roman', Times, serif;
                font-size: 30px;
                font-weight: bold;
        }
        input.buttons:hover{
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
        }
        #last{
            margin-left:20px;
            font-weight:bold;
            font-size:18px;
            text-decoration-line:underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <br />
        <hr />
        <div>

            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Back to Dashboard</asp:LinkButton>
            <hr />
            <h1>
                Student Degree Verification Form
            </h1>
            <h2>
                &nbsp;&nbsp;Please Provide the following Details
            </h2>
        </div>
        
        <p>
            &nbsp;</p>
        <table>
            <tr>
                <th><strong><u>Personal Details</u></strong> <br /></th> 
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Fullname" runat="server" Text="Full Name"   ></asp:Label></td>
                <td> &nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server" Height="33px" Width="305px" placeholder="Your Full Name" autocomplete="off"></asp:TextBox><asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label> </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Cnic" runat="server" Text="Cnic Number" ></asp:Label></td>
                <td> &nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox4" runat="server" Height="33px" Width="305px" placeholder="No need of '-'" autocomplete="off"></asp:TextBox><asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Fathername" runat="server" Text="Father's/Guardians Name" ></asp:Label></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox2" runat="server" Height="33px" Width="305px" placeholder="Father's Full Name" ></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Fathercnic" runat="server" Text="Father's Cnic Number" ></asp:Label></td>
                <td> &nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox5" runat="server" Height="33px" Width="305px" placeholder="No need of '-'"></asp:TextBox></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Rollno" runat="server" Text="Reg. Number"></asp:Label></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox3" runat="server" Height="33px" Width="305px" placeholder="University's Roll Num." autocomplete="off"></asp:TextBox><asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="email" runat="server" Text="Email" ></asp:Label></td>
                <td> &nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox6" runat="server" Height="33px" Width="305px" placeholder="Universit's Email ID"></asp:TextBox></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Paddress" runat="server" Text="Present Address"></asp:Label></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox7" runat="server" Height="33px" Width="305px" placeholder="Your Present Address"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="PerAddress" runat="server" Text="Permanent Address" ></asp:Label></td>
                <td> &nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox8" runat="server" Height="33px" Width="305px" placeholder="Parent's/Guardian's Address"></asp:TextBox></td>                
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="PhoneNo" runat="server" Text="Phone Number"></asp:Label></td>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox9" runat="server" Height="33px" Width="305px" placeholder="Cell Number"></asp:TextBox></td>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="document" runat="server" Text="Nature of Document" ></asp:Label></td>
                <td class="auto-style1"> &nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList1" runat="server" Height="33px" Width="305px">
                    <asp:ListItem>Degree Verification Form</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th><strong><u>Bank Details</u></strong> <br /></th>
            </tr>

            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="rs" runat="server" Text="Rupees"></asp:Label></td>
                <td>&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox10" runat="server" Height="33px" Width="305px" placeholder="Amount Submitted"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Challan" runat="server" Text="Challan Number" ></asp:Label></td>
                <td> &nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox11" runat="server" Height="35px" Width="305px" placeholder="Bank Challan Number" autocomplete="off"></asp:TextBox><asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="date" runat="server" Text="Date"></asp:Label></td>
                <td>&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox12" runat="server" Height="33px" Width="305px" placeholder="Date of Submission"></asp:TextBox></td>
            </tr>
            
            <tr>
                <th><strong><u>Education Details </u></strong></th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (For Undergraduate Students)</th>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="udegree" runat="server" Text="Degree"></asp:Label></td>
                <td>&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox13" runat="server" Height="33px" Width="305px" placeholder="(eg. Bachelor's)"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="usection" runat="server" Text="Department" ></asp:Label></td>
                <td> &nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox14" runat="server" Height="35px" Width="305px" placeholder="Department"></asp:TextBox></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="upassing" runat="server" Text="Year Of Passing"></asp:Label></td>
                <td>&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox15" runat="server" Height="33px" Width="305px" placeholder="(eg. Batch)"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="ugpa" runat="server" Text="CGPA" ></asp:Label></td>
                <td> &nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox16" runat="server" Height="35px" Width="305px" placeholder="cgpa" autocomplete="off"></asp:TextBox><asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
             <tr>
                <th>(For Graduate Students)</th>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="gdegree" runat="server" Text="Degree"></asp:Label></td>
                <td>&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox17" runat="server" Height="33px" Width="305px" placeholder="(eg. Bachelor's)"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="gsection" runat="server" Text="Major/Section" ></asp:Label></td>
                <td> &nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox18" runat="server" Height="35px" Width="305px" placeholder="(eg. Major's Field)"></asp:TextBox></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="gpassing" runat="server" Text="Year Of Passing"></asp:Label></td>
                <td>&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox19" runat="server" Height="33px" Width="305px" placeholder="(eg. Passing year)"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="ggpa" runat="server" Text="CGPA" ></asp:Label></td>
                <td> &nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox20" runat="server" Height="35px" Width="305px" placeholder="cgpa" autocomplete="off"></asp:TextBox></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="supervisor" runat="server" Text="SuperVisor Name" ></asp:Label></td>
                <td> &nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox21" runat="server" Height="35px" Width="305px" placeholder="(eg. Thesis Supervisor)"></asp:TextBox></td>
            </tr>
        </table>
        
        <br />
        <p id="last">I solemnly declare that facts mentioned in the application are correct</p>
        <br />
        <br />
        <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Signature of Applicant</p>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" CssClass="buttons" BackColor="#CCCCCC" BorderColor="#000066" BorderStyle="Solid" BorderWidth="2px" Height="40px" OnClick="Button3_Click" Text="Submit" Width="250px"/>
        

       
    </form>
</body>
</html>
