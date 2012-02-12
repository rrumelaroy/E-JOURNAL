<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_viewfeedback.aspx.cs" Inherits="admin_viewfeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label6" runat="server" Text="Respond To Feedbacks" ForeColor="#FF6600"></asp:Label><br /><br />
Click on the viewer's name to give response to their feedbacks<br /><br />
<center>
<table cellpadding="5px" cellspacing="0px" border="0">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C9C299; font-family:Tahoma; font-weight:bold; color:White;">
    <th>Name</th>
    <th>Subject</th>
    <th>Feedback</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="LinkButton6" runat="server" ValidationGroup='<%# Eval("vfeedid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("vname") %></asp:LinkButton></td>
    <td><asp:Label ID="vsubject" runat="server" Text='<%# Eval("vsubject") %>'></asp:Label></td>
    <td><asp:Label ID="vfeedback" runat="server" Text='<%# Eval("vfeedback") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#FCDFFF; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="LinkButton6" runat="server" ValidationGroup='<%# Eval("vfeedid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("vname") %></asp:LinkButton></td>
    <td><asp:Label ID="vsubject" runat="server" Text='<%# Eval("vsubject") %>'></asp:Label>...</td>
    <td><asp:Label ID="vfeedback" runat="server" Text='<%# Eval("vfeedback") %>'></asp:Label>...</td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        SelectCommand="SELECT [vfeedid], [vname], [vsubject], [vfeedback], [vanstype] FROM [VIEWER_FEEDBACK_MASTER] WHERE ([vanstype] = @vanstype)">
        <SelectParameters>
            <asp:Parameter DefaultValue="False" Name="vanstype" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HiddenField2" runat="server" />
    <div id="div1" visible="false" style="margin:15px 15px 15px 15px; font-family:Tahoma; border:1px solid Black; padding:10px 10px 10px 10px;" runat="server">
    <table cellpadding="5px" cellspacing="5px">
    <tr>
    <td>Name : </td>
    <td>
        <asp:Label ID="Label1" runat="server"></asp:Label></td>
    </tr>
    <tr valign="top">
    <td>Subject : </td>
    <td>
        <asp:Label ID="Label3" runat="server"></asp:Label></td>
    </tr>
    <tr valign="top">
    <td>Feedback : </td>
    <td>
        <asp:Label ID="Label4" runat="server"></asp:Label></td>
    </tr>
    <tr valign="top">
    <td>Response : </td>
    <td>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" Text="cannot be empty" Font-Size="Small" 
            ForeColor="Red" Visible="False"></asp:Label></td>
    </tr>
    <tr>
    <td colspan="2">
    
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Send Response</asp:LinkButton>
&nbsp;
        <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Cancel</asp:LinkButton>
&nbsp;
        <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Remove From List</asp:LinkButton>
    
    </td>
    </tr>
    </table>
    </div>
</center>
</div>
</div>
</asp:Content>

