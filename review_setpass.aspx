<%@ Page Title="" Language="C#" MasterPageFile="~/reviewer_master.master" AutoEventWireup="true" CodeFile="review_setpass.aspx.cs" Inherits="review_setpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; padding:10px 10px 10px 10px; font-size:14px;">
<div style="margin:10px 10px 10px 10px; text-align:center;">
    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
        onclick="LinkButton1_Click">Profile</asp:LinkButton> &nbsp; |&nbsp; 
<asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Blue">Change Password</asp:HyperLink>
</div>
<div style="margin:10px 10px 10px 10px; border-color:Silver; border-style:solid; border-width:medium;">
    <table cellpadding="10px" cellspacing="0px" border="0px">
    <tr><td colspan="2"><asp:Label ID="Label1" runat="server" Text="Change / Reset Password" 
        ForeColor="#FF6600" Font-Names="Tahoma"></asp:Label></td></tr>
    <tr><td colspan="2">Reset your password by providing your existing detail in the following
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
    <tr><td colspan=2 align="center">
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
</table></div></div>
</asp:Content>

