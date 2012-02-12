<%@ Page Title="" Language="C#" MasterPageFile="~/paid_subs_master.master" AutoEventWireup="true" CodeFile="psub_profile.aspx.cs" Inherits="psub_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; padding:10px 10px 10px 10px; font-size:14px;">
<div style="margin:10px 10px 10px 10px; text-align:center;">
<asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue">Profile Manager</asp:HyperLink> &nbsp; |&nbsp; 
<asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Blue" 
            NavigateUrl="~/paidsub_setpass.aspx">Change Password</asp:HyperLink>
&nbsp; |&nbsp;
    <asp:HyperLink ID="HyperLink3" runat="server" ForeColor="Blue" 
        NavigateUrl="~/psub_renewsub.aspx">Renew Subscription</asp:HyperLink>
</div>
<div style="margin:10px 10px 10px 10px; border-color:Silver; border-style:solid; border-width:medium; padding:10px 10px 10px 10px;">
<asp:Label ID="Label2" runat="server" Text="Paid Subscriber's Profile" 
        ForeColor="#FF6600" Font-Names="Tahoma"></asp:Label><br /><br />
your personal detail which can also be altered using EDIT button
<div style="margin:10px 10px 10px 20px;">
    
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateEditButton="True" 
        AutoGenerateRows="False" CellPadding="5" DataSourceID="SqlDataSource1" 
        Font-Names="Tahoma" GridLines="None" Height="50px" Width="352px">
        <CommandRowStyle ForeColor="Blue" />
        <Fields>
            <asp:BoundField DataField="ptitle" HeaderText="Title* : " 
                SortExpression="ptitle" />
            <asp:BoundField DataField="pfirstname" HeaderText="First Name* : " 
                SortExpression="pfirstname" />
            <asp:BoundField DataField="psurname" HeaderText="Surname : " 
                SortExpression="psurname" />
            <asp:BoundField DataField="psecurityqn" HeaderText="Security Question* : " 
                SortExpression="psecurityqn" />
            <asp:BoundField DataField="pans" HeaderText="Answer : " SortExpression="pans" />
            <asp:BoundField DataField="pemail" HeaderText="email Address* : " 
                SortExpression="pemail" />
            <asp:BoundField DataField="paddress" HeaderText="Address : " 
                SortExpression="paddress" />
            <asp:BoundField DataField="pcity" HeaderText="City : " SortExpression="pcity" />
            <asp:BoundField DataField="pstate" HeaderText="State : " 
                SortExpression="pstate" />
            <asp:BoundField DataField="pzipcode" HeaderText="Zipcode : " 
                SortExpression="pzipcode" />
            <asp:BoundField DataField="pcountry" HeaderText="Country* : " 
                SortExpression="pcountry" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [ptitle], [pfirstname], [psurname], [psecurityqn], [pans], [pemail], [paddress], [pcity], [pstate], [pzipcode], [pcountry] FROM [PAID_SUBSCRIBER_MASTER] WHERE ([psubid] = @psubid)" 
        UpdateCommand="UPDATE PAID_SUBSCRIBER_MASTER SET ptitle = @ptitle, pfirstname = @pfirstname, psurname = @psurname, psecurityqn = @psecurityqn, pans = @pans, pemail = @pemail, paddress = @paddress, pcity = @pcity, pstate = @pstate, pzipcode = @pzipcode, pcountry = @pcountry WHERE psubid = @psubid">
        <SelectParameters>
            <asp:SessionParameter Name="psubid" SessionField="pk" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="ptitle" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="pfirstname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="psurname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="psecurityqn" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="pans" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="pemail" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="paddress" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="pcity" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="pstate" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="pzipcode" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="pcountry" 
                PropertyName="SelectedValue" />
            <asp:SessionParameter Name="psubid" SessionField="pk" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
</div>
</div>
</div>
</asp:Content>

