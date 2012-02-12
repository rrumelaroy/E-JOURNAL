<%@ Page Title="" Language="C#" MasterPageFile="~/publishing_mgr.master" AutoEventWireup="true" CodeFile="publishpaper_mgr.aspx.cs" Inherits="publishpaper_mgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content3" Runat="Server">
    <center>
<div id="div1" runat="server" style="font-family:Tahoma; font-size:medium;">
<table cellpadding="5px" cellspacing="0px" border="1">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#7e354d; font-family:Tahoma; font-weight:bold; color:White;">
    <th style="width:15px"></th>
    <th>Title of the Journal</th>
    <th>Author</th>
    <th>Subject Area</th>
    <th>Publishing Month</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:#C8B560; font-family:Tahoma; color:Black;">
    <td style="width:15px"><asp:CheckBox ID="paperstatus" ValidationGroup='<%# Eval("paperid") %>' runat="server" Checked="false" OnCheckedChanged="OnCheckChangedEvent1" AutoPostBack="True" /></td>
    <td><asp:Label ID="title" runat="server" Text='<%# Eval("papertitle") %>'></asp:Label></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("atitle") %>'></asp:Label>&nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label>&nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Eval("asurname") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="month" runat="server" Text='<%# Eval("MON") %>'></asp:Label>&nbsp;<asp:Label ID="year" runat="server" Text='<%# Eval("YEAR") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#FFE87C; font-family:Tahoma; color:Black;">
    <td style="width:15px"><asp:CheckBox ID="paperstatus" ValidationGroup='<%# Eval("paperid") %>' runat="server" Checked="false" OnCheckedChanged="OnCheckChangedEvent1" AutoPostBack="True" /></td>
    <td><asp:Label ID="title" runat="server" Text='<%# Eval("papertitle") %>'></asp:Label></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("atitle") %>'></asp:Label>&nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label>&nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Eval("asurname") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="month" runat="server" Text='<%# Eval("MON") %>'></asp:Label>&nbsp;<asp:Label ID="year" runat="server" Text='<%# Eval("YEAR") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT p.paperid, p.papertitle, a.atitle, a.afirstname, a.asurname, p.subjarea, DATENAME(month, pp.publish_date) AS MON, DATEPART(year, pp.publish_date) AS YEAR FROM AUTHOR_MASTER AS a INNER JOIN PAPER_MASTER AS p ON a.authid = p.authid INNER JOIN PAPER_PUBLISH_DETAIL AS pp ON p.paperid = pp.paperid AND p.paperstatus = 'published' ORDER BY pp.publish_date">
    </asp:SqlDataSource><br /><br />
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <div runat="server" id="div2" visible="false" style="margin:5px 5px 5px 5px; padding:10px 10px 10px 10px; border:1px solid Black;">
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
            <EditItemTemplate>
                paperid:
                <asp:TextBox ID="paperidTextBox" runat="server" Text='<%# Bind("paperid") %>' />
                <br />
                papertitle:
                <asp:TextBox ID="papertitleTextBox" runat="server" 
                    Text='<%# Bind("papertitle") %>' />
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
                subjarea:
                <asp:TextBox ID="subjareaTextBox" runat="server" 
                    Text='<%# Bind("subjarea") %>' />
                <br />
                abstract:
                <asp:TextBox ID="abstractTextBox" runat="server" 
                    Text='<%# Bind("abstract") %>' />
                <br />
                MON:
                <asp:TextBox ID="MONTextBox" runat="server" Text='<%# Bind("MON") %>' />
                <br />
                YEAR:
                <asp:TextBox ID="YEARTextBox" runat="server" Text='<%# Bind("YEAR") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                paperid:
                <asp:TextBox ID="paperidTextBox" runat="server" Text='<%# Bind("paperid") %>' />
                <br />
                papertitle:
                <asp:TextBox ID="papertitleTextBox" runat="server" 
                    Text='<%# Bind("papertitle") %>' />
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
                subjarea:
                <asp:TextBox ID="subjareaTextBox" runat="server" 
                    Text='<%# Bind("subjarea") %>' />
                <br />
                abstract:
                <asp:TextBox ID="abstractTextBox" runat="server" 
                    Text='<%# Bind("abstract") %>' />
                <br />
                MON:
                <asp:TextBox ID="MONTextBox" runat="server" Text='<%# Bind("MON") %>' />
                <br />
                YEAR:
                <asp:TextBox ID="YEARTextBox" runat="server" Text='<%# Bind("YEAR") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
            <table cellpadding="5" cellspacing="5">
            <tr>
            <td>Title of the Journal : </td>
            <td><asp:Label ID="papertitleLabel" runat="server" 
                    Text='<%# Bind("papertitle") %>' /></td>
            </tr>
            <tr>
            <td>Author : </td>
            <td><asp:Label ID="atitleLabel" runat="server" Text='<%# Bind("atitle") %>' />&nbsp;
            <asp:Label ID="afirstnameLabel" runat="server" 
                    Text='<%# Bind("afirstname") %>' />&nbsp;
            <asp:Label ID="asurnameLabel" runat="server" Text='<%# Bind("asurname") %>' />
            </td>
            </tr>
            <tr>
            <td>Subject Area : </td>
            <td><asp:Label ID="subjareaLabel" runat="server" Text='<%# Bind("subjarea") %>' /></td>
            </tr>
            <td>Publishing Month : </td>
            <td><asp:Label ID="MONLabel" runat="server" Text='<%# Bind("MON") %>' />&nbsp;
            <asp:Label ID="YEARLabel" runat="server" Text='<%# Bind("YEAR") %>' />
            </td>
            </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT p.paperid, p.papertitle, a.atitle, a.afirstname, a.asurname, p.subjarea, p.abstract, DATENAME(month, pp.publish_date) AS MON, DATEPART(year, pp.publish_date) AS YEAR FROM AUTHOR_MASTER AS a INNER JOIN PAPER_MASTER AS p ON a.authid = p.authid INNER JOIN PAPER_PUBLISH_DETAIL AS pp ON p.paperid = pp.paperid AND p.paperstatus = 'published' ORDER BY pp.publish_date">
        </asp:SqlDataSource>
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Move To Another Month</asp:LinkButton>
    &nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Remove From The Calendar</asp:LinkButton>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Close Window</asp:LinkButton>
        <br />
    <br /><br />
    <div runat="server" id="div3" visible="false">
    <table cellpadding="5" cellspacing="10">
    <tr>
    <td>Month : </td>
    <td>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="1">January</asp:ListItem>
            <asp:ListItem Value="2">February</asp:ListItem>
            <asp:ListItem Value="3">March</asp:ListItem>
            <asp:ListItem Value="4">April</asp:ListItem>
            <asp:ListItem Value="5">May</asp:ListItem>
            <asp:ListItem Value="6">June</asp:ListItem>
            <asp:ListItem Value="7">July</asp:ListItem>
            <asp:ListItem Value="8">August</asp:ListItem>
            <asp:ListItem Value="9">September</asp:ListItem>
            <asp:ListItem Value="10">October</asp:ListItem>
            <asp:ListItem Value="11">November</asp:ListItem>
            <asp:ListItem Value="12">December</asp:ListItem>
        </asp:DropDownList>
    </td>
    <td>Year : </td>
    <td>
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>2011</asp:ListItem>
            <asp:ListItem>2012</asp:ListItem>
            <asp:ListItem>2013</asp:ListItem>
            <asp:ListItem>2014</asp:ListItem>
            <asp:ListItem>2015</asp:ListItem>
            <asp:ListItem>2016</asp:ListItem>
            <asp:ListItem>2017</asp:ListItem>
            <asp:ListItem>2018</asp:ListItem>
            <asp:ListItem>2019</asp:ListItem>
            <asp:ListItem>2020</asp:ListItem>
            <asp:ListItem>2021</asp:ListItem>
            <asp:ListItem>2022</asp:ListItem>
            <asp:ListItem>2023</asp:ListItem>
            <asp:ListItem>2024</asp:ListItem>
            <asp:ListItem>2025</asp:ListItem>
            <asp:ListItem>2026</asp:ListItem>
            <asp:ListItem>2027</asp:ListItem>
            <asp:ListItem>2028</asp:ListItem>
            <asp:ListItem>2029</asp:ListItem>
            <asp:ListItem>2030</asp:ListItem>
        </asp:DropDownList>
    </td>
    </tr>
    </table><br />
        <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Publish Journal</asp:LinkButton>
        &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton5" runat="server" onclick="LinkButton5_Click">Close Window</asp:LinkButton>    
        <br />
    <asp:Label ID="Label3" runat="server" Font-Size="Small"></asp:Label>
        <br />
    </div>

    </div>
</div></center>
</asp:Content>

