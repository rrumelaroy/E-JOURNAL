<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_addreviewer.aspx.cs" Inherits="admin_addreviewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<asp:Label ID="Label5" runat="server" Text="Add New Reviewer" ForeColor="#FF6600"></asp:Label><br /><br />
Fill up the details to add a new reviewer to DJM website<br /><br />
<div style="margin:20px 20px 20px 30px;">
<table cellpadding="5px" cellspacing="5px">
<tr valign="top">
<td>Loginname* : </td>
<td>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:TextBox ID="TextBox1" runat="server" MaxLength="15"></asp:TextBox>
            &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/img_files/ok.png" 
                Visible="False" /><br />
            <asp:Label ID="Label1" runat="server" Text="atleast 6 characters" 
                Font-Size="Small" ForeColor="Gray"></asp:Label><br />
            <asp:Button ID="Button1" runat="server" Text="Check Availability" 
                onclick="Button1_Click" />
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                  <asp:Image ID="Image2" runat="server" ImageAlign="Middle" 
                                ImageUrl="~/img_files/progress.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
    </td>
    <td>Password* : </td>
    <td>
        <asp:TextBox ID="TextBox2" runat="server" MaxLength="15" TextMode="Password"></asp:TextBox><br /> 
        <asp:Label ID="Label3" runat="server" Text="atleast 6 characters" 
            Font-Size="Small" ForeColor="Gray"></asp:Label></td>
</tr>
<tr valign="top">
<td>Subject Area* : </td>
<td>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="subjname" 
        DataValueField="subjname">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [subjname] FROM [SUBJECT_MASTER] ORDER BY [subjname]">
    </asp:SqlDataSource>
    </td>
    <td>email Address* : </td>
    <td>
        <asp:TextBox ID="TextBox3" runat="server" MaxLength="40"></asp:TextBox> 
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="not a valid email address" ControlToValidate="TextBox3" 
            Font-Size="Small" ForeColor="Red" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
</tr>
<tr><td colspan="4">
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Add to the List</asp:LinkButton> 
    &nbsp;&nbsp; 
    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Reset</asp:LinkButton><br />
    <asp:Label ID="Label4" runat="server" Font-Size="Small" ForeColor="#009900" 
        Visible="False">The New Reviewer is successfully added</asp:Label></td></tr>
</table></div>
</div></div>
</asp:Content>

