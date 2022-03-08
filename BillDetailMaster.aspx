<%@ Page Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="BillDetailMaster.aspx.cs" Inherits="Online_Library_Management_System.BillDetailMster" Title="Bill Detail Master" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
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
                            Bill Detail Master</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblbillid" runat="server" Font-Names="Comic Sans MS" 
                                Text="Bill ID"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtbid" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Label ID="lblbilrefno" runat="server" Font-Names="Comic Sans MS" 
                                Text="Bill Ref Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtbrno" runat="server" MaxLength="20"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="Enter Bill Ref. No" CssClass="ValidationControl" 
                                SetFocusOnError="True" ControlToValidate="txtbrno"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Label ID="lblspid" runat="server" Text="Supplier ID"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlspid" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbldscnt" runat="server" Text="Discount(Rs.)"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtdscnt" runat="server" MaxLength="10"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="txtdscnt_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txtdscnt">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblamt" runat="server" Text="Total Amount(Rs.)"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtamt" runat="server" MaxLength="18"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="txtamt_FilteredTextBoxExtender" runat="server" 
                                Enabled="True" FilterType="Numbers" TargetControlID="txtamt">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                CssClass="ValidationControl" ErrorMessage="Enter Total Bill Amount" 
                                SetFocusOnError="True" ControlToValidate="txtamt"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
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
                                Font-Names="Comic Sans MS" onclick="btncancle_Click" Text="Cancel" 
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
                                    <asp:TemplateField HeaderText="Bill ID">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblbid" runat="server" Text='<%# Eval("intBill_ID") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="lblbid" runat="server" Text='<%# Eval("intBill_ID") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblbid" runat="server" Text='<%# Eval("intBill_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bill Ref. No">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblbrno" runat="server" Text='<%# Eval("intBill_Ref_No") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtbrno" runat="server" Text='<%# Eval("intBill_Ref_No") %>' 
                                                Width="100px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblbrno" runat="server" Text='<%# Eval("intBill_Ref_No") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bill Date">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblbdt" runat="server" Text='<%# Eval("Sys_Date") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="lblbdt" runat="server" Text='<%# Eval("Sys_Date") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblbdt" runat="server" Text='<%# Eval("Sys_Date") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Supplier ID">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblspid" runat="server" Text='<%# Eval("intSupplier_ID") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtspid" runat="server" Text='<%# Eval("intSupplier_ID") %>' 
                                                Width="100px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblspid" runat="server" Text='<%# Eval("intSupplier_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Discount">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lbldscnt" runat="server" 
                                                Text='<%# Eval("intDiscount_Amount") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtdscnt" runat="server" 
                                                Text='<%# Eval("intDiscount_Amount") %>' Width="80px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbldscnt" runat="server" 
                                                Text='<%# Eval("intDiscount_Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total Bill Amount">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lbltamt" runat="server" 
                                                Text='<%# Eval("intTotal_Bill_Amount") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txttamt" runat="server" 
                                                Text='<%# Eval("intTotal_Bill_Amount") %>' Width="100px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbltamt" runat="server" 
                                                Text='<%# Eval("intTotal_Bill_Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <AlternatingItemTemplate>
                                            <asp:LinkButton ID="lnkedit" runat="server" 
                                                CommandArgument='<%# Eval("intBill_ID") %>' CommandName="EditBill" 
                                                CausesValidation="False">Edit</asp:LinkButton>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkedit" runat="server" 
                                                CommandArgument='<%# Eval("intBill_ID") %>' CommandName="EditBill" 
                                                CausesValidation="False">Edit</asp:LinkButton>
                                            &nbsp;
                                            <asp:LinkButton ID="lblupdt" runat="server" 
                                                CommandArgument='<%# Eval("intBill_ID") %>' CommandName="UpdateBill" 
                                                CausesValidation="False">Update</asp:LinkButton>
                                            &nbsp;
                                            <asp:LinkButton ID="lnkcancel" runat="server" 
                                                CommandArgument='<%# Eval("intBill_ID") %>' CommandName="Cancel" 
                                                CausesValidation="False">Cancel</asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkedit" runat="server" 
                                                CommandArgument='<%# Eval("intBill_ID") %>' CommandName="EditBill" 
                                                CausesValidation="False">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
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
