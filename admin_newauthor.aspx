<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_newauthor.aspx.cs" Inherits="admin_newauthor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;"> 
    <div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label2" runat="server" Text="Accept New Author" ForeColor="#FF6600"></asp:Label>
<br /><br />
For accepting / rejecting new Author Account request click on the name of the applicant<br /><br />
<center>
<table cellpadding="5px" cellspacing="0px" border="0">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C9C299; font-family:Tahoma; font-weight:bold; color:White;">
    <th>User Name</th>
    <th>Country</th>
    <th>Highest Qualification</th>
    <th>Current Designation</th>
    <th>Current Employer/Organization</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("authid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("atitle") %>&nbsp;<%# Eval("afirstname") %>&nbsp;<%# Eval("asurname") %></asp:LinkButton></td>
    <td><asp:Label ID="acountry" runat="server" Text='<%# Eval("acountry") %>'></asp:Label></td>
    <td><asp:Label ID="ahighqual" runat="server" Text='<%# Eval("ahighqual") %>'></asp:Label></td>
    <td><asp:Label ID="adesig" runat="server" Text='<%# Eval("adesig") %>'></asp:Label></td>
    <td><asp:Label ID="aorganization" runat="server" Text='<%# Eval("aorganization") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#FFE87C; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("authid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("atitle") %>&nbsp;<%# Eval("afirstname") %>&nbsp;<%# Eval("asurname") %></asp:LinkButton></td>
    <td><asp:Label ID="acountry" runat="server" Text='<%# Eval("acountry") %>'></asp:Label></td>
    <td><asp:Label ID="ahighqual" runat="server" Text='<%# Eval("ahighqual") %>'></asp:Label></td>
    <td><asp:Label ID="adesig" runat="server" Text='<%# Eval("adesig") %>'></asp:Label></td>
    <td><asp:Label ID="aorganization" runat="server" Text='<%# Eval("aorganization") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT [authid], [atitle], [afirstname], [asurname], [acountry], [ahighqual], [adesig], [aorganization], [aaccstatus] FROM [AUTHOR_MASTER] WHERE ([astartdate] IS NULL)">
    </asp:SqlDataSource>
    </table>
</center>
        <asp:HiddenField ID="HiddenField1" runat="server" />
<div id="div1" visible="false" runat="server" style="margin:20px 20px 20px 20px; padding:10px 10px 10px 10px; border:1px solid black;">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br /><br />
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Accept</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Reject</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Close Window</asp:LinkButton>
</div>
</div>
</div>
</asp:Content>

