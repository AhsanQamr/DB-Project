<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DirectorView.aspx.cs" Inherits="DirectorView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Director View</title>
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
        .buttons{
            margin-left:400px;
            border-radius: 12px;
        }
        #Button1{
            position:absolute;
            top:15px;
            right:40px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" Text="Logout" CssClass="buttons" OnClick="Button1_Click" />
        <br />
        <div>
            <h1>Director Section</h1>
        </div>
        <p id="one">Pending Requests</p>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder><br />
        <%--<asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder><br />
        <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder><br />--%>
        <p id="one">In Progress</p>
        <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
        <br />
        <p id="one">Accepted Requests</p>
        <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
        <br />
        <p id="one">Rejected Requests</p>
        <asp:PlaceHolder ID="PlaceHolder4" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
