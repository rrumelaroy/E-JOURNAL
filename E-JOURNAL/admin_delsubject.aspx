<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_delsubject.aspx.cs" Inherits="admin_delsubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label5" runat="server" Text="Delete A Subject" ForeColor="#FF6600"></asp:Label>&nbsp;&nbsp; <br /><br />
Select the subject for deletion<br /><br />
<center>
<table cellpadding="5px" border="0" cellspacing="0px">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
    <tr style="background-color:#CFECEC; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="subjectname" runat="server" ValidationGroup='<%# Eval("subjid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("subjname") %></asp:LinkButton></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="subjectname" runat="server" ValidationGroup='<%# Eval("subjid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("subjname") %></asp:LinkButton></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater>
</table></center>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [SUBJECT_MASTER] ORDER BY [subjname]"></asp:SqlDataSource>
<asp:HiddenField ID="HiddenField1" runat="server" />
<div id="modform" runat="server" style="padding:10px 10px 10px 10px; border:1px solid Black;">
<table border="0" cellpadding="5px" cellspacing="1px">
<tr>
<td>Name of Subject* :</td>
<td>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </td>
</tr>
<tr>
<td colspan="2">
    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
        onclick="LinkButton1_Click">Delete from the list</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Blue" 
        onclick="LinkButton2_Click">Cancel</asp:LinkButton>
    <br />
    <asp:Label ID="Label6" runat="server" Font-Size="Small" ForeColor="Red" 
        Text="( already in use )" Visible="False"></asp:Label>
    </td>
</tr>
</table>
</div>
</div>
</div>
</asp:Content>

