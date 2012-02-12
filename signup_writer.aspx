<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup_writer.aspx.cs" Inherits="signup_writer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
    .bodyclass
    {        
        margin-left:220px;
        margin-right:100px;
    }
        .style3
        {
            width: 170px;
        }
        .style4
        {
            width: 150px;
        }
        .style5
        {
            height: 62px;
        }
        .style6
        {
            height: 49px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <table cellspacing="0px" cellpadding="0px" style="width: 1255px; height: 100%; background-attachment:fixed;">
    <tr valign="top">
    <td width="100px" bgcolor="#c0c0c0" rowspan=2><br /><br /><br /></td>
    <td width="2px" bgcolor="#999999" rowspan=2></td>
    <td width="1px" bgcolor="#ffffff" rowspan=2></td>
    <td width="10px" bgcolor="#cccccc" rowspan=2></td>
    <td width="1px" bgcolor="White" rowspan=2></td>
    <td bgcolor="#9999ff" ><div style="margin-left:10px; margin-right:10px;">
    <table width=100%>
    <tr>
    <td valign=bottom style="color:White;"><a href="djm_home.aspx"><asp:Image ID="Image4" runat="server" ImageUrl="~/img_files/home.png" />Go to Home Page</a></td>
    <td align=right valign=bottom style="color:White;">
    <b>Sign Up as :&nbsp; </b>&nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl="~/signup_freesub.aspx">Free Subscriber</asp:HyperLink>&nbsp; |&nbsp;
        <asp:HyperLink ID="HyperLink3" runat="server" 
            NavigateUrl="~/signup_paidsub.aspx">Paid Subscriber</asp:HyperLink>
    &nbsp;| Author</td>
    </tr>
    </table>
    </div></td>
    <td width="1px" bgcolor="White" rowspan=2></td>
    <td width="10px" bgcolor="#cccccc" rowspan=2></td>
    <td width="1px" bgcolor="#ffffff" rowspan=2></td>
    <td width="2px" bgcolor="#999999" rowspan=2></td>
    <td width="100px" bgcolor="#c0c0c0" rowspan=2></td>
    </tr>
    <tr>
    <td bgcolor="#ffffff">
    <div style="margin:10px 10px 10px 10px;">
    If you already have a writer account in this website then 
        <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">sign in here.</asp:LinkButton>
        <div style="border: medium solid #990033; margin:10px 10px 10px 10px;">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager><center>
        <table cellspacing="25px" border="0">
        <tr>
        <td colspan=4>
            <asp:Label ID="Label1" runat="server" Text="Registration Form for Author" 
                Font-Bold="True" Font-Size="X-Large"></asp:Label></td>
        </tr>
        <tr>
        <td><asp:Label ID="Label9" runat="server" Text="Title* :"></asp:Label></td>
        <td>
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>Ms.</asp:ListItem>
                <asp:ListItem>Miss.</asp:ListItem>
                <asp:ListItem>Mr.</asp:ListItem>
                <asp:ListItem>Mrs.</asp:ListItem>
            </asp:DropDownList> </td>
        </tr><tr>
        <td><asp:Label ID="Label10" runat="server" Text="First Name* :"></asp:Label></td>
        <td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>&nbsp;<asp:Label 
                ID="Label30" runat="server" Font-Size="Medium" ForeColor="Red" Visible="False">cannot be empty</asp:Label>
                </td>
        <td class="style4"><asp:Label ID="Label11" runat="server" Text="Surname :"></asp:Label></td>
        <td class="style3"><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
        </tr><tr valign="top">
        <td><asp:Label ID="Label2" runat="server" Text="Login Name* : "></asp:Label></td>
        <td>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                &nbsp;<asp:Image ID="Image1" runat="server" src="img_files/ok.png" Visible="false" />
                <br />
                <asp:Label ID="Label3" runat="server" Font-Size="Small" ForeColor="Gray">atleast 6 characters</asp:Label>
                <br />
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    Text="Check Availability !" />
                <br />

                <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                    AssociatedUpdatePanelID="UpdatePanel2">
                        <ProgressTemplate>
                            <asp:Image ID="Image2" runat="server" ImageAlign="Middle" 
                                ImageUrl="~/img_files/progress.gif" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel></td>
        </tr>
        <tr valign="top">
        <td><asp:Label ID="Label4" runat="server" Text="Choose Password* :"></asp:Label></td>
        <td><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>&nbsp;<br />
                <asp:Label ID="Label31" runat="server" Font-Size="Medium" ForeColor="Gray">atleast 6 characters</asp:Label>
                </td>
        <td class="style4"><asp:Label ID="Label5" runat="server" Text="Confirm Password* :"></asp:Label></td>
        <td><asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
            <br />
                <asp:Label ID="Label32" runat="server" Font-Size="Medium" ForeColor="Red" 
                Visible="False">password entered is not same</asp:Label>
                </td>
        </tr>
        <tr>
        <td><asp:Label ID="Label6" runat="server" Text="Security Question* :"></asp:Label></td>
        <td><asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>What is your pet name ?</asp:ListItem>
                <asp:ListItem>Where is your hometown?</asp:ListItem>
            </asp:DropDownList></td>
        </tr>
        <tr>
        <td><asp:Label ID="Label7" runat="server" Text="Answer :"></asp:Label></td>
        <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
        </tr>
        <tr><td colspan=4 class="style5"><hr />
            <asp:Label ID="Label12" runat="server" Text="Enter your contact information" 
                ForeColor="#666666" Font-Bold="False" Font-Italic="True"></asp:Label></td></tr>
        <tr>
        <td valign="top"><asp:Label ID="Label13" runat="server" Text="Address :"></asp:Label></td>
        <td><asp:TextBox ID="TextBox8" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox></td>
        </tr>
        <tr>
        <td><asp:Label ID="Label14" runat="server" Text="City :"></asp:Label></td>
        <td><asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
        <td class="style4"><asp:Label ID="Label15" runat="server" Text="State :"></asp:Label></td>
        <td><asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
        </tr>
        <tr valign="top">
        <td><asp:Label ID="Label16" runat="server" Text="Zip Code :"></asp:Label></td>
        <td><asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
        <td class="style4"><asp:Label ID="Label17" runat="server" Text="Country* :"></asp:Label></td>
        <td>
            <asp:DropDownList ID="DropDownList3" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="cname" DataValueField="cname">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [cname] FROM [countryname] ORDER BY [cname]">
            </asp:SqlDataSource>
            <br />
                </td>
        </tr>
        <tr valign="top">
        <td class="style6"><asp:Label ID="Label8" runat="server" Text="email Address* :"></asp:Label></td>
        <td class="style6"><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox5" ErrorMessage="not a valid email address" 
                ForeColor="Red" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr><td colspan=4><hr />
            <asp:Label ID="Label24" runat="server" 
                Text="Enter Educational and Employement information" Font-Italic="True" 
                ForeColor="#666666"></asp:Label></td></tr>
        <tr>
        <td><asp:Label ID="Label25" runat="server" Text="Highest Qualification* :"></asp:Label></td>
        <td colspan=2><asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>&nbsp;<asp:Label 
                ID="Label34" runat="server" Font-Size="Medium" ForeColor="Red" Visible="False">cannot be empty</asp:Label>
                </td>
        </tr>
        <tr valign="top">
        <td><asp:Label ID="Label26" runat="server" Text="Current Designation* :"></asp:Label></td>
        <td><asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>&nbsp;<asp:Label 
                ID="Label35" runat="server" Font-Size="Medium" ForeColor="Red" Visible="False">cannot be empty</asp:Label>
                </td>
        <td><asp:Label ID="Label27" runat="server" Text="Employer/Organization* :"></asp:Label></td>
        <td><asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
            <br />
                <asp:Label ID="Label36" runat="server" Font-Size="Medium" ForeColor="Red" 
                Visible="False">cannot be empty</asp:Label>
                </td>
        </tr>
        <tr>
        <td valign="top"><asp:Label ID="Label28" runat="server" Text="Word Verification* :"></asp:Label></td>
        <td>
        <asp:Label ID="Label29" runat="server" Text="Type the characters you see in the picture below"></asp:Label><br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Image ID="Image3" runat="server" Height="80px" 
                        ImageUrl="~/ejourn_captcha.aspx" Width="210px" />
                    <br />
                    <asp:TextBox ID="TextBox21" runat="server" BackColor="#FFCCFF"></asp:TextBox>
                    &nbsp;<asp:Label ID="Label37" runat="server" Font-Size="Medium" ForeColor="Red" 
                        Visible="False">please write carefully</asp:Label>
                    &nbsp;
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
        </tr>
        </table></center>
        <center><asp:Button ID="Button1" runat="server" Text="SUBMIT" 
                onclick="Button1_Click"/>&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Refresh</asp:LinkButton>
            <br />
            <asp:Label ID="Label38" runat="server" ForeColor="#009900" 
                        
                Text="Your account activation request has been sent successfully. For further information check your mail." 
                Visible="False"></asp:Label>
                </center>
        <br />       
        </div>
    </div>
    </td>
    </tr>
    </table>
    </form>
</body>
</html>

