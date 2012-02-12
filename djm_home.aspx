<%@ Page Title="" Language="C#" MasterPageFile="~/ejourn_master.master" AutoEventWireup="true" CodeFile="djm_home.aspx.cs" Inherits="djm_home" EnableSessionState="True" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<div style="background-image:url('/E-JOURNAL/img_files/family.JPG'); width:100%; height:100%;">
<br />
<div style=" border-bottom-color:White; border-bottom-width:medium; border-top-color:White; border-top-width:thick; background-color:White; opacity:0.7;">
<div style="color:Gray; font-family:Tahoma; font-size:14px;">
 Digi Journal - Mart is an electronic publication with focus on every kind 
 of subjects, including new technologies, applications, contextual social and 
 economic issues; miscellenious ones. Digi Journal - Mart appeals to a each 
 and every genre of audience.....<a href="about_djm.aspx" style="color: #0000FF">Read More</a>
</div>
</div>
<br />
</div>
<table>
<tr>
<td align="left" valign="top" style="width:736px;">
<div style="margin:10px 10px 10px 10px;">
<div style="font-weight:bold; color:Blue;">
ARTICLE :</div><br />
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
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
            [ <a style="color:Blue" href="currentissue.aspx" target="_blank">Editorial</a> ]
            <asp:Label ID="etitleLabel" runat="server" Text='<%# Bind("etitle") %>' />
            <br />
            <i>By <%# Eval("eeditortitle") %>&nbsp;<%# Eval("efirstname") %>&nbsp;
            <%# Eval("esurname") %></i><br />
            
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT        etitle, eeditortitle, efirstname, esurname, eabouteditor
FROM            EDITORIAL_MASTER
WHERE        (emonth = DATENAME(month, GETDATE())) AND (eyear = DATENAME(year, GETDATE()))">
    </asp:SqlDataSource>
    <br />
    <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            papertitle:
            <asp:TextBox ID="papertitleTextBox" runat="server" 
                Text='<%# Bind("papertitle") %>' />
            <br />
            subjarea:
            <asp:TextBox ID="subjareaTextBox" runat="server" 
                Text='<%# Bind("subjarea") %>' />
            <br />
            atitle:
            <asp:TextBox ID="atitleTextBox" runat="server" Text='<%# Bind("atitle") %>' />
            <br />
            afirstname:
            <asp:TextBox ID="afirstnameTextBox" runat="server" 
                Text='<%# Bind("afirstname") %>' />
            <br />
            asurname:
            <asp:TextBox ID="asurnameTextBox" runat="server" 
                Text='<%# Bind("asurname") %>' />
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
            atitle:
            <asp:TextBox ID="atitleTextBox" runat="server" Text='<%# Bind("atitle") %>' />
            <br />
            afirstname:
            <asp:TextBox ID="afirstnameTextBox" runat="server" 
                Text='<%# Bind("afirstname") %>' />
            <br />
            asurname:
            <asp:TextBox ID="asurnameTextBox" runat="server" 
                Text='<%# Bind("asurname") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
        [ <a style="color:Blue" href="currentissue.aspx" target="_blank">Article</a> ]
            <asp:Label ID="etitleLabel" runat="server" Text='<%# Bind("papertitle") %>' />
            - <asp:Label ID="Label3" runat="server" Text='<%# Bind("subjarea") %>' /><br />
            <i>By <%# Eval("atitle") %>&nbsp;<%# Eval("afirstname") %>&nbsp;
            <%# Eval("asurname") %></i><br />
            
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT        p.papertitle, p.subjarea, a.atitle, a.afirstname, a.asurname
FROM            AUTHOR_MASTER AS a INNER JOIN
                         PAPER_MASTER AS p ON a.authid = p.authid INNER JOIN
                         PAPER_PUBLISH_DETAIL AS pp ON p.paperid = pp.paperid
WHERE        (DATENAME(month, pp.publish_date) = DATENAME(month, GETDATE())) AND (DATENAME(year, pp.publish_date) = DATENAME(year, GETDATE()))">
    </asp:SqlDataSource>

    </div>
</td>
<td style="width:230px;">
<table cellspacing="5px" cellpadding="5px" 
        style="background-image:url('/E-JOURNAL/img_files/logwall.png'); width:310px; font-family:Tahoma; font-size:14px;">
<tr><td colspan=2><div style="background-color:White; opacity:0.5; color:Gray;"> &nbsp;&nbsp; Sign In</div></td></tr>
<tr>
<td>Login Name :</td>
<td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td>Password :</td>
<td><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
</tr>
<tr>
<td>Login Type :</td>
<td><asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem>Free Subscriber</asp:ListItem>
    <asp:ListItem>Paid Subscriber</asp:ListItem>
    <asp:ListItem>Author</asp:ListItem>
    <asp:ListItem>Reviewer</asp:ListItem>
    <asp:ListItem>Administrator</asp:ListItem>
    </asp:DropDownList>
</td>
</tr>
<tr><td colspan="2" align="center" valign="top">
    <asp:Button ID="Button1" runat="server" 
        Text="Sign In" onclick="Button1_Click" /> 
    &nbsp;&nbsp; 
    <asp:Button ID="Button2" runat="server" Text="Refresh" 
        onclick="Button2_Click" />
    <br />
    <asp:Label ID="Label1" runat="server" ForeColor="#CC0000" Font-Size="Small"></asp:Label>
    </td></tr>
<tr><td colspan="2" align="center">
    <asp:LinkButton ID="LinkButton9" runat="server" ForeColor="Red" 
        onclick="LinkButton9_Click">Forgot Password ?</asp:LinkButton><br />
    <div id="div1" runat="server" style="margin-top:5px; font-family:Tahoma; font-size:small;">
    Enter your Login-name and Login-type for verification of the account<br />
    <table cellpadding="5" cellspacing="8" border="0" style="font-family:Tahoma; font-size:small;">
    <tr><td>Login-Name</td>
    <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td></tr>
    <tr><td>Login-Type</td>
    <td><asp:DropDownList ID="DropDownList2" runat="server">
    <asp:ListItem>Free Subscriber</asp:ListItem>
    <asp:ListItem>Paid Subscriber</asp:ListItem>
    <asp:ListItem>Author</asp:ListItem>
    <asp:ListItem>Reviewer</asp:ListItem>
    <asp:ListItem>Administrator</asp:ListItem>
    </asp:DropDownList></td></tr>
    <tr><td colspan="2">
    Enter the Code given below :<br />
    <asp:Image ID="Image1" runat="server" Height="80px" Width="210px" ImageUrl="~/ejourn_captcha.aspx" /><br />
        <asp:TextBox ID="TextBox4" runat="server" BackColor="#FF99FF"></asp:TextBox>
    </td></tr>
    <tr align="center"><td colspan="2">
        <asp:Button ID="Button4" runat="server" 
            Text="Send Password to my Email address" onclick="Button4_Click" /> 
        <br />
    </td></tr></table>        
    </div>
    <asp:Label ID="Label2" runat="server" Text="Label" Font-Names="Tahoma" 
        Font-Size="Small"></asp:Label>
    </td></tr>
<tr><td colspan="2" align="center" style="background-color:Black; opacity:0.5; color:White;">
<center><table cellspacing="10px" style="background-color:transparent">
<tr>
<td align="center">New to Digi Journal - Mart ?</td>
</tr>
<tr><td align="center">
    <asp:Button ID="Button3" runat="server" 
        Text="[ Create an Account ]" Font-Size="Medium" Width="191px" 
        Height="43px" onclick="Button3_Click1" /><br />for free!!!</td></tr>
</table></center>
    
</td></tr>
</table>
</td>
</tr>
</table>
</div>
</asp:Content>

