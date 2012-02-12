<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_sendtoreview2.aspx.cs" Inherits="admin_sendtoreview2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label9" runat="server" Text="Send Journal For Re - Reviewing" ForeColor="#FF6600"></asp:Label><br /><br />
Click on the title of the Journal for viewing its details<br /><br />
<center>
<table cellpadding="5px" cellspacing="0px" border="0">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C9C299; font-family:Tahoma; font-weight:bold; color:White;">
    <th>Title of the Journal</th>
    <th>Author Name</th>
    <th>Subject Area</th>
    <th>Date of Submit</th>
    <th>Abstract</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="LinkButton6" runat="server" ValidationGroup='<%# Eval("paperid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("papertitle") %></asp:LinkButton></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="submitdate" runat="server" Text='<%# Eval("SUBMITDATE") %>'></asp:Label></td>
    <td><asp:Label ID="ABSTRACT" runat="server" Text='<%# Eval("ABSTRACT") %>'></asp:Label>...</td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#CCFB5D; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="LinkButton6" runat="server" ValidationGroup='<%# Eval("paperid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("papertitle") %></asp:LinkButton></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="submitdate" runat="server" Text='<%# Eval("SUBMITDATE") %>'></asp:Label></td>
    <td><asp:Label ID="ABSTRACT" runat="server" Text='<%# Eval("ABSTRACT") %>'></asp:Label>...</td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT p.paperid, p.papertitle, a.afirstname, p.subjarea, CONVERT(VARCHAR(10),p.datesubmit,105) SUBMITDATE, SUBSTRING(p.abstract,1,15) ABSTRACT FROM PAPER_MASTER p, AUTHOR_MASTER a WHERE p.authid = a.authid AND p.paperstatus = 'resubmitted'">
    </asp:SqlDataSource>
<asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HiddenField2" runat="server" />
</center>
<div id="div1" visible="false" style="margin:15px 15px 15px 15px; font-family:Tahoma; border:1px solid Black; padding:10px 10px 10px 10px;" runat="server">
<asp:Label ID="Label5" runat="server" Text="Reviewer Selection" ForeColor="#FF6600"></asp:Label><br /><br />
Select the Reviewers for reviewing this journal. Atleast one reviewer must be chosen.<br /><br />
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            subjarea:
            <asp:TextBox ID="subjareaTextBox" runat="server" 
                Text='<%# Bind("subjarea") %>' />
            <br />
            papertitle:
            <asp:TextBox ID="papertitleTextBox" runat="server" 
                Text='<%# Bind("papertitle") %>' />
            <br />
            abstract:
            <asp:TextBox ID="abstractTextBox" runat="server" 
                Text='<%# Bind("abstract") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            subjarea:
            <asp:TextBox ID="subjareaTextBox" runat="server" 
                Text='<%# Bind("subjarea") %>' />
            <br />
            papertitle:
            <asp:TextBox ID="papertitleTextBox" runat="server" 
                Text='<%# Bind("papertitle") %>' />
            <br />
            abstract:
            <asp:TextBox ID="abstractTextBox" runat="server" 
                Text='<%# Bind("abstract") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
        <table cellpadding="5px" cellspacing="1px">
        <tr>
        <td>Subject Area : </td>
        <td><asp:Label ID="subjareaLabel" runat="server" Text='<%# Bind("subjarea") %>' /></td>
        </tr>
        <tr>
        <td>Title Of the Journal : </td>
        <td><asp:Label ID="papertitleLabel" runat="server" 
                Text='<%# Bind("papertitle") %>' /></td>
        </tr>
        <tr>
        <td>Abstract : </td>
        <td><asp:Label ID="abstractLabel" runat="server" Text='<%# Bind("abstract") %>' /></td>
        </tr>
        <tr><td colspan="2"><a href="viewjournal.aspx" target="_blank" style="color: #0000FF">Click Here</a> to view the journal.</td></tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [subjarea], [papertitle], [abstract] FROM [PAPER_MASTER] WHERE ([paperid] = @paperid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="paperid" 
                PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <table cellpadding="5px" cellspacing="1px">
    <tr valign="top"><td>Select Reviewer for Reviewing : </td>
    <td>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
            DataSourceID="SqlDataSource3" DataTextField="rloginname" 
            DataValueField="revid">
        </asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [revid], [rloginname] FROM [REVIEWER_MASTER] WHERE ([rareacheck] = @rareacheck)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField2" Name="rareacheck" 
                    PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label6" runat="server" Text="( Select at least 1 reviewer )" 
            Font-Size="Small" ForeColor="Gray"></asp:Label></td></tr>
    <tr>
    <td colspan="2">
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Send For Review</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Reject Journal</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Cancel</asp:LinkButton>
    </td>
    </tr>
    </table>
</div>
<div id="div2" visible="false" style="margin:15px 15px 15px 15px; font-family:Tahoma; border:1px solid Black; padding:10px 10px 10px 10px;" runat="server">
<asp:Label ID="Label7" runat="server" Text="Journal Rejection" ForeColor="#FF6600"></asp:Label>
    <table cellpadding="5px" cellspacing="5px">
    <tr valign="top">
    <td>Editor's Remark : </td>
    <td>
        <asp:TextBox ID="TextBox1" runat="server" Height="200px" TextMode="MultiLine" 
            Width="400px"></asp:TextBox><br />
        <asp:Label ID="Label8" runat="server" Text="cannot be empty" Font-Size="Small" 
            ForeColor="Red" Visible="False"></asp:Label></td>
    </tr>
    <tr><td colspan="2">
        <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Submit Remark & Reject</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="LinkButton5" runat="server" onclick="LinkButton5_Click">Cancel Rejection</asp:LinkButton>
    </td></tr>
    </table>
    </div>
</div></div>
</asp:Content>

