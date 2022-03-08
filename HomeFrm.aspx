<%@ Page Language="C#" MasterPageFile="~/HomeMasterPage.Master" AutoEventWireup="true" CodeBehind="HomeFrm.aspx.cs" Inherits="Online_Library_Management_System.HomeFrm" Title="Online Library Management System :Home Page" %>
<%@ Register assembly="ASPNetFlash.NET3" namespace="ASPNetFlash" tagprefix="ASPNetFlash" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <link href="MainStyle.css" rel="stylesheet" type="text/css" />
    
    <asp:Panel ID="Panel1" runat="server" CssClass="PanelAll" Height="414px">
        <table>
            <tr>
                <td class="style7">
                    <img alt="No Image Found" class="style10" src="Images/tn_books.gif" /></td>
                <td class="style9">
                    Welcome to Online Library Management System</td>
                <td class="style11">
                    <img alt="No Image Found" class="style10" src="Images/tn_books.gif" /></td>
            </tr>
            <tr>
                <td class="style3">
                    <img alt="No Image Found" class="style12" src="Images/books1.gif" /></td>
                <td class="style13">
                    <ASPNetFlash:Flash ID="Flash2" runat="server" Height="192px" 
                        HeightAutoDetect="False" MovieURL="~/bok.swf" ScaleMode="ExactFit" 
                        style="margin-left: 91px" Width="281px" WidthAutoDetect="False" 
                        WindowMode="Transparent">
                    </ASPNetFlash:Flash>
                </td>
                <td>
                    <img alt="No Image Found" class="style12" src="Images/books1.gif" /></td>
            </tr>
        </table>
        <br />
        <br />
</asp:Panel>

</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style5
        {
            font-size: x-large;
            color: #FF3300;
        }
        .style7
        {
            text-align: left;
        height: 84px;
        width: 135px;
    }
        .style10
        {
            width: 144px;
            height: 108px;
        }
        .style9
        {
            font-size: large;
            color: #FF3300;
            text-align: center;
            font-family: Verdana;
            font-weight: bold;
        height: 84px;
        width: 608px;
    }
        .style11
    {
        height: 84px;
    }
    .style12
    {
        width: 148px;
        height: 215px;
        margin-left: 0px;
    }
    .style13
    {
        width: 608px;
    }
    </style>

</asp:Content>


