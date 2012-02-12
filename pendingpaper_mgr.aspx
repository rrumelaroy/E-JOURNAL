<%@ Page Title="" Language="C#" MasterPageFile="~/publishing_mgr.master" AutoEventWireup="true" CodeFile="pendingpaper_mgr.aspx.cs" Inherits="pendingpaper_mgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content3" Runat="Server">
    <center><div runat="server" id="div1" style="margin:5px 5px 5px 5px; padding:10px 10px 10px 10px;">
    <table cellpadding="5px" cellspacing="0px" border="1">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <thead>
    <tr style="background-color:#7e354d; font-family:Tahoma; font-weight:bold; color:White;">
    <th style="width:15px"></th>
    <th>Title of the Journal</th>
    <th>Author</th>
    <th>Subject Area</th>
    <th>Abstract</th>
    </tr>
    </thead>
    </HeaderTemplate>
    <ItemTemplate>
    <tr style="background-color:#C8B560; font-family:Tahoma; color:Black;">
    <td style="width:15px"><asp:CheckBox ID="paperstatus" ValidationGroup='<%# Eval("paperid") %>' runat="server" Checked="false" OnCheckedChanged="OnCheckChangedEvent" AutoPostBack="True" /></td>
    <td><asp:Label ID="title" runat="server" Text='<%# Eval("papertitle") %>'></asp:Label></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("atitle") %>'></asp:Label>&nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label>&nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Eval("asurname") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="abstract" runat="server" Text='<%# Eval("ABST") %>'></asp:Label></td>
    </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr style="background-color:#FFE87C; font-family:Tahoma; color:Black;">
    <td style="width:15px"><asp:CheckBox ID="paperstatus" ValidationGroup='<%# Eval("paperid") %>' runat="server" Checked="false" OnCheckedChanged="OnCheckChangedEvent" AutoPostBack="True" /></td>
    <td><asp:Label ID="title" runat="server" Text='<%# Eval("papertitle") %>'></asp:Label></td>
    <td><asp:Label ID="author" runat="server" Text='<%# Eval("atitle") %>'></asp:Label>&nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("afirstname") %>'></asp:Label>&nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Eval("asurname") %>'></asp:Label></td>
    <td><asp:Label ID="subject" runat="server" Text='<%# Eval("subjarea") %>'></asp:Label></td>
    <td><asp:Label ID="abstract" runat="server" Text='<%# Eval("ABST") %>'></asp:Label></td>
    </tr>
    </AlternatingItemTemplate>
    </asp:Repeater></table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT p.paperid, p.papertitle, a.atitle, a.afirstname, a.asurname, p.subjarea, SUBSTRING(p.abstract,1,15) ABST FROM AUTHOR_MASTER a, PAPER_MASTER p WHERE a.authid = p.authid AND p.paperstatus = 'pending'">
    </asp:SqlDataSource><br /><br />
        <asp:HiddenField ID="HiddenField1" runat="server" />
<div runat="server" id="div2" visible="false" 
            style="margin:5px 5px 5px 5px; padding:10px 10px 10px 10px; border:1px solid Black; font-family: Tahoma; font-size: medium;">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
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
            <table cellpadding="5" cellspacing="5">
        <tr>
        <td>Title of the Journal : </td>
        <td><asp:Label ID="papertitleLabel" runat="server" 
                Text='<%# Bind("papertitle") %>' /></td>
        </tr>
        <tr>
        <td>Subject Area : </td>
        <td><asp:Label ID="subjareaLabel" runat="server" Text='<%# Bind("subjarea") %>' /></td>
        </tr>
        <tr>
        <td>Author : </td>
        <td>
        <asp:Label ID="atitleLabel" runat="server" Text='<%# Bind("atitle") %>' />&nbsp;
        <asp:Label ID="afirstnameLabel" runat="server" Text='<%# Bind("afirstname") %>' />&nbsp;
        <asp:Label ID="asurnameLabel" runat="server" Text='<%# Bind("asurname") %>' />
        </td>
        </tr>
        </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT p.papertitle, p.subjarea, a.atitle, a.afirstname, a.asurname FROM PAPER_MASTER p, AUTHOR_MASTER a WHERE p.authid = a.authid AND p.paperid = @paperid">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="paperid" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource><br />
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
    </table>
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Publish Journal</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Close Window</asp:LinkButton>
    <br />
    <asp:Label ID="Label3" runat="server" Font-Size="Small"></asp:Label>
</div>
</div></center>
</asp:Content>

