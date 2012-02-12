<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="admin_viewprogressgraph.aspx.cs" Inherits="admin_viewprogressgraph" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding:100px 10px 10px 10px; background-color:White; font-family:Tahoma;">
<div style="border:2px solid Silver; margin:5px 5px 5px 5px; padding:10px 10px 10px 10px;">
<asp:Label ID="Label2" runat="server" Text="Viewer's Progress Graph" 
        Font-Size="X-Large" ForeColor="#FF6600"></asp:Label><br /><br />
<center>
<asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" 
    Width="410px">
        <Series>
            <asp:Series Name="Series1" XValueMember="pactivedate" 
                YValueMembers="Column1" YValuesPerPoint="4">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT DISTINCT(DATEPART(year,[pactivedate])), COUNT(*) FROM [PAID_SUBSCRIBER_MASTER] GROUP BY pactivedate">
    </asp:SqlDataSource>
</center></div></div>
</asp:Content>

