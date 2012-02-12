<%@ Page Title="" Language="C#" MasterPageFile="~/free_subs_master.master" AutoEventWireup="true" CodeFile="fsub_profile.aspx.cs" Inherits="fsub_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" language="javascript">
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-color:White; opacity:0.9; padding:10px 10px 10px 10px; font-size:14px;">    
    <div style="margin:10px 10px 10px 10px; text-align:center;">
<asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue">Profile Manager</asp:HyperLink> &nbsp; |&nbsp; 
<asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Blue" 
            NavigateUrl="~/setpassword.aspx">Change Password</asp:HyperLink>
</div>
<div style="margin:10px 10px 10px 10px; border-color:Silver; border-style:solid; border-width:medium; padding:10px 10px 10px 10px;">
<asp:Label ID="Label1" runat="server" Text="Free Subscriber's Profile" 
        ForeColor="#FF6600" Font-Names="Tahoma"></asp:Label><br /><br />
your personal detail which can also be altered using EDIT button
<div style="margin:10px 10px 10px 20px; border:1px solid Black;">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="381px" 
        AutoGenerateEditButton="True" AutoGenerateRows="False" 
        DataSourceID="SqlDataSource1" CellPadding="5" GridLines="None">
        <CommandRowStyle ForeColor="Blue" />
        <FieldHeaderStyle Font-Names="Tahoma" />
        <Fields>
            <asp:BoundField DataField="fsecurityqn" HeaderText="Security Question* : " 
                SortExpression="fsecurityqn" />
            <asp:BoundField DataField="fans" HeaderText="Answer* : " SortExpression="fans" />
            <asp:BoundField DataField="femail" HeaderText="email Address* : " 
                SortExpression="femail" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT [fsecurityqn], [fans], [femail] FROM [FREE_SUBSCRIBER_MASTER] WHERE ([fsubid] = @fsubid)" 
        UpdateCommand="UPDATE FREE_SUBSCRIBER_MASTER SET fsecurityqn = @fsecurityqn, fans = @fans, femail = @femail WHERE fsubid = @fsubid">
        <SelectParameters>
            <asp:SessionParameter Name="fsubid" SessionField="pk" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="fsecurityqn" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="fans" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="femail" 
                PropertyName="SelectedValue" />
            <asp:SessionParameter Name="fsubid" SessionField="pk" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
</div>
</div>
</asp:Content>

