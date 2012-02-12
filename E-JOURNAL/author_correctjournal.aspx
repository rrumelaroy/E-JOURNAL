<%@ Page Title="" Language="C#" MasterPageFile="~/author_master.master" AutoEventWireup="true" CodeFile="author_correctjournal.aspx.cs" Inherits="author_correctjournal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; padding:10px 10px 10px 10px; font-size:14px;">
<div style="margin:10px 10px 10px 10px; text-align:center;">
<asp:LinkButton ID="LinkButton4" runat="server" ForeColor="Blue" 
            onclick="LinkButton4_Click">Upload Journal</asp:LinkButton> &nbsp; |&nbsp; 
        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue">Correct Journal</asp:HyperLink>
    &nbsp; |&nbsp;
    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
            onclick="LinkButton1_Click">Journal Status</asp:LinkButton>
<div style="border:2px solid Silver; margin:5px 5px 5px 5px; padding:10px 10px 10px 10px;">
<asp:Label ID="Label2" runat="server" Font-Names="Tahoma" Text="Journal Correction Section" ForeColor="#FF6600"></asp:Label><br /><br />
Select the title of the journal for viewing its details and correct it afterwards.<br /><br /> 
<center>
<table cellpadding="5px" cellspacing="0px" border="0">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C38EC7; font-family:Tahoma; font-weight:bold; color:White;">
    <th>Title of the Journal</th>
    <th>Subject Area</th>
    <th>Administrator's Remark</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="jtitle" runat="server" ValidationGroup='<%# Eval("paperid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("papertitle") %></asp:LinkButton></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("adminremark") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#F9B7FF; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="jtitle" runat="server" ValidationGroup='<%# Eval("paperid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("papertitle") %></asp:LinkButton></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("adminremark") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT paperid, subjarea, papertitle, abstract, adminremark FROM PAPER_MASTER WHERE (authid = @authid) AND (paperstatus = 'sent for correction')">
        <SelectParameters>
            <asp:SessionParameter Name="authid" SessionField="pk" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />
<div id="div1" visible="false" 
        style="margin:15px 15px 15px 15px; font-family:Tahoma; border:1px solid Black; padding:10px 10px 10px 20px;" 
        runat="server" align="left">
        
<asp:Label ID="Label5" runat="server" Text="Journal Detail" ForeColor="#FF6600"></asp:Label>        
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            papertitle:
            <asp:TextBox ID="papertitleTextBox" runat="server" 
                Text='<%# Bind("papertitle") %>' />
            <br />
            subjarea:
            <asp:TextBox ID="subjareaTextBox" runat="server" 
                Text='<%# Bind("subjarea") %>' />
            <br />
            DATE1:
            <asp:TextBox ID="DATE1TextBox" runat="server" Text='<%# Bind("DATE1") %>' />
            <br />
            abstract:
            <asp:TextBox ID="abstractTextBox" runat="server" 
                Text='<%# Bind("abstract") %>' />
            <br />
            adminremark:
            <asp:TextBox ID="adminremarkTextBox" runat="server" 
                Text='<%# Bind("adminremark") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            papertitle:
            <asp:TextBox ID="papertitleTextBox" runat="server" 
                Text='<%# Bind("papertitle") %>' />
            <br />
            subjarea:
            <asp:TextBox ID="subjareaTextBox" runat="server" 
                Text='<%# Bind("subjarea") %>' />
            <br />
            DATE1:
            <asp:TextBox ID="DATE1TextBox" runat="server" Text='<%# Bind("DATE1") %>' />
            <br />
            abstract:
            <asp:TextBox ID="abstractTextBox" runat="server" 
                Text='<%# Bind("abstract") %>' />
            <br />
            adminremark:
            <asp:TextBox ID="adminremarkTextBox" runat="server" 
                Text='<%# Bind("adminremark") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
        <table cellpadding="5px" border="0" style="font-family:Tahoma;">
        <tr><td>Title of the Journal : </td>
        <td><asp:Label ID="papertitleLabel" runat="server" 
                Text='<%# Bind("papertitle") %>' /></td>
        </tr>
        <tr>
        <td>Subject Area : </td>
        <td><asp:Label ID="subjareaLabel" runat="server" Text='<%# Bind("subjarea") %>' /></td>
        </tr>
        <tr>
        <td>Submission Date : </td>
        <td><asp:Label ID="DATE1Label" runat="server" Text='<%# Bind("DATE1") %>' /></td>
        </tr>    
        <tr>
        <td>Abstract : </td>
        <td><asp:Label ID="abstractLabel" runat="server" Text='<%# Bind("abstract") %>' /></td>
        </tr>
        <tr>
        <td>Administrator's Remark : </td>
        <td><asp:Label ID="adminremarkLabel" runat="server" 
                Text='<%# Bind("adminremark") %>' /></td>
        </tr>    
        </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [papertitle], [subjarea], CONVERT(VARCHAR(10),[datesubmit],105) DATE1, [abstract], [adminremark] FROM [PAPER_MASTER] WHERE ([paperid] = @paperid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="paperid" 
                PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <a href="viewjournal.aspx" target="_blank" style="color: #0000FF">Click Here</a> to view the journal.<br /><br />
    <asp:LinkButton ID="LinkButton2" runat="server" 
        ForeColor="Blue" onclick="LinkButton2_Click">Go For Correction</asp:LinkButton>
&nbsp;&nbsp;
<asp:LinkButton ID="LinkButton3" runat="server" 
        ForeColor="Blue" onclick="LinkButton3_Click">Reject The Journal</asp:LinkButton>
        &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton5" runat="server" 
        ForeColor="Blue" onclick="LinkButton5_Click">Close Window</asp:LinkButton>
</div>
</center>
</div>
</div></div>
</asp:Content>

