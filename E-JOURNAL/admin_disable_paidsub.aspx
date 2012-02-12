<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_disable_paidsub.aspx.cs" Inherits="admin_disable_paidsub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label1" runat="server" Text="Disable Paid Subscriber's Account" ForeColor="#FF6600"></asp:Label><br /><br />
For disabling Paid Subscriber's Account click on the name of the subscriber<br /><br />
<center>
    <table border="0" cellspacing="0px" cellpadding="5px">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C9C299; font-family:Tahoma; font-weight:bold; color:White;">
    <th>Name</th>
    <th>Country</th>
    <th>A/C Activation Date</th>
    <th>A/C De-Activation Date</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("psubid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("ptitle") %> &nbsp;<%# Eval("pfirstname") %> &nbsp;<%# Eval("psurname") %></asp:LinkButton></td>
    <td><asp:Label ID="country" runat="server" Text='<%# Eval("pcountry") %>'></asp:Label></td>
    <td><asp:Label ID="startdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="enddate" runat="server" Text='<%# Eval("DATE2") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#FFE87C; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("psubid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("ptitle") %> &nbsp;<%# Eval("pfirstname") %> &nbsp;<%# Eval("psurname") %></asp:LinkButton></td>
    <td><asp:Label ID="country" runat="server" Text='<%# Eval("pcountry") %>'></asp:Label></td>
    <td><asp:Label ID="startdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="enddate" runat="server" Text='<%# Eval("DATE2") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        SelectCommand="SELECT psubid, ptitle, pfirstname, psurname, pcountry, CONVERT (VARCHAR(10), pactivedate, 105) AS DATE1, CONVERT (VARCHAR(10), pdeactivedate, 105) AS DATE2 FROM PAID_SUBSCRIBER_MASTER WHERE (DATEDIFF(day, GETDATE(), pdeactivedate) &gt;= 0) AND (pacctype = 'True')">
    </asp:SqlDataSource>
</center>
<asp:HiddenField ID="HiddenField1" runat="server" />
<div id="div1" visible="false" runat="server" style="margin:20px 20px 20px 20px; padding:10px 10px 10px 10px; border:1px solid black;">
<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br /><br />
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Yes</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">No</asp:LinkButton>
</div>
</div></div>
</asp:Content>

