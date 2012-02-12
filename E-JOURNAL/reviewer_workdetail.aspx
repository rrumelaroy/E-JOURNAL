<%@ Page Title="" Language="C#" MasterPageFile="~/reviewer_master.master" AutoEventWireup="true" CodeFile="reviewer_workdetail.aspx.cs" Inherits="reviewer_workdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; padding:10px 10px 10px 10px; font-size:14px;">
<div style="margin:10px 10px 10px 10px; text-align:center;">
<asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue" NavigateUrl="~/reviewer_feedback.aspx">Review Journals</asp:HyperLink> &nbsp; |&nbsp; 
    <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Blue">Work Archives</asp:HyperLink>
</div>
<div style="border:2px solid Silver; margin:5px 5px 5px 5px; padding:10px 10px 10px 10px;">
<asp:Label ID="Label1" runat="server" Text="Work Files Section" Font-Names="Tahoma" ForeColor="#FF6600"></asp:Label><br /><br />
View every work detail which is complete / incomplete till date<br /><br />
<center>
<table cellpadding="5px" cellspacing="0px" border="0">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#64E986; font-family:Tahoma; font-weight:bold; color:White;">
    <th>Title of the Journal</th>
    <th>Author</th>
    <th>Subject Area</th>
    <th>Work Given on</th>
    <th>Work Status</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:Label ID="title" runat="server" Text='<%# Eval("papertitle") %>'></asp:Label></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="workdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="workstatus" runat="server" Text='<%# Eval("papreviewstatus") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#C3FDB8; font-family:Tahoma; color:Black;">
    <td><asp:Label ID="title" runat="server" Text='<%# Eval("papertitle") %>'></asp:Label></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="workdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="workstatus" runat="server" Text='<%# Eval("papreviewstatus") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT p.papertitle, a.afirstname, p.subjarea, CONVERT(VARCHAR(10),pr.datereview,105) DATE1, pr.papreviewstatus FROM PAPER_REVIEWING_DETAIL pr, PAPER_MASTER p, AUTHOR_MASTER a WHERE a.authid = p.authid AND p.paperid = pr.paperid AND pr.revid = @revid">
        <SelectParameters>
            <asp:SessionParameter Name="revid" SessionField="pk" />
        </SelectParameters>
    </asp:SqlDataSource>
</center></div></div>
</asp:Content>

