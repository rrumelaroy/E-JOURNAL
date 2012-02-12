<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_disable_author.aspx.cs" Inherits="admin_disable_author" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label1" runat="server" Text="Disable Author's Account" ForeColor="#FF6600"></asp:Label><br /><br />
For disabling Author's Account click on the name of the author<br /><br />
<center>
<table border="0" cellspacing="0px" cellpadding="5px">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C9C299; font-family:Tahoma; font-weight:bold; color:White;">
    <th>Login Name</th>
    <th>Country</th>
    <th>A/C Activation Date</th>
    <th>Highest Qualification</th>
    <th>Current Designation</th>
    <th>Current Organization / Employer</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("authid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("atitle") %> &nbsp;<%# Eval("afirstname") %> &nbsp;<%# Eval("asurname") %></asp:LinkButton></td>
    <td><asp:Label ID="country" runat="server" Text='<%# Eval("acountry") %>'></asp:Label></td>
    <td><asp:Label ID="startdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="qualification" runat="server" Text='<%# Eval("ahighqual") %>'></asp:Label></td>
    <td><asp:Label ID="enddate" runat="server" Text='<%# Eval("adesig") %>'></asp:Label></td>
    <td><asp:Label ID="org" runat="server" Text='<%# Eval("aorganization") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#FFE87C; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("authid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("atitle") %> &nbsp;<%# Eval("afirstname") %> &nbsp;<%# Eval("asurname") %></asp:LinkButton></td>
    <td><asp:Label ID="country" runat="server" Text='<%# Eval("acountry") %>'></asp:Label></td>
    <td><asp:Label ID="startdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="qualification" runat="server" Text='<%# Eval("ahighqual") %>'></asp:Label></td>
    <td><asp:Label ID="enddate" runat="server" Text='<%# Eval("adesig") %>'></asp:Label></td>
    <td><asp:Label ID="org" runat="server" Text='<%# Eval("aorganization") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT authid, atitle, afirstname, asurname, acountry, CONVERT (VARCHAR(10), astartdate, 105) AS DATE1, ahighqual, adesig, aorganization FROM AUTHOR_MASTER WHERE (aaccstatus = @aaccstatus)">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="aaccstatus" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <div id="div1" visible="false" 
        style="margin:15px 15px 15px 15px; font-family:Tahoma; border:1px solid Black; padding:10px 10px 10px 20px;" 
        runat="server" align="left">
    <asp:Label ID="Label3" runat="server" Text="Work done by the author so far" ForeColor="#FF6600"></asp:Label><br /><br />
        <table cellpadding="5px" cellspacing="0px" border="0">
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C9C299; font-family:Tahoma; font-weight:bold; color:White;">
    <th>Title of the Journal</th>
    <th>Subject Area</th>
    <th>Submission Date</th>
    <th>Abstract</th>
    <th>Journal Status</th>
    <th>Administrator Remark</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:Label ID="ptitle" runat="server" Text='<%# Eval("papertitle") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="submitdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="abstract" runat="server" Text='<%# Eval("ABS") %>'></asp:Label></td>
    <td><asp:Label ID="journalstatus" runat="server" Text='<%# Eval("paperstatus") %>'></asp:Label></td>
    <td><asp:Label ID="remark" runat="server" Text='<%# Eval("REMARK") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#FFFC17; font-family:Tahoma; color:Black;">
    <td><asp:Label ID="ptitle" runat="server" Text='<%# Eval("papertitle") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="submitdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="abstract" runat="server" Text='<%# Eval("ABS") %>'></asp:Label></td>
    <td><asp:Label ID="journalstatus" runat="server" Text='<%# Eval("paperstatus") %>'></asp:Label></td>
    <td><asp:Label ID="remark" runat="server" Text='<%# Eval("REMARK") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT subjarea, paperid, CONVERT (VARCHAR(10), datesubmit, 105) AS DATE1, papertitle, SUBSTRING(abstract, 1, 15) AS ABS, paperstatus, SUBSTRING(adminremark, 1, 15) AS REMARK FROM PAPER_MASTER WHERE (authid = @authid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" Name="authid" 
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

