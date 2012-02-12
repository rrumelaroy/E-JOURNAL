<%@ Page Title="" Language="C#" MasterPageFile="~/reviewer_master.master" AutoEventWireup="true" CodeFile="reviewer_feedback.aspx.cs" Inherits="reviewer_feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; padding:10px 10px 10px 10px; font-size:14px;">
    <div style="margin:10px 10px 10px 10px; text-align:center;">
<asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue">Review Journals</asp:HyperLink> &nbsp; |&nbsp; 
    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
            onclick="LinkButton1_Click">Work Archives</asp:LinkButton>
</div>
<div style="margin:10px 10px 10px 10px; border-color:Silver; border-style:solid; border-width:medium; padding:10px 10px 10px 10px;">
<asp:Label ID="Label1" runat="server" Text="Reviewing Section" Font-Names="Tahoma" ForeColor="#FF6600"></asp:Label><br /><br />
Select the title of the journal for giving feedback on it
<div style="margin:10px 10px 10px 20px;">
<center>
<table cellpadding="5px" cellspacing="0px" border="0">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#64E986; font-family:Tahoma; font-weight:bold; color:White;">
    <th>Title</th>
    <th>Author</th>
    <th>Subject Area</th>
    <th>Date Given for Review</th>
    <th>Abstract</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="LinkButton4" runat="server" ValidationGroup='<%# Eval("feedbackid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("papertitle") %></asp:LinkButton></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="reviewdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="abstract" runat="server" Text='<%# Eval("ABSTRACT") %>'></asp:Label>...</td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#C3FDB8; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="LinkButton4" runat="server" ValidationGroup='<%# Eval("feedbackid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("papertitle") %></asp:LinkButton></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="reviewdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="abstract" runat="server" Text='<%# Eval("ABSTRACT") %>'></asp:Label>...</td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        SelectCommand="SELECT r.feedbackid, p.papertitle, a.afirstname, p.subjarea, CONVERT(VARCHAR(10),r.datereview,105) DATE1, SUBSTRING(p.abstract,1,15) ABSTRACT FROM PAPER_MASTER p, PAPER_REVIEWING_DETAIL r, AUTHOR_MASTER a WHERE p.authid = a.authid AND p.paperid = r.paperid AND r.papreviewstatus = 'not reviewed' AND r.revid = @revid">
        <SelectParameters>
            <asp:SessionParameter Name="revid" SessionField="pk" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    
    <div id="div1" visible="false" style="margin:15px 15px 15px 15px; font-family:Tahoma; border:1px solid Black; padding:10px 10px 10px 10px;" runat="server">
<asp:Label ID="Label5" runat="server" Text="Journal Details" ForeColor="#FF6600"></asp:Label>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" 
            AutoGenerateRows="False" DataSourceID="SqlDataSource2" CellPadding="5" 
            GridLines="None">
            <Fields>
                <asp:BoundField DataField="papertitle" HeaderText="Title of the Journal : " 
                    SortExpression="papertitle" />
                <asp:BoundField DataField="afirstname" HeaderText="Author : " 
                    SortExpression="afirstname" />
                <asp:BoundField DataField="subjarea" HeaderText="Subject Area : " 
                    SortExpression="subjarea" />
                <asp:BoundField DataField="DATE1" HeaderText="Date Given For Review : " ReadOnly="True" 
                    SortExpression="DATE1" />
                <asp:BoundField DataField="abstract" HeaderText="Abstract : " 
                    SortExpression="abstract" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT p.paperid, p.papertitle, a.afirstname, p.subjarea, CONVERT (VARCHAR(10), r.datereview, 105) AS DATE1, p.abstract FROM PAPER_REVIEWING_DETAIL AS r INNER JOIN PAPER_MASTER AS p ON r.paperid = p.paperid INNER JOIN AUTHOR_MASTER AS a ON p.authid = a.authid WHERE (r.feedbackid = @feedbackid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" Name="feedbackid" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <a href="viewjournal.aspx" target="_blank" style="color: #0000FF">Click Here</a> to view the journal.<br /><br />
        <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Blue" 
            onclick="LinkButton2_Click">Give Feedback</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="LinkButton3" runat="server" ForeColor="Blue" 
            onclick="LinkButton3_Click">Cancel</asp:LinkButton>
</div>
</center>
</div></div></div>
</asp:Content>

