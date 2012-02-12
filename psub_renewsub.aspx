<%@ Page Title="" Language="C#" MasterPageFile="~/paid_subs_master.master" AutoEventWireup="true" CodeFile="psub_renewsub.aspx.cs" Inherits="psub_renewsub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 197px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; padding:10px 10px 10px 10px; font-size:14px;">
<div style="margin:10px 10px 10px 10px; text-align:center;">
<asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue" 
        NavigateUrl="~/psub_profile.aspx">Profile Manager</asp:HyperLink> &nbsp; |&nbsp; 
<asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Blue" 
            NavigateUrl="~/paidsub_setpass.aspx">Change Password</asp:HyperLink>
&nbsp; |&nbsp;
    <asp:HyperLink ID="HyperLink3" runat="server" ForeColor="Blue">Renew Subscription</asp:HyperLink>
</div>
<div style="margin:10px 10px 10px 10px; border-color:Silver; border-style:solid; border-width:medium; padding:10px 10px 10px 10px;">
<asp:Label ID="Label5" runat="server" Text="Subscription Renewal Form" 
        ForeColor="#FF6600" Font-Names="Tahoma"></asp:Label><br /><br />
Fill up the following details to retain your account
<div style="margin:10px 10px 10px 20px;">
<table cellpadding="5" border="0" style="font-family:Tahoma;">
<tr><td colspan="2">
    <asp:Label ID="Label2" runat="server" ForeColor="Red" Font-Size="Small"></asp:Label></td></tr>
<tr><td colspan="2" style="color:Gray; font-style:italic; font-size:small;">Enter Scheme and Demand Draft information. Please note that draft should be in favor of "DIGI JOURNAL MART" payable at "BHUBANESWAR"</td></tr>
<tr><td class="style1">Choose Scheme* : </td>
<td>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="schdescription" 
        DataValueField="schemeid">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [schemeid], [schdescription] FROM [SCHEME_MASTER]">
    </asp:SqlDataSource>
</td>
</tr>
<tr><td class="style1">Demand Draft Number* : </td>
<td>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Must be a 6-digit number" ControlToValidate="TextBox1" Font-Size="Small" 
        ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
    </td>
</tr>
<tr valign="top"><td class="style1">Bank Name* : </td>
<td>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:Label ID="Label3" runat="server" Text="cannot be empty" Font-Size="Small" 
        ForeColor="Red" Visible="False"></asp:Label></td>
</tr>
<tr valign="top">
<td class="style1">DD Making Date* : </td>
<td>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox> <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/img_files/calendar1.png" onclick="ImageButton1_Click" 
                        style="width: 18px" />
                    
            <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
                BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="120px" 
                onselectionchanged="Calendar1_SelectionChanged" ShowGridLines="True" 
                Visible="False" Width="200px">
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <SelectorStyle BackColor="#FFCC66" />
                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                    ForeColor="#FFFFCC" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
            </asp:Calendar>
                    
        </ContentTemplate>
    </asp:UpdatePanel>
</td>
</tr>
<tr><td colspan="2" align="center">
    <asp:Button ID="Button1" runat="server" Text="Apply for Subscription" 
        onclick="Button1_Click" />
    &nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="Refresh" 
        onclick="Button2_Click" /><br />
    <asp:Label ID="Label4" runat="server" Font-Size="Small"></asp:Label></td></tr>
</table>
</div></div></div>
</asp:Content>

