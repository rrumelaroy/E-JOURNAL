<%@ Page Title="" Language="C#" MasterPageFile="~/author_master.master" AutoEventWireup="true" CodeFile="author_journalstatus.aspx.cs" Inherits="author_journalstatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color:White; opacity:0.9; padding:10px 10px 10px 10px; font-size:14px;">
<div style="margin:10px 10px 10px 10px; text-align:center;">
<asp:HyperLink ID="HyperLink3" runat="server" ForeColor="Blue" 
        NavigateUrl="~/author_loadjournal.aspx">Upload Journal</asp:HyperLink> &nbsp; 
    |&nbsp;
<asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue" 
        NavigateUrl="~/author_correctjournal.aspx">Correct Journal</asp:HyperLink> &nbsp; 
    | 
    <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Blue">Journal Status</asp:HyperLink>
</div>
<div style="border:2px solid Silver; margin:5px 5px 5px 5px; padding:10px 10px 10px 10px;">
<asp:Label ID="Label1" runat="server" Text="Uploaded Journal's Status" 
        ForeColor="#FF6600" Font-Names="Tahoma"></asp:Label><br /><br />
Select the title of the journal for viewing its details.
<center>
<table cellpadding="5px" cellspacing="0px" border="0">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C38EC7; font-family:Tahoma; color:White;">
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
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("paperid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("papertitle") %></asp:LinkButton></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="submitdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="abstract" runat="server" Text='<%# Eval("ABS") %>'></asp:Label></td>
    <td><asp:Label ID="journalstatus" runat="server" Text='<%# Eval("paperstatus") %>'></asp:Label></td>
    <td><asp:Label ID="remark" runat="server" Text='<%# Eval("REMARK") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#F9B7FF; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="title" runat="server" ValidationGroup='<%# Eval("paperid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("papertitle") %></asp:LinkButton></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="submitdate" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    <td><asp:Label ID="abstract" runat="server" Text='<%# Eval("ABS") %>'></asp:Label></td>
    <td><asp:Label ID="journalstatus" runat="server" Text='<%# Eval("paperstatus") %>'></asp:Label></td>
    <td><asp:Label ID="remark" runat="server" Text='<%# Eval("REMARK") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT subjarea, paperid, CONVERT(VARCHAR(10),datesubmit,105) DATE1, papertitle, SUBSTRING(abstract,1,15) ABS, paperstatus, SUBSTRING(adminremark,1,15) REMARK FROM PAPER_MASTER WHERE authid = @authid">
        <SelectParameters>
            <asp:SessionParameter Name="authid" SessionField="pk" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />
<div id="div1" visible="false" 
        style="margin:15px 15px 15px 15px; font-family:Tahoma; border:1px solid Black; padding:10px 10px 10px 20px;" 
        runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="SqlDataSource2" Height="50px" Width="791px" CellPadding="5" 
        GridLines="None" style="margin-left: 0px">
        <Fields>
            <asp:BoundField DataField="papertitle" HeaderText="Title of the Journal : " 
                SortExpression="papertitle" />
            <asp:BoundField DataField="subjarea" HeaderText="Subject Area : " 
                SortExpression="subjarea" />
            <asp:BoundField DataField="DATE1" HeaderText="Date of Submission : " ReadOnly="True" 
                SortExpression="DATE1" />
            <asp:BoundField DataField="paperstatus" HeaderText="Status of the Journal : " 
                SortExpression="paperstatus" />
            <asp:BoundField DataField="abstract" HeaderText="Abstract : " 
                SortExpression="abstract" />
            <asp:BoundField DataField="adminremark" HeaderText="Administrator's Remark : " 
                SortExpression="adminremark" />
        </Fields>
    </asp:DetailsView><br />
    <a href="viewjournal.aspx" target="_blank" style="color: #0000FF">Click Here</a> to view the journal.<br /><br />
    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
        onclick="LinkButton1_Click">Close Window</asp:LinkButton>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [papertitle], [subjarea], CONVERT(VARCHAR(10),[datesubmit],105) DATE1, [paperstatus], [abstract], [adminremark] FROM [PAPER_MASTER] WHERE ([paperid] = @paperid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="paperid" 
                PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        </div>
</center>
</div></div>
</asp:Content>

