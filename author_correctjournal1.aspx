<%@ Page Title="" Language="C#" MasterPageFile="~/author_master.master" AutoEventWireup="true" CodeFile="author_correctjournal1.aspx.cs" Inherits="author_correctjournal1" %>

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
</div>
    <asp:HiddenField ID="HiddenField1" runat="server" />
<div style="margin:10px 10px 10px 10px; border-color:Silver; border-style:solid; border-width:medium; padding:10px 10px 10px 10px;">
<asp:Label ID="Label1" runat="server" Text="Journal Correction Form" ForeColor="#FF6600" 
        Font-Names="Tahoma" Font-Size="Large"></asp:Label>
<div style="margin:10px 10px 10px 20px;">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            subjarea:
            <asp:TextBox ID="subjareaTextBox" runat="server" 
                Text='<%# Bind("subjarea") %>' />
            <br />
            papertitle:
            <asp:TextBox ID="papertitleTextBox" runat="server" 
                Text='<%# Bind("papertitle") %>' />
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
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
        <table border="0" cellpadding="5px" cellspacing="5px" style="vertical-align:top; font-family:Tahoma;">
        <tr>
        <td>Subject Area : </td>
        <td><asp:Label ID="subjareaLabel" runat="server" Text='<%# Bind("subjarea") %>' /></td></tr>
        <tr>
        <td>Title of the Journal : </td>
        <td><asp:Label ID="papertitleLabel" runat="server" 
                Text='<%# Bind("papertitle") %>' /></td>
        </tr></table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [subjarea], [papertitle] FROM [PAPER_MASTER] WHERE ([paperid] = @paperid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="paperid" 
                PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
<table border="0" cellpadding="5px" cellspacing="5px" style="vertical-align:top; font-family:Tahoma;">
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
    </td></tr>
<tr><td colspan="2">
<asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Blue" 
        onclick="LinkButton2_Click">Submit Corrected - Journal</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton3" runat="server" ForeColor="Blue" 
        onclick="LinkButton3_Click">Close Correction Form</asp:LinkButton>
</td></tr>
</table>
</div></div></div>
</asp:Content>

