<%@ Page Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="AuthorMaster.aspx.cs" Inherits="Online_Library_Management_System.AuthorMaster" Title="Author Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel3" runat="server" Height="486px" CssClass="PanelAll">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table class="TableControlMid" >
                    <tr>
                        <td class="TableHeader" colspan="3" >
                            Author Master</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblauthorid" runat="server" Font-Names="Comic Sans MS" 
                                Text="Author ID"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtauthorid" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtauthorid" CssClass="ValidationControl" 
                                ErrorMessage="Enter Author ID" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Label ID="lblauthornm" runat="server" Font-Names="Comic Sans MS" 
                                Text="Author Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtauthornm" runat="server" MaxLength="25"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtauthornm" CssClass="ValidationControl" 
                                ErrorMessage="Enter Author Name" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btninsert" runat="server" Font-Bold="True" 
                                Font-Names="Comic Sans MS" onclick="btninsert_Click" Text="Insert" 
                                CausesValidation="False" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnsave" runat="server" Enabled="False" Font-Bold="True" 
                                Height="27px" onclick="btnsave_Click" Text="Save" Width="56px" />
                            &nbsp;
                            <asp:Button ID="btncancle" runat="server" Font-Bold="True" 
                                Font-Names="Comic Sans MS" Text="Cancel" onclick="btncancle_Click" 
                                CausesValidation="False" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblerr" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" CssClass="GridView" ForeColor="#333333" GridLines="None" 
                                onrowcommand="GridView1_RowCommand">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Author ID">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblauthorid" runat="server" Text='<%# Eval("intAuthor_ID") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="lblauthorid" runat="server" Text='<%# Eval("intAuthor_ID") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblauthorid" runat="server" Text='<%# Eval("intAuthor_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Author Name">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblauhtornm" runat="server" Text='<%# Eval("strAuthor_Name") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtauthoredt" runat="server" 
                                                Text='<%# Eval("strAuthor_Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblauhtornm" runat="server" Text='<%# Eval("strAuthor_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtstatus" runat="server" Text='<%# Eval("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <AlternatingItemTemplate>
                                            <asp:LinkButton ID="lnkedit" runat="server" 
                                                CommandArgument='<%# Eval("intAuthor_ID") %>' CommandName="EditAuthor" 
                                                CausesValidation="False">Edit</asp:LinkButton>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkedit0" runat="server" 
                                                CommandArgument='<%# Eval("intAuthor_ID") %>' CommandName="EditAuthor" 
                                                CausesValidation="False">Edit</asp:LinkButton>
                                            &nbsp;&nbsp;
                                            <asp:LinkButton ID="lnkupdate" runat="server" 
                                                CommandArgument='<%# Eval("intAuthor_ID") %>' CommandName="UpdateAuthor" 
                                                CausesValidation="False">Update</asp:LinkButton>
                                            &nbsp;&nbsp;<asp:LinkButton ID="lnkupdate0" runat="server" 
                                                CausesValidation="False" CommandArgument='<%# Eval("intAuthor_ID") %>' 
                                                CommandName="CancelAuthor">Cancel</asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkedit1" runat="server" 
                                                CommandArgument='<%# Eval("intAuthor_ID") %>' CommandName="EditAuthor" 
                                                CausesValidation="False">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#0099CC" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
    </asp:Panel>
</asp:Content>
