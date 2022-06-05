<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminReg.aspx.cs" Inherits="AdminReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Registration</title>
    <style>
        h1{
            text-align:center;
            font-weight:bold;
        }
        h3 {
            color: red;
        }

        .buttons {
            font-family: 'Times New Roman', Times, serif;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
        }
       #signup{
           margin-left:200px;
       }
        input.buttons:hover {
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Admin Registration</h1>
        </div>
        <br />
        <h3>Please Provide the Following Details</h3>
        <div>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="adminusername" runat="server" Text="UserName" Font-Size="Larger" Font-Bold="True"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="250px"></asp:TextBox>
            </p>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="adminfullname" runat="server" Text="Full Name" Font-Size="Larger" Font-Bold="True"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="250px"></asp:TextBox>
            </p>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="adminpswd" runat="server" Text="Password" Font-Size="Larger" Font-Bold="True"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" Height="30px" Width="250px"></asp:TextBox>
            </p>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="adminemplno" runat="server" Text="Empl. No." Font-Size="Larger" Font-Bold="True"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server" Height="30px" Width="250px" placeholder="Employee Number"></asp:TextBox>
            </p>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="adminemail" runat="server" Text="Email ID" Font-Size="Larger" Font-Bold="True"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server" Height="30px" Width="250px"></asp:TextBox>
            </p>
        </div>
        <br />

        <p>
            <asp:Button ID="signup" runat="server" Text="Submit"  CssClass="buttons" BackColor="#CCCCCC" BorderColor="#000066" BorderStyle="Solid" BorderWidth="2px" Height="30px"  Width="100px"/>
        </p>
        <br />
        <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Already Have an Account! Login.</asp:LinkButton>

    </form>
</body>
</html>
