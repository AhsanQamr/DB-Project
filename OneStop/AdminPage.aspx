<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style type="text/css">
        h1{
            text-align:center;
            font-weight:bold;
        }
       .buttons{
                font-family: 'Times New Roman', Times, serif;
                font-size: 20px;
                font-weight: bold;
                text-align:center;
        }
       #login{
           margin-left:200px;
       }
        input.buttons:hover{
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Back to Main Page</asp:LinkButton>
        <br />
        <div>
            <h1>Admin Login Page</h1>
        </div>

        <p>
            &nbsp;</p>
        
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="adminusername" runat="server" Text="UserName" Font-Size="Larger" Font-Bold="True"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="250px" placeholder="Employee Number" autocomplete="off"></asp:TextBox>
        </p>
        <br />
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="adminpassword" runat="server" Text="Password" Font-Size="Larger" Font-Bold="True"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="250px" autocomplete="off" TextMode="Password"></asp:TextBox>
        </p>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="-" Visible="false"></asp:Label>
        <br />
        <p>
            <asp:Button ID="login" runat="server" Text="Login"  CssClass="buttons" BackColor="#CCCCCC" BorderColor="#000066" BorderStyle="Solid" BorderWidth="2px" Height="30px"  Width="100px" OnClick="login_Click"/>
        </p>

        
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Visible="false">Donot Have an Account! Sign up.</asp:LinkButton>
        
        

    </form>
</body>
</html>
