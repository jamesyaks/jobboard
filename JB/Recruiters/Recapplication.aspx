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
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CssClass="ftblack"
                    OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging"
                    GridLines="Horizontal" BorderStyle="None" CellSpacing="1" Width="400px">
                    <Columns>
                        <asp:BoundField DataField="aFirstName" HeaderText="FirstName" />
                        <asp:BoundField DataField="aLastName" HeaderText="LastName" />
                        <asp:BoundField DataField="sTitle" HeaderText="Title" />
                        <asp:BoundField DataField="dtentered" DataFormatString="{0:dd/M/yyyy}" HeaderText="Date Applied" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("idapplications", "Recapplicationdetail.aspx?applyid={0}") %>'
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
