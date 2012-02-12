<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_addscheme.aspx.cs" Inherits="admin_addscheme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label5" runat="server" Text="Add New Scheme" ForeColor="#FF6600"></asp:Label><br /><br />
Fill up the scheme details for creating a new subscription - scheme<br /><br />
<table cellspacing="5px" cellpadding="1px">
<tr>
<td>Scheme Description* :</td>
<td><asp:TextBox ID="TextBox1" runat="server" MaxLength="35" 
        Width="254px"></asp:TextBox>&nbsp;<asp:Label ID="Label1" runat="server" 
        Font-Size="Small" ForeColor="Red" Text="cannot be empty" Visible="False"></asp:Label>
    </td>
</tr>
<tr>
<td >Scheme Duration* :</td>
<td >
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>monthly</asp:ListItem>
        <asp:ListItem>yearly</asp:ListItem>
        <asp:ListItem>half yearly</asp:ListItem>
        <asp:ListItem>quaterly</asp:ListItem>
    </asp:DropDownList>
    </td>
</tr>
<tr>
<td valign="top">Scheme Amount* :</td>
<td><asp:TextBox ID="TextBox2" runat="server" MaxLength="8"></asp:TextBox>&nbsp;<asp:RangeValidator 
        ID="RangeValidator1" runat="server" ControlToValidate="TextBox2" 
        ErrorMessage="Value should be in 99 &amp; 9999" Font-Size="Small" 
        ForeColor="Red" MaximumValue="9999" MinimumValue="99" Type="Integer"></asp:RangeValidator>
    <br />
    <asp:Label ID="Label4" runat="server" 
        Font-Size="Small" ForeColor="Red" Text="cannot be empty" Visible="False"></asp:Label>
    </td>
</tr>
<tr><td colspan="2" align="center">
    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
        onclick="LinkButton1_Click">Add to the list</asp:LinkButton>
    &nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Blue" 
        onclick="LinkButton2_Click">Reset</asp:LinkButton>
    <br />
</td></tr>
</table>
<br /><br />
<center>
    <asp:Label ID="Label3" runat="server" 
        Text="Schemes Already Available to the Paid Subscriber"></asp:Label><br />
        <table cellpadding="5px" cellspacing="0px" border="0">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#A0CFEC; font-weight:bold; color:White;">
    <th>Scheme Description</th>
    <th>Duration of the Scheme</th>
    <th>Amount (Rs.)</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; color:Black;">
    <td><asp:Label ID="atitle" runat="server" Text='<%# Eval("schdescription") %>'></asp:Label></td>
    <td><asp:Label ID="acountry" runat="server" Text='<%# Eval("schduration") %>'></asp:Label></td>
    <td><asp:Label ID="ahighqual" runat="server" Text='<%# Eval("schamount") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#CFECEC; color:Black;">
    <td><asp:Label ID="atitle" runat="server" Text='<%# Eval("schdescription") %>'></asp:Label></td>
    <td><asp:Label ID="acountry" runat="server" Text='<%# Eval("schduration") %>'></asp:Label></td>
    <td><asp:Label ID="ahighqual" runat="server" Text='<%# Eval("schamount") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>     
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [schduration], [schdescription], [schamount] FROM [SCHEME_MASTER]">
    </asp:SqlDataSource>
</center></div>
</div>
</asp:Content>

