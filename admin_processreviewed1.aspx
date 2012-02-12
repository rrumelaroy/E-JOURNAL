<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_processreviewed1.aspx.cs" Inherits="admin_processreviewed1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; font-size:14px; font-family:Tahoma; padding:100px 10px 10px 10px;">
<div style="margin:10px 10px 10px 10px; padding:10px 10px 10px 10px; border:2px solid silver;">
<asp:Label ID="Label9" runat="server" Text="Process Reviewed Journal" ForeColor="#FF6600"></asp:Label><br /><br />
Click on the title of the Journal for viewing reviewer's feedback<br /><br />
<center>
<table cellpadding="5px" cellspacing="0px" border="0">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#C9C299; font-family:Tahoma; font-weight:bold; color:White;">
    <th>Title of the Journal</th>
    <th>Subject Area</th>
    <th>Author</th>
    <th>No. of Reviewer(s) assigned</th>
    <th>No. of days spent in Reviewing</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:White; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="LinkButton6" runat="server" ValidationGroup='<%# Eval("paperid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("papertitle") %></asp:LinkButton></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label></td>
    <td><asp:Label ID="reviewers" runat="server" Text='<%# Eval("Expr1") %>'></asp:Label></td>
    <td><asp:Label ID="REVIEWDATE" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#CCFB5D; font-family:Tahoma; color:Black;">
    <td><asp:LinkButton ID="LinkButton6" runat="server" ValidationGroup='<%# Eval("paperid") %>' OnClick="desclick" ForeColor="Blue"><%# Eval("papertitle") %></asp:LinkButton></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label></td>
    <td><asp:Label ID="reviewers" runat="server" Text='<%# Eval("Expr1") %>'></asp:Label></td>
    <td><asp:Label ID="REVIEWDATE" runat="server" Text='<%# Eval("DATE1") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        SelectCommand="SELECT DISTINCT r.paperid, p.papertitle, p.subjarea, a.afirstname, COUNT(r.paperid) AS Expr1, DATEDIFF(day, r.datereview, { fn CURDATE() }) AS DATE1 FROM PAPER_REVIEWING_DETAIL AS r INNER JOIN PAPER_MASTER AS p ON r.paperid = p.paperid INNER JOIN AUTHOR_MASTER AS a ON p.authid = a.authid WHERE (NOT (r.papreviewstatus = 'evaluated')) AND (p.paperstatus = 'reviewing') GROUP BY r.paperid, p.papertitle, p.subjarea, a.afirstname, r.datereview">
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <div id="div1" visible="false" 
        style="margin:15px 15px 15px 15px; font-family:Tahoma; border:1px solid Black; padding:10px 10px 10px 20px;" 
        runat="server" align="left"><center>
<asp:Label ID="Label5" runat="server" Text="Reviewers' Feedback" ForeColor="#FF6600"></asp:Label></center>
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
            DataSourceID="SqlDataSource2">
            <EditItemTemplate>
                papertitle:
                <asp:TextBox ID="papertitleTextBox" runat="server" 
                    Text='<%# Bind("papertitle") %>' />
                <br />
                rtitle:
                <asp:TextBox ID="rtitleTextBox" runat="server" Text='<%# Bind("rtitle") %>' />
                <br />
                rfirstname:
                <asp:TextBox ID="rfirstnameTextBox" runat="server" 
                    Text='<%# Bind("rfirstname") %>' />
                <br />
                rsurname:
                <asp:TextBox ID="rsurnameTextBox" runat="server" 
                    Text='<%# Bind("rsurname") %>' />
                <br />
                content_idea:
                <asp:TextBox ID="content_ideaTextBox" runat="server" 
                    Text='<%# Bind("content_idea") %>' />
                <br />
                content_struct:
                <asp:TextBox ID="content_structTextBox" runat="server" 
                    Text='<%# Bind("content_struct") %>' />
                <br />
                content_detail:
                <asp:TextBox ID="content_detailTextBox" runat="server" 
                    Text='<%# Bind("content_detail") %>' />
                <br />
                content_sufficient:
                <asp:TextBox ID="content_sufficientTextBox" runat="server" 
                    Text='<%# Bind("content_sufficient") %>' />
                <br />
                pre_voice:
                <asp:TextBox ID="pre_voiceTextBox" runat="server" 
                    Text='<%# Bind("pre_voice") %>' />
                <br />
                pre_style:
                <asp:TextBox ID="pre_styleTextBox" runat="server" 
                    Text='<%# Bind("pre_style") %>' />
                <br />
                pre_error:
                <asp:TextBox ID="pre_errorTextBox" runat="server" 
                    Text='<%# Bind("pre_error") %>' />
                <br />
                res_varried:
                <asp:TextBox ID="res_varriedTextBox" runat="server" 
                    Text='<%# Bind("res_varried") %>' />
                <br />
                res_accurate:
                <asp:TextBox ID="res_accurateTextBox" runat="server" 
                    Text='<%# Bind("res_accurate") %>' />
                <br />
                res_incorp:
                <asp:TextBox ID="res_incorpTextBox" runat="server" 
                    Text='<%# Bind("res_incorp") %>' />
                <br />
                res_biblio:
                <asp:TextBox ID="res_biblioTextBox" runat="server" 
                    Text='<%# Bind("res_biblio") %>' />
                <br />
                strength:
                <asp:TextBox ID="strengthTextBox" runat="server" 
                    Text='<%# Bind("strength") %>' />
                <br />
                weakness:
                <asp:TextBox ID="weaknessTextBox" runat="server" 
                    Text='<%# Bind("weakness") %>' />
                <br />
                summary:
                <asp:TextBox ID="summaryTextBox" runat="server" Text='<%# Bind("summary") %>' />
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
                rtitle:
                <asp:TextBox ID="rtitleTextBox" runat="server" Text='<%# Bind("rtitle") %>' />
                <br />
                rfirstname:
                <asp:TextBox ID="rfirstnameTextBox" runat="server" 
                    Text='<%# Bind("rfirstname") %>' />
                <br />
                rsurname:
                <asp:TextBox ID="rsurnameTextBox" runat="server" 
                    Text='<%# Bind("rsurname") %>' />
                <br />
                content_idea:
                <asp:TextBox ID="content_ideaTextBox" runat="server" 
                    Text='<%# Bind("content_idea") %>' />
                <br />
                content_struct:
                <asp:TextBox ID="content_structTextBox" runat="server" 
                    Text='<%# Bind("content_struct") %>' />
                <br />
                content_detail:
                <asp:TextBox ID="content_detailTextBox" runat="server" 
                    Text='<%# Bind("content_detail") %>' />
                <br />
                content_sufficient:
                <asp:TextBox ID="content_sufficientTextBox" runat="server" 
                    Text='<%# Bind("content_sufficient") %>' />
                <br />
                pre_voice:
                <asp:TextBox ID="pre_voiceTextBox" runat="server" 
                    Text='<%# Bind("pre_voice") %>' />
                <br />
                pre_style:
                <asp:TextBox ID="pre_styleTextBox" runat="server" 
                    Text='<%# Bind("pre_style") %>' />
                <br />
                pre_error:
                <asp:TextBox ID="pre_errorTextBox" runat="server" 
                    Text='<%# Bind("pre_error") %>' />
                <br />
                res_varried:
                <asp:TextBox ID="res_varriedTextBox" runat="server" 
                    Text='<%# Bind("res_varried") %>' />
                <br />
                res_accurate:
                <asp:TextBox ID="res_accurateTextBox" runat="server" 
                    Text='<%# Bind("res_accurate") %>' />
                <br />
                res_incorp:
                <asp:TextBox ID="res_incorpTextBox" runat="server" 
                    Text='<%# Bind("res_incorp") %>' />
                <br />
                res_biblio:
                <asp:TextBox ID="res_biblioTextBox" runat="server" 
                    Text='<%# Bind("res_biblio") %>' />
                <br />
                strength:
                <asp:TextBox ID="strengthTextBox" runat="server" 
                    Text='<%# Bind("strength") %>' />
                <br />
                weakness:
                <asp:TextBox ID="weaknessTextBox" runat="server" 
                    Text='<%# Bind("weakness") %>' />
                <br />
                summary:
                <asp:TextBox ID="summaryTextBox" runat="server" Text='<%# Bind("summary") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
            <table cellpadding="5px" border="0">
                <tr><td>Title of the Journal : </td>
                <td><asp:Label ID="papertitleLabel" runat="server" Text='<%# Bind("papertitle") %>' /></td>
                </tr>
                <tr><td>Reviewer's Name : </td>
                <td><asp:Label ID="rtitleLabel" runat="server" Text='<%# Bind("rtitle") %>' />
                <asp:Label ID="rfirstnameLabel" runat="server" Text='<%# Bind("rfirstname") %>' />
                <asp:Label ID="rsurnameLabel" runat="server" Text='<%# Bind("rsurname") %>' />
                </td>
                </tr>
                </table>
          <table cellpadding="5px" border="0">
                <tr><td colspan="2" align="center">
                <asp:Label ID="Label4" runat="server" Text="Content" Font-Underline="True" ForeColor="#FF6600"></asp:Label></td></tr>
                <tr><td colspan="2"><b>This Journal : </b></td></tr>
                <tr><td>Has a clearly stated <b>thesis</b>, <b>theme</b>, or controlling <b>idea</b></td>
                <td><asp:Label ID="content_ideaLabel" runat="server" 
                    Text='<%# Bind("content_idea") %>' /></td>
                </tr>
                <tr>
                <td>Has a clear <b>organization</b> and <b>structure</b></td>
                <td><asp:Label ID="content_structLabel" runat="server" Text='<%# Bind("content_struct") %>' /></td></tr>
                <tr>
                <td><b>Develops</b> the theme with <b>details</b> and <b>supporting evidence</b></td>
                <td><asp:Label ID="Label1" runat="server" Text='<%# Bind("content_detail") %>' /></td></tr>
                <tr>
                <td>Has sufficient <b>content</b> for the assignment</td>
                <td><asp:Label ID="content_sufficientLabel" runat="server" Text='<%# Bind("content_sufficient") %>' /></td></tr>
                <tr><td colspan="2" align="center">
                <asp:Label ID="Label5" runat="server" Text="Presentation" Font-Underline="True" ForeColor="#FF6600"></asp:Label></td></tr>
                <tr><td colspan="2"><b>This Author : </b></td></tr>
                <tr>
                <td>Conveys a particular <b>voice</b> intended for a specific <b>audience</b></td>
                <td><asp:Label ID="pre_voiceLabel" runat="server" Text='<%# Bind("pre_voice") %>' /></td></tr>
                <tr>
                <td>Uses appropriate <b>word-choice</b> and <b>style</b></td>
                <td><asp:Label ID="pre_styleLabel" runat="server" Text='<%# Bind("pre_style") %>' /></td></tr>
                <tr>
                <td>Includes no <b>mechanical errors</b></td>
                <td><asp:Label ID="pre_errorLabel" runat="server" Text='<%# Bind("pre_error") %>' /></td></tr>
                <tr><td colspan="2" align="center">
                <asp:Label ID="Label6" runat="server" Text="Research" Font-Underline="True" ForeColor="#FF6600"></asp:Label></td></tr>
                <tr>
                <td>Sources are <b>varied</b></td>
                <td><asp:Label ID="res_varriedLabel" runat="server" Text='<%# Bind("res_varried") %>' /></td></tr>
                <tr>
                <td>Sources are <b>accurate</b> and <b>reliable</b></td>
                <td><asp:Label ID="res_accurateLabel" runat="server" Text='<%# Bind("res_accurate") %>' /></td></tr>
                <tr>
                <td>Source material is <b>correctly incorporated</b> into the paper</td>
                <td><asp:Label ID="res_incorpLabel" runat="server" Text='<%# Bind("res_incorp") %>' /></td></tr>
                <tr>
                <td><b>Bibliography page</b> is accurate and complete</td>
                <td><asp:Label ID="res_biblioLabel" runat="server" Text='<%# Bind("res_biblio") %>' /></td></tr>
                </table>
        <table cellpadding="5px" border="0">
                <tr valign="top"><td valign="top">Strength : </td>
                <td><asp:Label ID="strengthLabel" runat="server" Text='<%# Bind("strength") %>' /></td></tr>
                <tr valign="top"><td valign="top">Weakness : </td>
                <td><asp:Label ID="weaknessLabel" runat="server" Text='<%# Bind("weakness") %>' /></td></tr>
                <tr valign="top"><td>Summary* : </td>
                <td><asp:Label ID="summaryLabel" runat="server" Text='<%# Bind("summary") %>' /></td></tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT p.papertitle, r.rtitle, r.rfirstname, r.rsurname, f.content_idea, f.content_struct, f.content_detail, f.content_sufficient, f.pre_voice, f.pre_style, f.pre_error, f.res_varried, f.res_accurate, f.res_incorp, f.res_biblio, f.strength, f.weakness, f.summary FROM FEEDBACK_MASTER AS f INNER JOIN PAPER_REVIEWING_DETAIL AS pr ON f.feedbackid = pr.feedbackid INNER JOIN PAPER_MASTER AS p ON pr.paperid = p.paperid INNER JOIN REVIEWER_MASTER AS r ON pr.revid = r.revid WHERE (pr.paperid = @paperid) AND (NOT (pr.papreviewstatus = 'evaluated'))">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" Name="paperid" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
<table cellpadding="5px" border="0" style="font-family:Tahoma;">
<tr valign="top"><td>Administrator Remark : </td>
</tr><tr><td>
    <asp:TextBox ID="TextBox1" runat="server" Height="100px" TextMode="MultiLine" 
        Width="500px"></asp:TextBox><br />
    <asp:Label ID="Label3" runat="server" Text="cannot be empty" ForeColor="Red" 
        Font-Size="Small" Visible="False"></asp:Label></td>
</tr>
<tr><td><asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Accept the Journal</asp:LinkButton>
&nbsp;&nbsp;
<asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Send For Correction</asp:LinkButton>
        &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Reject the Journal</asp:LinkButton>
        &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Close Window</asp:LinkButton>
</td></tr>
</table>
</div>
</center></div></div>
</asp:Content>

