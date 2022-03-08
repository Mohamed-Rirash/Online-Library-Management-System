<%@ Page Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="HomeUserfrm.aspx.cs" Inherits="Online_Library_Management_System.HomeUserfrm" Title="User Home Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="353px" CssClass="PanelMain">
    <span class="style12">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    </span><span class="style12">
    <table class="style8">
        <tr>
            <td class="style17" 
                style="background-position: center center; color: #339933; background-image: url('Images/books1.gif'); vertical-align: top; background-repeat: no-repeat; text-align: center;">
                <span class="style14"><span class="style15"><span class="style16">Hello, </span>
                </span></span><span class="style12"><span class="style12"><span class="style12">
                <span class="style12"><span class="style14"><span class="style13"><b>
                <span class="style16">
                <asp:Label ID="lblunm" runat="server" Text="Label"></asp:Label>
                <br />
                Welcome in Online Library Management System</span></b></span></span><br />
                <br />
                <br />
                <br />
                <br />
                <img alt="No Image Found" class="style18" src="Images/read_e0.gif" /><img 
                    alt="No Image Found" class="style19" src="Images/read_e0.gif" /><br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <img alt="No Image Found" class="style12" src="Images/title_explore.gif" /><br />
                <br />
                </span></span></span></span></td>
            <td style="vertical-align: top">
                <asp:Panel ID="Panel3" runat="server" CssClass="PanelBlink" 
                    Font-Names="Verdana" Font-Size="Medium" ForeColor="#339933" 
                    Visible="False" Font-Bold="True">
                   
                            <span class="style11">Update</span><span class="style11">:</span><br />
                            <br />
                            <asp:Label ID="lblitmreqst" runat="server"></asp:Label>
                            &nbsp;New Item Request<br />
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="PanelBlink" 
                                PostBackUrl="~/Itemreqfrm.aspx"><span class="style12">Click here to see..</span></asp:LinkButton>
                            <br />
                            <br />
                            <asp:Label ID="lblusrlgn" runat="server"></asp:Label>
                            &nbsp;New Signup Request<br />
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="PanelBlink" 
                                PostBackUrl="~/Signupreqfrm.aspx"><span class="style12">Click here to see..</span></asp:LinkButton>
                   
                            </asp:Panel>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    </span>
</asp:Panel>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style8
        {
            width: 100%;
        }
        .style11
        {
            color: #CC3300;
        }
        .style12
        {
            width: 185px;
            height: 20px;
        }
        .style13
        {
            color: #FF3300;
        }
        .style14
        {
            font-family: Verdana;
        }
        .style15
        {
            color: #FF3300;
            font-weight: bold;
        }
        .style16
        {
            font-size: large;
        }
        .style17
        {
            width: 495px;
        }
        .style18
        {
            width: 113px;
            height: 101px;
            float: left;
        }
        .style19
        {
            width: 102px;
            height: 110px;
            float: right;
        }
    </style>

</asp:Content>

