<%@ Page Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="Checkstatusfrm.aspx.cs" Inherits="Online_Library_Management_System.Checkstatusfrm" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style type="text/css">
        .style6
        {
            width: 49px;
        }
        .style7
        {
            text-align: center;
        }
        .style8
        {
            text-align: center;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel3" runat="server" Height="410px" CssClass="PanelAll">
        <br />
    <br />
        <table>
            <tr>
                <td class="style6">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    &nbsp;</td>
                <td class="style7">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        style="text-align: center; margin-top: 0px;" Width="668px" 
                        CssClass="GridView">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="intItem_ID" HeaderText="Item ID" />
                            <asp:BoundField DataField="intBookDetail_ID" HeaderText="Book Detail ID" />
                            <asp:BoundField DataField="Issue_Date" HeaderText="Issue Date" />
                            <asp:BoundField DataField="Due_Date" HeaderText="Due Date" />
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            Item Not Issue
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#0099CC" Font-Bold="True" ForeColor="Black" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
</asp:Panel>
</asp:Content>
