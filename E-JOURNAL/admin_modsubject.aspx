<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_modsubject.aspx.cs" Inherits="admin_modsubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label5" runat="server" Text="Modify Subject" ForeColor="#FF6600"></asp:Label><br /><br />
Select the name of the subject area for modification<br /><br />
<center>Choose the subject for modification
<table cellpadding="5px" cellspacing="0px" border="0">
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
<table border="0" cellpadding="5px" cellspacing="5px">
<tr>
<td>Modify the Name of Subject* :</td>
<td><asp:TextBox ID="TextBox1" runat="server" MaxLength="35"></asp:TextBox> 
    <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label></td>
</tr>
<tr>
<td colspan="2">
    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
        onclick="LinkButton1_Click">Modify the subject name</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Blue" 
        onclick="LinkButton2_Click">Cancel</asp:LinkButton>
    </td>
</tr>
</table>
</div>
</div>
</div>
</asp:Content>

