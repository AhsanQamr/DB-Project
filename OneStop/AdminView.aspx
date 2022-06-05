<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminView.aspx.cs" Inherits="AdminView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin View</title>
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
        #Button3{
            margin-left:250px;
        }

        .resp{
            font-weight:bold;
            font-family:'Times New Roman', Times, serif;
            font-size:18px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button2" runat="server" Text="Logout" CssClass="buttons" OnClick="Button2_Click" />
        <br />
        <div>
            <h1>Admin Section</h1>
        </div>
        <p id="one">Requests</p>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <br />
        <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
        <br />
        <p id="one">Student</p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="250px" autocomplete="off" placeholder="Student Roll Number"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Text="View" OnClick="Button3_Click" />

        <br />

        <p id="one">Responses</p>
        <p class="resp">Finance Response</p>
        <asp:TextBox ID="TextBox3" runat="server" Width="60%" Height="30px"></asp:TextBox>
        <p class="resp">Fyp Response</p>
        <asp:TextBox ID="TextBox4" runat="server" Width="60%" Height="30px"></asp:TextBox>
        <br />
        <p id="one">Final Verdict</p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" Height="21px" Width="220px ">
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
