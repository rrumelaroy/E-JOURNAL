<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_disable_freesub.aspx.cs" Inherits="admin_disable_freesub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label1" runat="server" Text="Disable Free Subscriber's Account" ForeColor="#FF6600"></asp:Label><br /><br />
For disabling Free Subscriber's Account click on the login-name of the subscriber<br /><br />
<center><table border="0" cellspacing="0px" cellpadding="5px">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C9C299; font-family:Tahoma; font-weight:bold; color:White;">
    <th>Login Name</th>
    <th>Number Of Visits</th>
    <th>Last Date Of Visit</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("fsubid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("floginname") %></asp:LinkButton></td>
    <td><asp:Label ID="numvisit" runat="server" Text='<%# Eval("fnumvisit") %>'></asp:Label></td>
    <td><asp:Label ID="lastvisit" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#FFE87C; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("fsubid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("floginname") %></asp:LinkButton></td>
    <td><asp:Label ID="numvisit" runat="server" Text='<%# Eval("fnumvisit") %>'></asp:Label></td>
    <td><asp:Label ID="lastvisit" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater>
    </table></center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT [fsubid], [floginname], [facctype], [fnumvisit], CONVERT(VARCHAR(10),[flastvisit],105) DATE1 FROM [FREE_SUBSCRIBER_MASTER] WHERE ([facctype] = @facctype)">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="facctype" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />
<div id="div1" visible="false" runat="server" style="margin:20px 20px 20px 20px; padding:10px 10px 10px 10px; border:1px solid black;">
<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br /><br />
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Yes</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">No</asp:LinkButton>
</div>
    </div>
</div>
</asp:Content>

