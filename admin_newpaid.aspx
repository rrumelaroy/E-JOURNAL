<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_newpaid.aspx.cs" Inherits="admin_newpaid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
    <div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label2" runat="server" Text="Accept New Paid Subscriber" ForeColor="#FF6600"></asp:Label><br /><br />
For accepting / rejecting new Paid Subscriber Account request click on the name of the applicant<br /><br />
<center>
<table cellspacing="0px" border="0" cellpadding="5px">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C9C299; font-family:Tahoma; font-weight:bold; color:White;">
    <th rowspan="2">USER NAME</th>
    <th rowspan="2">COUNTRY</th>
    <th rowspan="2">APPLYING DATE</th>
    <th colspan="3">DEMAND DRAFT INFORMATION</th>
    <th colspan="2">SCHEME APPLIED</th>
    </tr>
    <tr style="background-color:#C9C299; font-family:Tahoma; font-weight:bold; color:White;">
    <th>DD NUMBER</th>
    <th>BANK NAME</th>
    <th>DD MAKING DATE</th>
    <th>DURATION</th>
    <th>AMOUNT</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("psubid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("ptitle") %> &nbsp;<%# Eval("pfirstname") %> &nbsp;<%# Eval("psurname") %></asp:LinkButton></td>
    <td><asp:Label ID="pcountry" runat="server" Text='<%# Eval("pcountry") %>'></asp:Label></td>
    <td><asp:Label ID="psubmitedate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="pddnumber" runat="server" Text='<%# Eval("pddnumber") %>'></asp:Label></td>
    <td><asp:Label ID="pddbank" runat="server" Text='<%# Eval("pddbank") %>'></asp:Label></td>
    <td><asp:Label ID="pddmakedate" runat="server" Text='<%# Eval("DATE2") %>'></asp:Label></td>
    <td><asp:Label ID="schduration" runat="server" Text='<%# Eval("schduration") %>'></asp:Label></td>
    <td><asp:Label ID="schamount" runat="server" Text='<%# Eval("schamount") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#FFE87C; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("psubid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("ptitle") %> &nbsp;<%# Eval("pfirstname") %> &nbsp;<%# Eval("psurname") %></asp:LinkButton></td>
    <td><asp:Label ID="pcountry" runat="server" Text='<%# Eval("pcountry") %>'></asp:Label></td>
    <td><asp:Label ID="psubmitedate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="pddnumber" runat="server" Text='<%# Eval("pddnumber") %>'></asp:Label></td>
    <td><asp:Label ID="pddbank" runat="server" Text='<%# Eval("pddbank") %>'></asp:Label></td>
    <td><asp:Label ID="pddmakedate" runat="server" Text='<%# Eval("DATE2") %>'></asp:Label></td>
    <td><asp:Label ID="schduration" runat="server" Text='<%# Eval("schduration") %>'></asp:Label></td>
    <td><asp:Label ID="schamount" runat="server" Text='<%# Eval("schamount") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        
        
        SelectCommand="SELECT p.psubid, p.ptitle, p.pfirstname, p.psurname, p.pcountry, CONVERT(VARCHAR(10), d.psubmitdate, 105) DATE1, d.pddnumber, d.pddbank, CONVERT(VARCHAR(10), d.pddmakedate, 105) DATE2, s.schduration, s.schamount, p.pacctype FROM PAID_SUBSCRIBER_MASTER p, PAID_SUBSCRIBER_DRAFT_MASTER d, SCHEME_MASTER s WHERE d.pschemeid = s.schemeid AND d.pddstatus = 'pending' AND p.pactivedate IS NULL AND p.psubid = d.psubid" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>">
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />
</center>
<div id="div1" visible="false" runat="server" style="margin:20px 20px 20px 20px; padding:10px 10px 10px 10px; border:1px solid black;">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br /><br />
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Accept</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Reject</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Close Window</asp:LinkButton>
</div>
</div></div>
</asp:Content>

