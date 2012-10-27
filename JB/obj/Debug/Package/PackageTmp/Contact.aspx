<%@ Page Title="" Language="C#" MasterPageFile="~/Job.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="JB.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/cs2.css" rel="stylesheet" type="text/css" />
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
        <div class="simplefontwhite">
            Contact Information
        </div>
    </div>
    <div class="boxcorner">
        <div id="divftsleft100">
            <asp:Label ID="Label16" runat="server" CssClass="Stylea8" Text="So that we can answer your queries in a timely fashion please choose one of the following departments to contact:"></asp:Label>
            <br />
            <br />
            <div class="cleardata">
            </div>
            <div class="contactstylist">
                <asp:HyperLink ID="HyperLink3" runat="server" CssClass="fontredh1" NavigateUrl="mailto:abuse@ahrcloud.com">abuse@ahrcloud.com</asp:HyperLink>
            </div>
            <div class="contactstylist">
                <asp:HyperLink ID="HyperLink4" runat="server" CssClass="fontredh1" NavigateUrl="mailto:jobboard@ahrcloud.com">Jobboard@ahrcloud.com</asp:HyperLink>
            </div>
            <div class="contactstylist">
                <asp:HyperLink ID="HyperLink5" runat="server" CssClass="fontredh1" NavigateUrl="mailto:suggestions@ahrcloud.com">Suggestions@ahrcloud.com</asp:HyperLink>
            </div>
            <div class="contactstylist">
                <asp:HyperLink ID="HyperLink6" runat="server" CssClass="fontredh1" NavigateUrl="mailto:partners@ahrcloud.com">Partners@ahrcloud.com</asp:HyperLink>
            </div>
            <div class="contactstylist">
                <asp:HyperLink ID="HyperLink7" runat="server" CssClass="fontredh1" NavigateUrl="mailto:investorrelations@ahrcloud.com">Investorrelations@ahrcloud.com</asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>
