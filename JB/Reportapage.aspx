<%@ Page Title="" Language="C#" MasterPageFile="~/Job.Master" AutoEventWireup="true"
    CodeBehind="Reportapage.aspx.cs" Inherits="JB.reportapage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- 
    summary
    This code is liscenced by ahrcloud.com
    under free creative common liscence, but 
    attribution must be made to the author
    site at www.ahrcloud.com or info@ahrcloud.com
    
    -->
    <div class="divback">
        <asp:Label ID="Label1" runat="server" CssClass="simplefontwhite" Text="What do you think was wrong with this page"></asp:Label>
    </div>
    <div class="simpleboxdetail">
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="simplefontblack">
            <asp:ListItem Value="1" Selected="True">this page had voilent contents</asp:ListItem>
            <asp:ListItem Value="2">this page shows racism to any race</asp:ListItem>
            <asp:ListItem Value="3">this page has fake recruiter</asp:ListItem>
            <asp:ListItem Value="4">this is my company, someone else if pretending to be me...</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="Label2" runat="server" CssClass="simplefontblack" Text="if none of the above please fill in the text box below."></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="spamreasons" runat="server" CssClass="TextboxSt" autofocus="autofocus"></asp:TextBox><br />
        <br />
        <asp:Button ID="Button1" runat="server" CssClass="button" Text="Report" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" CssClass="button" Text="Cancel" OnClick="Button2_Click" />
    </div>
</asp:Content>
