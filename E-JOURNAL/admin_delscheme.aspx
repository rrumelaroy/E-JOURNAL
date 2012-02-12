<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_delscheme.aspx.cs" Inherits="admin_delscheme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label5" runat="server" Text="Delete Scheme" ForeColor="#FF6600"></asp:Label><br /><br />
Select the scheme description for deleting that subscription scheme<br /><br />
<center>
<table cellpadding="5px" cellspacing="0px" border="0">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#A0CFEC; font-family:Tahoma; font-weight:bold; color:White;">
    <th>Scheme Description</th>
    <th>Duration of the Scheme</th>
    <th>Amount (Rs.)</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="sdescription" runat="server" ValidationGroup='<%# Eval("schemeid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("schdescription") %></asp:LinkButton></td>
    <td><asp:Label ID="sduration" runat="server" Text='<%# Eval("schduration") %>'></asp:Label></td>
    <td><asp:Label ID="samount" runat="server" Text='<%# Eval("schamount") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#CFECEC; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="sdescription" runat="server" ValidationGroup='<%# Eval("schemeid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("schdescription") %></asp:LinkButton></td>
    <td><asp:Label ID="acountry" runat="server" Text='<%# Eval("schduration") %>'></asp:Label></td>
    <td><asp:Label ID="ahighqual" runat="server" Text='<%# Eval("schamount") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [SCHEME_MASTER]"></asp:SqlDataSource>
</table></center>
<asp:HiddenField ID="HiddenField1" runat="server" />
<div id="modform" runat="server" style="padding:10px 10px 10px 10px; border:1px solid black;">
<asp:Label ID="Label4" runat="server" Text="Deleting Scheme Details" ForeColor="#FF6600"></asp:Label>&nbsp;<asp:Label 
        ID="Label6" runat="server" Font-Size="Small" ForeColor="Red" 
        Text="( already applied by some applicants )" Visible="False"></asp:Label>
    <br />
<table cellspacing="1px" cellpadding="5px">
<tr>
<td>Scheme Description* :</td>
<td><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </td>
</tr>
<tr>
<td>Scheme Duration* :</td>
<td>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </td>
</tr>
<tr>
<td valign="top">Scheme Amount* :</td>
<td><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    &nbsp;<br />
    </td>
</tr>
<tr><td colspan="2" align="center">
    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
        onclick="LinkButton1_Click">Delete the scheme</asp:LinkButton>
    &nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Blue" 
        onclick="LinkButton2_Click">Cancel</asp:LinkButton>
    <br />
</td></tr>
</table>
</div>
</div>
</div>
</asp:Content>

