<%@ Page Title="" Language="C#" MasterPageFile="~/Job.Master" AutoEventWireup="true"
    CodeBehind="ActivateAccount.aspx.cs" Inherits="JB.ActivateAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/csjobmaster.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--
        summary
        This code is liscenced by ahrcloud.com
        under free creative common liscence, but
        attribution must be made to the author
        site at www.ahrcloud.com or info@ahrcloud.com
        -->
    <div class="ux_box2">
        <div class="ux_activateactopbanner">
            <asp:Label ID="Label21" runat="server" CssClass="ux_ftwhite" Text="Account Status Updating..."></asp:Label>
        </div>
        <br />
        <div class="ux_leftdiv">
        </div>
        <div class="ux_pdleft4">
            <asp:Label ID="Label1" runat="server" Text="Your account has been activated and you will be redirected automatically, if not please click "
                CssClass="ux_ftgray"></asp:Label>
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="ux_fontred" NavigateUrl="~/Default.aspx"> here...</asp:HyperLink>
        </div>
        <br />
        <br />
    </div>
</asp:Content>