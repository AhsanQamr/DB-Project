<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentView.aspx.cs" Inherits="StudentView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Home Page</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        .header {
            overflow: hidden;
            background-color: #f1f1f1;
            padding: 10px 5px;
            
        }

            /* Style the header links */
            .header a {
                float: left;
                color: black;
                text-align: center;
                padding: 12px;
                text-decoration: none;
                font-size: 18px;
                line-height: 25px;
                border-radius: 4px;
            }

                /* Style the logo link (notice that we set the same value of line-height and font-size to prevent the header to increase when the font gets bigger */
                .header a.logo {
                    font-size: 25px;
                    font-weight: bold;
                }

                /* Change the background color on mouse-over */
                .header a:hover {
                    background-color: #ddd;
                    color: black;
                }

                /* Style the active/current link*/
                .header a.active {
                    background-color: dodgerblue;
                    color: white;
                }

        /* Float the link section to the right */
        .header-right {
            float: right;
        }

        /* Add media queries for responsiveness - when the screen is 500px wide or less, stack the links on top of each other */
        @media screen and (max-width: 500px) {
            .header a {
                float: none;
                display: block;
                text-align: left;
            }

            .header-right {
                float: none;
            }
        }
        #Image1{
            width:70px;
            height:70px;
        }

        h1{
            text-align:center;
            font-weight:bold;
            
        }
        #Label12{
            text-align:center;
            font-weight:bold;
            text-decoration-line:underline;
        }
        h2{
            text-align:center;
            font-weight:bold;
            color:aqua;
            font-size:40px;
            font-family:'Times New Roman', Times, serif;
        }
        h3{
            text-align:center;
            font-weight:bold;
            color:burlywood;
            font-size:40px;
            font-family:'Times New Roman', Times, serif;
        }

        table{
            align-content:center;
            margin-left:auto;
            margin-right:auto;
        }
        th,td{
            text-align:center;
            padding:15px;
            font-family:'Berlin Sans FB';
            font-weight:bold;
            font-size:30px;
        }
        #contact{
            background-color:cadetblue;
            text-align:center;
            padding:50px;
            color:wheat;
            font-weight:bolder;
            font-size:50px;
            width:90%;
            height:80px;
        }
        #email{
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-weight:bold;
            font-size:35px;
            color:blueviolet;
        }

        /*upper button */

        /*Floating Back-To-Top Button*/
    #myBtn {
        position: fixed;
        bottom: 10px;
        float: right;
        right: 12.5%;
        left: 87.25%;
        max-width: 30px;
        width: 100%;
        font-size: 14px;
        border-color: rgba(85, 85, 85, 0.2);
        background-color: rgb(100,100,100);
        padding: 2px;
        border-radius: 4px;

    }
/*On Hover Color Change*/
    #myBtn:hover {
        background-color: #7dbbf1;
    }
    #prgrs{
          font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
          font-weight:bold;
          font-size:45px;
          color:chocolate;
          text-align:center;
    }

    #LinkButton2{
        margin-left:450px;
        font-weight:bold;
        font-size:20px;

    }
    #LinkButton2:hover{
        color:blueviolet;
    }
    #one{
            font-weight:bold;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size:24px;
    }

    </style>




</head>

<body>
    <form id="form1" runat="server">
        <div class="header" id="nav">
            <asp:Image ID="Image1" runat="server" CssClass="logo" ImageUrl="~/images/logo.png" />
            <div class="header-right" id="bar">
                <!--<asp:LinkButton ID="LinkButton1" runat="server" CssClass="active">Home</asp:LinkButton> -->
                <a href="#top"  class="active">Home</a>
                <a href="#second" >My Information</a>
                <a href="#third"> Contact Us </a>
                <a href="#last">Progress</a>
                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">Degree Verification Form</asp:LinkButton>
                <asp:LinkButton ID="transcript" runat="server" OnClick="transcript_Click" >Transcript</asp:LinkButton>
                <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click" >LogOut</asp:LinkButton>
            </div>
        </div>

         <button id="myBtn"><a href="#nav" style="color: white">Top</a></button>

        <div id="top">
        <div>
            <h1>
                Welcome, <asp:Label ID="Label12" runat="server" Text="."></asp:Label>
            </h1>
        </div>
            <h2>
                One Stop Student Service Center <br />
                Offers this Website For Easy <br />
                Degree Clearance Process.
            </h2>
            <br />
            <br />
            <h3>
                This Intitative Is Started By <br />
                Director Fast Nuces For the <br />
                Swift Proccess and Easiness of Students<br />
            </h3>
        </div>
        <br />
        <hr />
        <br />

        <div id="second">
         <br />
         <br />
            <table>
                <th>
                    <u>Personal Information</u>
                </th>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Fullname"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="-"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Section"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="-"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Cgpa"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="-"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Roll Number"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="-"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Batch"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="-"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>

        <hr />
        <br />
        <br />



        <div id="third">
            <div id="contact">
                <p>Contact Us</p>
            </div>
            <br />
            <div id="image">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/pic.jpg" Width= "50%" Height="300px" />
                <p id="email"> Email Us at onestopisb@nu.edu.pk</p>
            </div>
            <hr />
        </div>
        <br />
        <br />
        <div id="last">
            <p id="prgrs">Progress</p>
<%--            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Click to see Progress Status</asp:LinkButton>
            <br />--%>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            <br />
            <p id="one">Admin Remarks</p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Width="60%" Height="30px" autocomplete="off" placeholder="Admin Remarks"></asp:TextBox>
            <br />
            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/prgrs.jpg" Height="300px" Width="100%" />
            <br />
            <asp:Label ID="Label11" runat="server" Text="." Visible="false"></asp:Label>
            <hr />
        </div>

       

    </form>
</body>
</html>
