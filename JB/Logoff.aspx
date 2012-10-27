<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logoff.aspx.cs" Inherits="JB.Logoff" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/styles/csjobmaster.css" rel="stylesheet" type="text/css" />
</head>
<body onload="setTimeout('delayer()', 2000)">
    <!-- 
    summary
    This code is liscenced by ahrcloud.com
    under free creative common liscence, but 
    attribution must be made to the author
    site at www.ahrcloud.com or info@ahrcloud.com
    
    -->
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/active.png" />
        <asp:Label ID="Label1" runat="server" Text="You Have Logged off Sucessfully! if not automatically redirected please click"
            CssClass="Stylea2"></asp:Label>
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="Stylea101" OnClick="LinkButton2_Click">here...</asp:LinkButton>
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="Stylea101" OnClick="LinkButton1_Click">Retry...</asp:LinkButton>
        <br />
    </div>
    </form>
</body>
</html>
