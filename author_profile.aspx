<%@ Page Title="" Language="C#" MasterPageFile="~/author_master.master" AutoEventWireup="true" CodeFile="author_profile.aspx.cs" Inherits="author_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; padding:10px 10px 10px 10px; font-size:14px;">
    <div style="margin:10px 10px 10px 10px; text-align:center;">
<asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue">Profile</asp:HyperLink> &nbsp; |&nbsp; 
    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
        onclick="LinkButton1_Click">Change Password</asp:LinkButton>
</div>
<div style="margin:10px 10px 10px 10px; border-color:Silver; border-style:solid; border-width:medium; padding:10px 10px 10px 10px;">
<asp:Label ID="Label2" runat="server" Text="Author's Profile" 
        ForeColor="#FF6600" Font-Names="Tahoma"></asp:Label><br /><br />
your personal detail which can also be altered using EDIT button
<div style="margin:10px 10px 10px 20px;">
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateEditButton="True" 
        AutoGenerateRows="False" DataSourceID="SqlDataSource1" Height="50px" 
        Width="402px" BorderStyle="None" CellPadding="5" BorderColor="White" 
        GridLines="None">
        <CommandRowStyle ForeColor="Blue" VerticalAlign="Top" />
        <Fields>
            <asp:BoundField DataField="atitle" HeaderText="Title* : " 
                SortExpression="atitle" />
            <asp:BoundField DataField="afirstname" HeaderText="First Name* : " 
                SortExpression="afirstname" />
            <asp:BoundField DataField="asurname" HeaderText="Surname" 
                SortExpression="asurname" />
            <asp:BoundField DataField="aemail" HeaderText="email Address* : " 
                SortExpression="aemail" />
            <asp:BoundField DataField="aaddress" HeaderText="Address :" 
                SortExpression="aaddress" />
            <asp:BoundField DataField="acity" HeaderText="City :" SortExpression="acity" />
            <asp:BoundField DataField="astate" HeaderText="State : " 
                SortExpression="astate" />
            <asp:BoundField DataField="azipcode" HeaderText="Zipcode : " 
                SortExpression="azipcode" />
            <asp:BoundField DataField="acountry" HeaderText="Country* : " 
                SortExpression="acountry" />
            <asp:BoundField DataField="ahighqual" HeaderText="Highest Qualification* :" 
                SortExpression="ahighqual" />
            <asp:BoundField DataField="adesig" HeaderText="Current Designation* : " 
                SortExpression="adesig" />
            <asp:BoundField DataField="aorganization" HeaderText="Current Organization / Employer* : " 
                SortExpression="aorganization" />
        </Fields>
        <HeaderStyle ForeColor="Gray" />
        <RowStyle Font-Names="Tahoma" />

    </asp:DetailsView></div></div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [atitle], [afirstname], [asurname], [aemail], [aaddress], [acity], [astate], [azipcode], [acountry], [ahighqual], [adesig], [aorganization] FROM [AUTHOR_MASTER] WHERE ([authid] = @authid)" 
        UpdateCommand="UPDATE AUTHOR_MASTER SET atitle = @atitle, afirstname = @afirstname, asurname = @asurname, aaddress = @aaddress, aemail = @aemail, acity = @acity, astate = @astate, azipcode = @azipcode,acountry = @acountry, ahighqual = @ahighqual, adesig = @adesig, aorganization = @aorganization WHERE authid = @authid">
        <SelectParameters>
            <asp:SessionParameter Name="authid" SessionField="pk" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="atitle" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="afirstname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="asurname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="aaddress" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="aemail" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="acity" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="astate" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="azipcode" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="acountry" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="ahighqual" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="adesig" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="aorganization" 
                PropertyName="SelectedValue" />
            <asp:SessionParameter Name="authid" SessionField="pk" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>

