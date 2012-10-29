<%@ Page Title="" Language="C#" MasterPageFile="~/Job.Master" AutoEventWireup="true"
         CodeBehind="Webblog.aspx.cs" Inherits="JB.webblog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/cs2.css" rel="stylesheet" type="text/css" />
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
        <asp:Label ID="Label13" runat="server" CssClass="Stylea1" Text="Our Blog"></asp:Label>
    </div>
    <!-- main bar-->
    <div class="boxcorner">
   
        <div>
            <iframe id="I1" security="restricted" name="I1" class="blogframe" src="http://blog.ahrcloud.com"
                    ></iframe>
        </div></div>
    
</asp:Content>