<%@ Page Title="" Language="C#" MasterPageFile="~/author_master.master" AutoEventWireup="true" CodeFile="author_home.aspx.cs" Inherits="author_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="div1" runat="server" style=" margin-top:100px; font-size:14px; padding:10px 10px 10px 10px; background-color:White; opacity:0.7; border:2px solid black; font-family:Tahoma;">
    <asp:Label ID="Label1" runat="server" Font-Size="14px" Font-Strikeout="False" ForeColor="#993366" Font-Bold="true" 
            Text="WELCOME"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
</div>
</asp:Content>

