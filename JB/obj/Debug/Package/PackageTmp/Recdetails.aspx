<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recdetails.aspx.cs" Inherits="JB.Recdetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <link href="/styles/csjobmaster.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <!-- 
            summary
            This code is liscenced by ahrcloud.com
            under free creative common liscence, but 
            attribution must be made to the author
            site at www.ahrcloud.com or info@ahrcloud.com
    
            -->
        <form id="form1" runat="server">
            <!-- main div-->
            <div id="recheightfix">
                <div>
                    <asp:Label ID="Label2" runat="server" CssClass="Stylea2" Text="Recruiter Profile"></asp:Label>
                    <div class="recdtlspixln">
                    </div>
                    <asp:GridView ID="GridView1" runat="server" CssClass="StyleRa1" AutoGenerateColumns="False"
                                  GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <div>
                                        <asp:Image ID="Image2" runat="server" Height="75px" ImageUrl='<%#                                        Bind("article_data") %>' />
                                    </div>
                                    <div class="recdtljustbrk">
                                    </div>
                                    <div>
                                        <asp:Label ID="sdesc" runat="server" Text='<%#Bind("sCompleteDesc") %>'></asp:Label>
                                    </div>
                                    <div class="recdtljustbrk">
                                    </div>
                                    <div class="recdtljustbrk">
                                    </div>
                                    <div>
                                        <asp:Label ID="sweb" runat="server" Text='<%#Bind("sWebsite") %>'></asp:Label>
                                    </div>
                                    <div class="recdtljustbrk">
                                    </div>
                                    <div class="recdtljustbrk">
                                    </div>
                                    <div>
                                        <asp:Label ID="Emailaddr" runat="server" Text='<%#Bind("sEmailAddress") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </form>
    </body>
</html>