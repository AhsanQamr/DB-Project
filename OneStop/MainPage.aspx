<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css" />
    <title>One Stop Portal</title>
    <style type="text/css">
        #Button4,#Button5{
            margin-left:220px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <div class="transimage">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/degree1.jpg" alt="degree image" height="350px" width="100%" />
                <div class="content">
                    <table>
                        <tr>
                            <td>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/logo.png" /></td>
                            <td>
                                <h1>&nbsp; &nbsp;Fast National Universiy Of Computer And Emerging Sciences</h1>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            
            <br />
            
            <h1><u>One Stop Student Service Centre</u></h1>
            <br />
            <h2>Welcome to the Degree Clearance Portal</h2>
            
            <ul>
                <li>Kindly Select Your Designation</li>
            </ul>
        </div> 
        
        <asp:Button ID="Button1" runat="server" CssClass="buttons" BackColor="#CCCCCC" BorderColor="#000066" BorderStyle="Solid" BorderWidth="6px" Height="50px" OnClick="Button1_Click" Text="Student" Width="318px"/>
        <br />
        <asp:Button ID="Button2" runat="server" CssClass="buttons" BackColor="#CCCCCC" BorderColor="#000066" BorderStyle="Solid" BorderWidth="6px" Height="50px" OnClick="Button2_Click" Text="Admin" Width="318px"/>              
        <br />
        <asp:Button ID="Button3" runat="server" CssClass="buttons" BackColor="#CCCCCC" BorderColor="#000066" BorderStyle="Solid" BorderWidth="6px" Height="50px" OnClick="Button3_Click" Text="Director" Width="318px"/>
        <br />
        <asp:Button ID="Button4" runat="server" CssClass="buttons" BackColor="#CCCCCC" BorderColor="#000066" BorderStyle="Solid" BorderWidth="6px" Height="50px" OnClick="Button4_Click" Text="FYP Department" Width="318px"/>
        <br />
        <asp:Button ID="Button5" runat="server" CssClass="buttons" BackColor="#CCCCCC" BorderColor="#000066" BorderStyle="Solid" BorderWidth="6px" Height="50px" OnClick="Button5_Click" Text="Finance Department" Width="318px"/>
        <br />

        
    </form>
</body>
</html>
