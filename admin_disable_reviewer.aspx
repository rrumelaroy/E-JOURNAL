<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_disable_reviewer.aspx.cs" Inherits="admin_disable_reviewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label1" runat="server" Text="Disable Reviewer's Account" ForeColor="#FF6600"></asp:Label><br /><br />
For disabling Reviewer's Account click on the name of the reviewer<br /><br />
<center>
<table border="0" cellspacing="0px" cellpadding="5px">
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C9C299; font-family:Tahoma; font-weight:bold; color:White;">
    <th>Name</th>
    <th>Country</th>
    <th>Subject Area</th>
    <th>Highest Qualification</th>
    <th>Current Designation</th>
    <th>Current Organization / Employer</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("revid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("rtitle") %> &nbsp;<%# Eval("rfirstname") %> &nbsp;<%# Eval("rsurname") %></asp:LinkButton></td>
    <td><asp:Label ID="country" runat="server" Text='<%# Eval("rcountry") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("rareacheck") %>'></asp:Label></td>
    <td><asp:Label ID="qualification" runat="server" Text='<%# Eval("rhighqual") %>'></asp:Label></td>
    <td><asp:Label ID="desig" runat="server" Text='<%# Eval("rdesig") %>'></asp:Label></td>
    <td><asp:Label ID="org" runat="server" Text='<%# Eval("rorganization") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#FFE87C; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("revid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("rtitle") %> &nbsp;<%# Eval("rfirstname") %> &nbsp;<%# Eval("rsurname") %></asp:LinkButton></td>
    <td><asp:Label ID="country" runat="server" Text='<%# Eval("rcountry") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("rareacheck") %>'></asp:Label></td>
    <td><asp:Label ID="qualification" runat="server" Text='<%# Eval("rhighqual") %>'></asp:Label></td>
    <td><asp:Label ID="desig" runat="server" Text='<%# Eval("rdesig") %>'></asp:Label></td>
    <td><asp:Label ID="org" runat="server" Text='<%# Eval("rorganization") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [revid], [rtitle], [rfirstname], [rsurname], [rcountry], [rhighqual], [rdesig], [rorganization], [rareacheck] FROM [REVIEWER_MASTER] WHERE ([raccstatus] = @raccstatus)">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="raccstatus" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <div id="div1" visible="false" 
        style="margin:15px 15px 15px 15px; font-family:Tahoma; border:1px solid Black; padding:10px 10px 10px 20px;" 
        runat="server" align="left">
    <asp:Label ID="Label3" runat="server" Text="Work done by the Reviewer so far" ForeColor="#FF6600"></asp:Label><br /><br />
<table cellpadding="5px" cellspacing="0px" border="0">
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C9C299; font-family:Tahoma; font-weight:bold; color:White;">
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
    <tr style="background-color:#FFFC17; font-family:Tahoma; color:Black;">
    <td><asp:Label ID="title" runat="server" Text='<%# Eval("papertitle") %>'></asp:Label></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="workdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="workstatus" runat="server" Text='<%# Eval("papreviewstatus") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT p.papertitle, a.afirstname, p.subjarea, CONVERT(VARCHAR(10),pr.datereview,105) DATE1, pr.papreviewstatus FROM PAPER_REVIEWING_DETAIL pr, PAPER_MASTER p, AUTHOR_MASTER a WHERE a.authid = p.authid AND p.paperid = pr.paperid AND pr.revid = @revid">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" Name="revid" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource><br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br /><br />
        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
            onclick="LinkButton1_Click">Yes</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Blue" 
            onclick="LinkButton2_Click">No</asp:LinkButton>
    </div>
</center></div></div>
</asp:Content>

