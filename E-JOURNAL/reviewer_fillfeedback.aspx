<%@ Page Title="" Language="C#" MasterPageFile="~/reviewer_master.master" AutoEventWireup="true" CodeFile="reviewer_fillfeedback.aspx.cs" Inherits="reviewer_fillfeedback" %>

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
<center><asp:Label ID="Label1" runat="server" Text="Reviwer's Feedback Form" ForeColor="#FF6600" 
        Font-Names="Tahoma" Font-Size="Large" Font-Underline="True"></asp:Label></center>
<table cellpadding="5px" cellspacing="5px" border="0" style="font-family:Tahoma">
<tr>
<td>Name of the Author : </td>
<td>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
</tr>
<tr>
<td>Title of the Journal : </td>
<td>
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
</tr>
</table>
<table cellpadding="5px" cellspacing="5px" border="0" style="font-family:Tahoma">
<tr><td colspan="2" align="center">
    <asp:Label ID="Label4" runat="server" Text="Content" Font-Underline="True" ForeColor="#FF6600"></asp:Label></td></tr>
<tr><td colspan="2"><b>This Journal : </b></td></tr>
<tr><td>Has a clearly stated <b>thesis</b>, <b>theme</b>, or controlling <b>idea</b></td>
<td>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="grade" DataValueField="grade">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [GRADE_MASTER]"></asp:SqlDataSource>
</td>
</tr>
<tr>
<td>Has a clear <b>organization</b> and <b>structure</b></td>
<td>
    <asp:DropDownList ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="grade" DataValueField="grade">
    </asp:DropDownList>
    </td>
</tr>
<tr>
<td><b>Develops</b> the theme with <b>details</b> and <b>supporting evidence</b></td>
<td>
    <asp:DropDownList ID="DropDownList3" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="grade" DataValueField="grade">
    </asp:DropDownList>
</td>
</tr>
<tr>
<td>Has sufficient <b>content</b> for the assignment</td>
<td><asp:DropDownList ID="DropDownList4" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="grade" DataValueField="grade">
    </asp:DropDownList></td>
</tr>
<tr><td colspan="2" align="center">
    <asp:Label ID="Label5" runat="server" Text="Presentation" Font-Underline="True" ForeColor="#FF6600"></asp:Label></td></tr>
<tr><td colspan="2"><b>This Author : </b></td></tr>
<tr>
<td>Conveys a particular <b>voice</b> intended for a specific <b>audience</b></td>
<td>
    <asp:DropDownList ID="DropDownList5" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="grade" DataValueField="grade">
    </asp:DropDownList>
    </td>
</tr>
<tr>
<td>Uses appropriate <b>word-choice</b> and <b>style</b></td>
<td>
    <asp:DropDownList ID="DropDownList6" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="grade" DataValueField="grade">
    </asp:DropDownList>
</td>
</tr>
<tr>
<td>Includes no <b>mechanical errors</b></td>
<td><asp:DropDownList ID="DropDownList7" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="grade" DataValueField="grade">
    </asp:DropDownList></td>
</tr>
<tr><td colspan="2" align="center">
    <asp:Label ID="Label6" runat="server" Text="Research" Font-Underline="True" ForeColor="#FF6600"></asp:Label></td></tr>
<tr>
<td>Sources are <b>varied</b></td>
<td>
    <asp:DropDownList ID="DropDownList8" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="grade" DataValueField="grade">
    </asp:DropDownList>
    </td>
</tr>
<tr>
<td>Sources are <b>accurate</b> and <b>reliable</b></td>
<td>
    <asp:DropDownList ID="DropDownList9" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="grade" DataValueField="grade">
    </asp:DropDownList>
</td>
</tr>
<tr>
<td>Source material is <b>correctly incorporated</b> into the paper</td>
<td><asp:DropDownList ID="DropDownList10" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="grade" DataValueField="grade">
    </asp:DropDownList></td>
</tr>
<tr>
<td><b>Bibliography page</b> is accurate and complete</td>
<td>
    <asp:DropDownList ID="DropDownList11" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="grade" DataValueField="grade">
    </asp:DropDownList>
</td>
</tr>
</table>
<table cellpadding="5px" cellspacing="5px" border="0" style="font-family:Tahoma">
<tr><td valign="top">Strength : </td>
<td>
    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="500px" 
        Height="100px"></asp:TextBox></td>
</tr>
<tr><td valign="top">Weakness : </td>
<td>
    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="500px" 
        Height="100px"></asp:TextBox></td>
</tr>
<tr><td valign="top">Summary* : </td>
<td>
    <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Width="500px" 
        Height="100px"></asp:TextBox><br />
    <asp:Label ID="Label7" runat="server" Text="cannot be empty" Font-Size="Small" 
        ForeColor="Red" Visible="False"></asp:Label></td>
</tr>
<tr><td colspan="2">
    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Blue" 
        onclick="LinkButton2_Click">Submit Feedback</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton3" runat="server" ForeColor="Blue" 
        onclick="LinkButton3_Click">Cancel</asp:LinkButton>
</td></tr>
</table>
</div></div>
</asp:Content>

