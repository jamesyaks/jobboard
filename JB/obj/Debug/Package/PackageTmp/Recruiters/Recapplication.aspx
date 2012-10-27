<%@ Page Title="" Language="C#" MasterPageFile="~/Recruiters/Recruiters.Master" AutoEventWireup="true"
    CodeBehind="Recapplication.aspx.cs" Inherits="JB.Recruiters.RecApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/csrecruiter.css" rel="stylesheet" type="text/css" />
    <!--load popup here-->
    <link href="/Scripts/facebox/facebox.css" media="screen" rel="stylesheet" type="text/css" />
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/facebox/facebox.js" type="text/javascript"></script>
    <script type="text/javascript">
        function pageLoad(sender, args) {
            $(document).ready(function ($) {
                $('a[rel*=facebox]').facebox({
                    loadingImage: '/images/loading.gif',
                    closeImage: '/images/closelabel.png'
                });
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="recbgstytle">
        <asp:Label ID="Label1" runat="server" CssClass="ftwhitebd" Text="Applications Made"></asp:Label>
    </div>
    <div class="setrightbg">
        <!-- hook up ajax-->
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    OnPageIndexChanging="GridView1_PageIndexChanging" GridLines="Horizontal" 
                    BorderStyle="None" onrowdatabound="GridView1_RowDataBound">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text="Complete Name: " CssClass="ftblackbd"></asp:Label>
                                <asp:Label ID="Label2" runat="server" CssClass="ftblack" Text='<%# Bind("afirstname") %>'></asp:Label>
                                <asp:Label ID="Label3" runat="server" CssClass="ftblack" Text='<%# Bind("alastname") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label8" runat="server" Text="Job Title: " CssClass="ftblackbd"></asp:Label>
                                <asp:Label ID="Label4" runat="server" CssClass="ftblack" Text='<%# Bind("stitle") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label9" runat="server" Text="Date Applied: " CssClass="ftblackbd"></asp:Label>
                                <asp:Label ID="Label5" runat="server" CssClass="ftblack" Text='<%# Bind("dtentered","{0:dd/M/yyyy}") %>'></asp:Label>
                                <br />
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="fthlinkblack" NavigateUrl='<%# Eval("idapplications", "Recapplicationdetail.aspx?applyid={0}") %>'
                                    Text="view profile..." rel="facebox"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="PagerStyle" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
