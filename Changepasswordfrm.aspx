<%@ Page Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="Changepasswordfrm.aspx.cs" Inherits="Online_Library_Management_System.Changepasswordfrm" Title="Change Password Page" %>

    

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" 
        Height="410px" CssClass="PanelAll">
        
        <link href="MainStyle.css" rel="stylesheet" type="text/css" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <table>
            <tr>
                <td >
                    &nbsp;</td>
                <td >
                    <table class="TableControlMid">
                        <tr>
                            <td class="TableHeader" colspan="3">
                                <span class="style20"></span><span class="style20">Change Password</span></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbloldpwd" runat="server" Font-Names="Comic Sans MS" 
                                    Text="Old Password"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtoldpwd" runat="server" BorderColor="Black" 
                                    BorderStyle="Solid" TextMode="Password" MaxLength="16"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtoldpwd" 
                                    ErrorMessage="Enter Old Password" CssClass="ValidationControl" 
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblnpwd" runat="server" Font-Names="Comic Sans MS" 
                                    Text="New Password"></asp:Label>
                            </td>
                            <td class="style16">
                                <asp:TextBox ID="txtnewpwd" runat="server" BorderColor="Black" 
                                    BorderStyle="Solid" TextMode="Password" MaxLength="16"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtnewpwd" 
                                    ErrorMessage="Enter New Password" Font-Names="Comic Sans MS" 
                                    Font-Size="Small" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblconfpwd" runat="server" Font-Names="Comic Sans MS" 
                                    Text="Confirm New Password"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtconfpwd" runat="server" BorderColor="Black" 
                                    BorderStyle="Solid" TextMode="Password" MaxLength="16"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtconfpwd" 
                                    ErrorMessage="Please Enter Confirm Password" Font-Names="Comic Sans MS" 
                                    Font-Size="Small" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <br />
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToCompare="txtnewpwd" ControlToValidate="txtconfpwd" 
                                    ErrorMessage="Enter Correct Confirm Password" Font-Names="Comic Sans MS" 
                                    Font-Size="Small" SetFocusOnError="True"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        <td >
                                <asp:Button ID="btnchange" runat="server" Font-Bold="True" 
                                    Font-Names="Comic Sans MS" onclick="btnchange_Click" Text="Change" />
                                &nbsp;
                                <asp:Button ID="btncancle" runat="server" Font-Bold="True" 
                                    Font-Names="Comic Sans MS" Text="Cancel" />
                            </td>
                            <td>
                                <asp:Label ID="lblsucess" runat="server" Font-Bold="False" 
                                    Font-Names="Comic Sans MS" Visible="False" ForeColor="#FF3300"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
