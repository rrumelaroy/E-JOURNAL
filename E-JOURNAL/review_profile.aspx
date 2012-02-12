<%@ Page Title="" Language="C#" MasterPageFile="~/reviewer_master.master" AutoEventWireup="true" CodeFile="review_profile.aspx.cs" Inherits="review_profile" %>

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
<asp:Label ID="Label2" runat="server" Text="Reviewer's Profile" 
        ForeColor="#FF6600" Font-Names="Tahoma"></asp:Label><br /><br />
your personal detail which can also be altered using EDIT button
<div style="margin:10px 10px 10px 20px;">

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="468px" 
        AutoGenerateRows="False" CellPadding="5" CellSpacing="5" 
        DataSourceID="SqlDataSource1" Font-Names="Tahoma" GridLines="None" 
        AutoGenerateEditButton="True">
        <CommandRowStyle ForeColor="Blue" />
        <Fields>
            <asp:BoundField DataField="rtitle" HeaderText="Title* : " 
                SortExpression="rtitle" />
            <asp:BoundField DataField="rfirstname" HeaderText="First Name* : " 
                SortExpression="rfirstname" />
            <asp:BoundField DataField="rsurname" HeaderText="Surname : " 
                SortExpression="rsurname" />
            <asp:BoundField DataField="rsecurityqn" HeaderText="Security Question* : " 
                SortExpression="rsecurityqn" />
            <asp:BoundField DataField="rans" HeaderText="Answer : " SortExpression="rans" />
            <asp:BoundField DataField="remail" HeaderText="email Address* : " 
                SortExpression="remail" />
            <asp:BoundField DataField="raddress" HeaderText="Address : " 
                SortExpression="raddress" />
            <asp:BoundField DataField="rcity" HeaderText="City : " SortExpression="rcity" />
            <asp:BoundField DataField="rstate" HeaderText="State" 
                SortExpression="rstate" />
            <asp:BoundField DataField="rzipcode" HeaderText="Zipcode : " 
                SortExpression="rzipcode" />
            <asp:BoundField DataField="rcountry" HeaderText="Country* : " 
                SortExpression="rcountry" />
            <asp:BoundField DataField="rhighqual" HeaderText="Highest Qualification* : " 
                SortExpression="rhighqual" />
            <asp:BoundField DataField="rdesig" HeaderText="Current Designation* : " 
                SortExpression="rdesig" />
            <asp:BoundField DataField="rorganization" HeaderText="Current Organization / Employer* : " 
                SortExpression="rorganization" />
        </Fields>
    </asp:DetailsView></div></div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
    SelectCommand="SELECT [rtitle], [rfirstname], [rsurname], [rsecurityqn], [rans], [remail], [raddress], [rcity], [rstate], [rzipcode], [rcountry], [rhighqual], [rdesig], [rorganization] FROM [REVIEWER_MASTER] WHERE ([revid] = @revid)" 
    
        UpdateCommand="UPDATE REVIEWER_MASTER SET rtitle = @rtitle, rfirstname = @rfirstname, rsurname = @rsurname, rsecurityqn = @rsecurityqn, rans = @rans, remail = @remail, raddress = @raddress, rcity = @rcity, rstate = @rstate, rzipcode = @rzipcode, rcountry = @rcountry, rhighqual = @rhighqual, rdesig = @rdesig, rorganization = @rorganization WHERE revid = @revid">
        <SelectParameters>
            <asp:SessionParameter Name="revid" SessionField="pk" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="rtitle" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="rfirstname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="rsurname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="rsecurityqn" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="rans" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="remail" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="raddress" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="rcity" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="rstate" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="rzipcode" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="rcountry" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="rhighqual" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="rdesig" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" Name="rorganization" 
                PropertyName="SelectedValue" />
            <asp:SessionParameter Name="revid" SessionField="pk" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>

