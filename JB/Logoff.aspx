<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logoff.aspx.cs" Inherits="JB.Logoff" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>logging out...</title>
    <link href="/styles/csjobmaster.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript1.1">
    function movepage()
    {
        window.location = "/default.aspx"
    }
    </script>
</head>
<body onload="setTimeout('movepage()', 5000)">
    <!-- 
    summary
    This code is liscenced by ahrcloud.com
    under free creative common liscence, but 
    attribution must be made to the author
    site at www.ahrcloud.com or info@ahrcloud.com
    
    -->
    <form id="form1" runat="server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/active.png" />
    <asp:Label ID="Label1" runat="server" Text="Please click " CssClass="Stylea2"></asp:Label>
    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="Stylea101" OnClick="LinkButton2_Click">here</asp:LinkButton>
    <asp:Label ID="Label2" runat="server" Text=" if not redirected automatically" CssClass="Stylea2"></asp:Label>
    </form>
</body>
</html>
