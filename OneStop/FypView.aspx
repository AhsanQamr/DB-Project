<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FypView.aspx.cs" Inherits="FypView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fyp View</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        h1{
            text-align:center;
            text-decoration-line:underline;
        }
        #one{
            font-weight:bold;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size:24px;
        }
        #two{
            font-weight:bold;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size:24px;
            text-decoration-line:underline;
        }
        .link{
            font-weight:bold;
            margin-left:40px;
            font-size:16px;
        }
        .link:hover{
            color:blueviolet;
        }
        .buttons{
            margin-left:400px;
            border-radius: 12px;
        }
        input.buttons:hover {
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
        }
        #Button2{
            position:absolute;
            top:15px;
            right:40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
 <asp:Button ID="Button2" runat="server" Text="Logout" CssClass="buttons" OnClick="Button2_Click" />
        <br />
        <div>
            <h1>FYP Section</h1>
        </div>
        <p id="one">Pending Requests</p>

        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

        <br />
        <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>

        <br />
        <p id="two">Student's Request Clearance</p>
        <p id="one">Student</p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="250px" autocomplete="off" placeholder="Student Roll Number"></asp:TextBox>
        <p id="one">FYP Status</p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" Height="21px" Width="220px">
            <asp:ListItem>Completed</asp:ListItem>
            <asp:ListItem>Incomplete</asp:ListItem>
        </asp:DropDownList>

        <p id="one">Request Status</p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server" Height="21px" Width="220px ">
            <asp:ListItem>Accept</asp:ListItem>
            <asp:ListItem>Reject</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />


        <p id="one">Justification</p>
        <asp:TextBox ID="TextBox1" runat="server" Width="60%" Height="30px" placeholder="Reason for Rejection" autocomplete="off"></asp:TextBox>
        <br />
        <br />
        <br />

        <asp:Button ID="Button1" runat="server" CssClass="buttons" BackColor="#CCCCCC" BorderColor="#000066" BorderStyle="Solid" BorderWidth="5px" Height="40px" Text="Submit" Width="150px" OnClick="Button1_Click"/>
    </form>
</body>
</html>
