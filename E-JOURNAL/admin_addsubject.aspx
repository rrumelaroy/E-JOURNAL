<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_addsubject.aspx.cs" Inherits="admin_addsubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label5" runat="server" Text="Add New Subject" ForeColor="#FF6600"></asp:Label><br /><br />
Enter the name of the new subject area<br /><br />
<div style="padding:10px 10px 10px 10px; border:1px solid Black;">
<table border="0" cellpadding="5px" cellspacing="1px">
<tr>
<td>Name of New Subject* :</td>
<td><asp:TextBox ID="TextBox1" runat="server" MaxLength="35"></asp:TextBox> 
    <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label></td>
</tr>
<tr>
<td colspan="2">
    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
        onclick="LinkButton1_Click">Add to List</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Blue" 
        onclick="LinkButton2_Click">Refresh</asp:LinkButton>
    </td>
</tr>
</table>
</div>
<center>
Subjects Available In the List
<table cellpadding="5px" cellspacing="1px">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
    <tr style="background-color:#CFECEC; font-family:Tahoma; color:Black;">
    <td><asp:Label ID="atitle" runat="server" Text='<%# Eval("subjname") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:Label ID="atitle" runat="server" Text='<%# Eval("subjname") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [SUBJECT_MASTER] ORDER BY [subjname]">
    </asp:SqlDataSource>
</center>
</div>
</div>
</asp:Content>

