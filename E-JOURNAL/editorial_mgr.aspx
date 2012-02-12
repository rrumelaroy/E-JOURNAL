<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="editorial_mgr.aspx.cs" Inherits="editorial_mgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="padding:100px 10px 10px 10px; background-color:White; font-family:Tahoma;">
<div style="border:2px solid Silver; margin:5px 5px 5px 5px; padding:10px 10px 10px 10px;">
<asp:Label ID="Label2" runat="server" Text="Editorial Manager" 
        Font-Size="X-Large" ForeColor="#FF6600" Font-Names="Tahoma"></asp:Label>
<center>
<div style="margin:20px 20px 20px 30px;" runat="server" id="div1">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            emonth:
            <asp:TextBox ID="emonthTextBox" runat="server" Text='<%# Bind("emonth") %>' />
            <br />
            eyear:
            <asp:TextBox ID="eyearTextBox" runat="server" Text='<%# Bind("eyear") %>' />
            <br />
            etitle:
            <asp:TextBox ID="etitleTextBox" runat="server" Text='<%# Bind("etitle") %>' />
            <br />
            eeditortitle:
            <asp:TextBox ID="eeditortitleTextBox" runat="server" 
                Text='<%# Bind("eeditortitle") %>' />
            <br />
            efirstname:
            <asp:TextBox ID="efirstnameTextBox" runat="server" 
                Text='<%# Bind("efirstname") %>' />
            <br />
            esurname:
            <asp:TextBox ID="esurnameTextBox" runat="server" 
                Text='<%# Bind("esurname") %>' />
            <br />
            eabouteditor:
            <asp:TextBox ID="eabouteditorTextBox" runat="server" 
                Text='<%# Bind("eabouteditor") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            emonth:
            <asp:TextBox ID="emonthTextBox" runat="server" Text='<%# Bind("emonth") %>' />
            <br />
            eyear:
            <asp:TextBox ID="eyearTextBox" runat="server" Text='<%# Bind("eyear") %>' />
            <br />
            etitle:
            <asp:TextBox ID="etitleTextBox" runat="server" Text='<%# Bind("etitle") %>' />
            <br />
            eeditortitle:
            <asp:TextBox ID="eeditortitleTextBox" runat="server" 
                Text='<%# Bind("eeditortitle") %>' />
            <br />
            efirstname:
            <asp:TextBox ID="efirstnameTextBox" runat="server" 
                Text='<%# Bind("efirstname") %>' />
            <br />
            esurname:
            <asp:TextBox ID="esurnameTextBox" runat="server" 
                Text='<%# Bind("esurname") %>' />
            <br />
            eabouteditor:
            <asp:TextBox ID="eabouteditorTextBox" runat="server" 
                Text='<%# Bind("eabouteditor") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
        <table cellpadding="5px" cellspacing="5px">
        <tr>
        <td>Date Of The Editorial Issue : </td>
        <td><asp:Label ID="emonthLabel" runat="server" Text='<%# Bind("emonth") %>' /> &nbsp;
        <asp:Label ID="eyearLabel" runat="server" Text='<%# Bind("eyear") %>' />
        </td>
        </tr>
        <tr>
        <td>Title of the Editorial : </td>
        <td><asp:Label ID="etitleLabel" runat="server" Text='<%# Bind("etitle") %>' /></td>
        </tr>
        <tr>
        <td>Writer of this Editorial : </td>
        <td><asp:Label ID="eeditortitleLabel" runat="server" 
                Text='<%# Bind("eeditortitle") %>' /> &nbsp;
        <asp:Label ID="efirstnameLabel" runat="server" 
                Text='<%# Bind("efirstname") %>' /> &nbsp;
        <asp:Label ID="esurnameLabel" runat="server" Text='<%# Bind("esurname") %>' />
        </td>
        </tr>
        <tr>
        <td>About the Editor : </td>
        <td><asp:Label ID="eabouteditorLabel" runat="server" 
                Text='<%# Bind("eabouteditor") %>' /></td>
        </tr>
        </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT emonth, eyear, etitle, eeditortitle, efirstname, esurname, eabouteditor FROM EDITORIAL_MASTER WHERE (emonth = DATENAME(month, DATEADD(month, 1, GETDATE()))) AND (eyear = DATENAME(year, DATEADD(month, 1, GETDATE())))">
    </asp:SqlDataSource>
</div>
    <asp:HiddenField ID="HiddenField1" runat="server" />
<div style="margin:20px 20px 20px 30px;">
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Add</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Change</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Remove</asp:LinkButton>
    <br />
    <asp:Label ID="Label3" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
</div>
</center>
<div style="margin:20px 20px 20px 30px; border:1px solid black;" runat="server" id="div2" visible="false">
<asp:Label ID="Label1" runat="server" Text="Add Editorial for the Coming Month" 
        Font-Size="Medium" ForeColor="#FF6600" Font-Names="Tahoma"></asp:Label>

<table border="0" cellpadding="5px" cellspacing="5px" style="vertical-align:top; font-family:Tahoma;">
<tr valign="top">
<td>Title of the Editorial* : </td>
<td>
<asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Width="300px"></asp:TextBox><br />
    <asp:Label ID="Label4" runat="server" Text="cannot be empty" Font-Size="Small" 
        ForeColor="Red" Visible="False"></asp:Label>
</td>
</tr>
<tr valign="top">
<td>Upload the Editorial File* : </td>
<td>
    <asp:FileUpload ID="FileUpload1" runat="server" />&nbsp;<asp:Label ID="Label5" 
        runat="server" Font-Size="Small" ForeColor="Red" Text="Not a PDF file" 
        Visible="False"></asp:Label>
    <br />
    <asp:Label ID="Label6" runat="server" 
        Text="(only PDF version of the file is allowed to upload)" Font-Size="Small" 
        ForeColor="Gray"></asp:Label>
    </td>
</tr>
<tr>
<td colspan="4" style="color:Green;">EDITOR'S INFORMATION :- </td>
</tr>
<tr>
<td>Title* : </td>
<td>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Ms.</asp:ListItem>
                <asp:ListItem>Miss.</asp:ListItem>
                <asp:ListItem>Mr.</asp:ListItem>
                <asp:ListItem>Mrs.</asp:ListItem>
            </asp:DropDownList> </td>
</tr>
<tr>
<td>First Name* : </td>
<td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>&nbsp;<asp:Label 
        ID="Label7" runat="server" Font-Size="Small" ForeColor="Red" 
        Text="cannot be empty" Visible="False"></asp:Label>
    </td>
<td>Surname* : </td>
<td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
</tr>
<tr valign="top">
<td>About the Editor : </td>
<td colspan="3">

    <asp:TextBox ID="TextBox7" runat="server" Height="81px" TextMode="MultiLine" 
        Width="518px"></asp:TextBox><br />
    <asp:Label ID="Label8" runat="server" Text="( 50 - 100 words only )" 
        Font-Size="Small" ForeColor="Gray"></asp:Label>
</td>
</tr>
<tr>
<td colspan="4">
    <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Upload Editorial</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton5" runat="server" onclick="LinkButton5_Click">Close Window</asp:LinkButton>
</td>
</tr>
</table>
</div>
<div style="margin:20px 20px 20px 30px; border:1px solid black;" runat="server" id="div3" visible="false">
<asp:Label ID="Label9" runat="server" Text="Update Editorial for the Coming Month" 
        Font-Size="Medium" ForeColor="#FF6600" Font-Names="Tahoma"></asp:Label>

<table border="0" cellpadding="5px" cellspacing="5px" style="vertical-align:top; font-family:Tahoma;">
<tr valign="top">
<td>Title of the Editorial* : </td>
<td>
<asp:TextBox ID="TextBox3" runat="server" MaxLength="50" Width="300px"></asp:TextBox><br />
    <asp:Label ID="Label10" runat="server" Text="cannot be empty" Font-Size="Small" 
        ForeColor="Red" Visible="False"></asp:Label>
</td>
</tr>
<tr valign="top">
<td>Upload the Editorial File* : </td>
<td>
    <asp:FileUpload ID="FileUpload2" runat="server" />&nbsp;<asp:Label ID="Label11" 
        runat="server" Font-Size="Small" ForeColor="Red" Text="Not a PDF file" 
        Visible="False"></asp:Label>
    <br />
    <asp:Label ID="Label12" runat="server" 
        Text="(only PDF version of the file is allowed to upload)" Font-Size="Small" 
        ForeColor="Gray"></asp:Label>
    </td>
</tr>
<tr>
<td colspan="4" style="color:Green;">EDITOR'S INFORMATION :- </td>
</tr>
<tr>
<td>Title* : </td>
<td>
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>Ms.</asp:ListItem>
                <asp:ListItem>Miss.</asp:ListItem>
                <asp:ListItem>Mr.</asp:ListItem>
                <asp:ListItem>Mrs.</asp:ListItem>
            </asp:DropDownList> </td>
</tr>
<tr>
<td>First Name* : </td>
<td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>&nbsp;<asp:Label 
        ID="Label13" runat="server" Font-Size="Small" ForeColor="Red" 
        Text="cannot be empty"></asp:Label>
    </td>
<td>Surname* : </td>
<td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
</tr>
<tr valign="top">
<td>About the Editor : </td>
<td colspan="3">

    <asp:TextBox ID="TextBox8" runat="server" Height="81px" TextMode="MultiLine" 
        Width="518px"></asp:TextBox><br />
    <asp:Label ID="Label14" runat="server" Text="( 50 - 100 words only )" 
        Font-Size="Small" ForeColor="Gray"></asp:Label>
</td>
</tr>
<tr>
<td colspan="4">
    <asp:LinkButton ID="LinkButton6" runat="server" onclick="LinkButton6_Click">Update Editorial</asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="LinkButton7" runat="server" onclick="LinkButton7_Click">Close Window</asp:LinkButton>
</td>
</tr>
</table>
</div>
</div></div>
</asp:Content>

