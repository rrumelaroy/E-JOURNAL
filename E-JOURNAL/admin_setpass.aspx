<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_setpass.aspx.cs" Inherits="admin_setpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="margin:10px 10px 10px 10px; border-color:Silver; border-style:solid; border-width:medium;">
    <table cellpadding="10px" cellspacing="0px" border="0px">
    <tr><td colspan="2" style="font-size:x-large; font-weight:bold; color:Black;">Change Password</td></tr>
    <tr><td colspan="2" style="font-size:larger; color:Black;">
    To reset your password, provide your current password
    </td></tr>
    <tr>
    <td valign="top" style="color:Gray; font-size:larger;">Current Password* :</td>
    <td>
        <asp:TextBox ID="TextBox1" runat="server" MaxLength="15" TextMode="Password"></asp:TextBox> &nbsp;<asp:Image 
            ID="Image1" runat="server" src="img_files/ok.png" 
                    Visible="false" />
                <br />
        <asp:Label 
                ID="Label11" runat="server" ForeColor="Red" 
            Text="doesn't match with the original" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
    <td valign="top" style="color:Gray; font-size:larger;">New Password* :</td>
    <td>
        <asp:TextBox ID="TextBox2" runat="server" MaxLength="15" TextMode="Password"></asp:TextBox> 
        <br />
        <asp:Label 
                ID="Label12" runat="server" ForeColor="Gray" 
            Text="atleast 6 characters"></asp:Label>
        </td>
    </tr>
    <tr>
    <td valign="top" style="color:Gray; font-size:larger;">Confirm Password* :</td>
    <td>
        <asp:TextBox ID="TextBox3" runat="server" MaxLength="15" TextMode="Password"></asp:TextBox> 
        <br />
        <asp:Label 
                ID="Label13" runat="server" ForeColor="Red" 
            Text="password entered is not same" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr><td colspan="2" align="center">
        <asp:Button ID="Button1" runat="server" Text="Save Password" 
            onclick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Reset Password" 
            onclick="Button2_Click" />
        <br />
        <asp:Label 
                ID="Label14" runat="server" ForeColor="#006600" 
            Text="Your new password is successfully changed" Visible="False"></asp:Label>
    </td></tr>
</table></div>
</asp:Content>

