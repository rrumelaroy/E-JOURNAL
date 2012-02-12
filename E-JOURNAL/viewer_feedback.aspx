<%@ Page Title="" Language="C#" MasterPageFile="~/ejourn_master.master" AutoEventWireup="true" CodeFile="viewer_feedback.aspx.cs" Inherits="viewer_feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:3px solid Black;">

    <asp:Label ID="Label1" runat="server" Font-Names="Tahoma" Font-Size="X-Large" 
        ForeColor="#660066" Text="Send Us Feedback"></asp:Label><br /><br />
    <center>
    <table cellpadding="5px" cellspacing="5px" border="0" style="font-family:Tahoma; font-size:medium;">
    <tr>
    <td>Name* : </td>
    <td>
        <asp:TextBox ID="TextBox1" runat="server" MaxLength="30"></asp:TextBox><asp:Label
            ID="Label2" runat="server" Text="cannot be empty" ForeColor="Red" 
            Visible="False" Font-Size="Small"></asp:Label></td>
    </tr>
    <tr>
    <td>email address* : </td>
    <td>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> 
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="TextBox2" ErrorMessage="not a valid email address" 
            Font-Size="Small" ForeColor="Red" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
    </tr>    
    <tr>
    <td>Subject : </td>
    <td>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
    </tr>
    <tr valign="top">
    <td>Feedback* : </td>
    <td>
        <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox><br />
        <asp:Label ID="Label3" runat="server" Text="Maximum Word Limit 500 characters" 
            Font-Size="Small" ForeColor="Gray"></asp:Label>
        </td>
    </tr>
    <tr valign="top">
    <td>Enter the Code* : </td>
    <td><asp:Image ID="Image3" runat="server" Height="80px" ImageUrl="~/ejourn_captcha.aspx" Width="210px" />
    <br /><br />
        <asp:TextBox ID="TextBox5" runat="server" BackColor="#FF99FF"></asp:TextBox> 
        <asp:Label ID="Label4" runat="server" Text="The code doesn't match" 
            Font-Size="Small" ForeColor="Red" Visible="False"></asp:Label>                
    </td>
    </tr>
    <tr>
    <td colspan="2" align="center">
        <asp:Button ID="Button1" runat="server" Text="Send Feedback" 
            onclick="Button1_Click" /> 
        &nbsp; 
        <asp:Button ID="Button2" runat="server" Text="Refresh" 
            onclick="Button2_Click" />
        <br />
        <asp:Label ID="Label5" runat="server" Font-Size="Small" ForeColor="#009900" 
            Text="Feedback is sent successfully. Reply would be mailed to you" 
            Visible="False"></asp:Label>
    </td>
    </tr>
    </table>
    </center>
</div>
</asp:Content>

