<%@ Page Title="" Language="C#" MasterPageFile="~/author_master.master" AutoEventWireup="true" CodeFile="author_loadjournal.aspx.cs" Inherits="author_loadjournal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; padding:10px 10px 10px 10px; font-size:14px;">
    <div style="margin:10px 10px 10px 10px; text-align:center;">
<asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue">Upload Journal</asp:HyperLink> &nbsp; |&nbsp; 
        <asp:LinkButton ID="LinkButton4" runat="server" ForeColor="Blue" 
            onclick="LinkButton4_Click">Correct Journal</asp:LinkButton>
    &nbsp; |&nbsp;
    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
            onclick="LinkButton1_Click">Journal Status</asp:LinkButton>
</div>
<div style="margin:10px 10px 10px 10px; border-color:Silver; border-style:solid; border-width:medium; padding:10px 10px 10px 10px;">
<asp:Label ID="Label7" runat="server" Text="Upload Journal" 
        ForeColor="#FF6600" Font-Names="Tahoma"></asp:Label><br /><br />
Fill up the following form and attach the journal(in PDF format only)
<div style="margin:10px 10px 10px 20px;">
<table border="0" cellpadding="5px" cellspacing="5px" style="vertical-align:top; font-family:Tahoma;">
<tr>
<td>Subject Area* : </td>
<td>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="subjname" 
        DataValueField="subjname">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [subjname] FROM [SUBJECT_MASTER] ORDER BY [subjname]">
    </asp:SqlDataSource>
    </td>
</tr>
<tr>
<td>Title Of the Journal* : </td>
<td>
    <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Width="300px"></asp:TextBox><br />
    <asp:Label ID="Label2" runat="server" Text="cannot be empty" Font-Size="Small" 
        ForeColor="Red" Visible="False"></asp:Label>
    </td>
</tr>
<tr valign="top">
<td>Abstract* : </td>
<td>
    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="450px" 
        Height="250px"></asp:TextBox><br />
    <asp:Label ID="Label3" runat="server" Text="maximum of 200-300 words" 
        Font-Size="Small" ForeColor="Gray"></asp:Label>        
        </td>
</tr>
<tr valign="top">
<td>Upload the File* : </td>
<td>
    <asp:FileUpload ID="FileUpload1" runat="server" />&nbsp;<asp:Label ID="Label5" 
        runat="server" Font-Size="Small" ForeColor="Red" Text="Not a PDF file" 
        Visible="False"></asp:Label>
    <br />
    <asp:Label ID="Label4" runat="server" 
        Text="(only PDF version of the file is allowed to upload)" Font-Size="Small" 
        ForeColor="Gray"></asp:Label>
    </td>
</tr>
<tr>
<td colspan="2">
    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Blue" 
        onclick="LinkButton2_Click">Upload Journal</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton3" runat="server" ForeColor="Blue" 
        onclick="LinkButton3_Click">Refresh</asp:LinkButton>
    <br />
    <asp:Label ID="Label6" runat="server" Font-Size="Small" ForeColor="#009900" 
        Text="Journal has been successfully uploaded" Visible="False"></asp:Label>
    </td>
</tr>
</table>
</div>
</div></div>
</asp:Content>

