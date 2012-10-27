<%@ Page Title="" Language="C#" MasterPageFile="~/JOB.Master" AutoEventWireup="true"
    CodeBehind="Allrecruiters.aspx.cs" Inherits="JB.Allrecruiters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/cs3.css" rel="stylesheet" type="text/css" />
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
    <!-- 
    summary
    This code is liscenced by ahrcloud.com
    under free creative common liscence, but 
    attribution must be made to the author
    site at www.ahrcloud.com or info@ahrcloud.com
    
    -->
    <script type="text/javascript">
        function detailup(obd) {
            ifr.src = "Recdetails.aspx?Empid=" + obd;
            return false;
        }    
    </script>
    <!-- top bar -->
    <div class="divback">
        <div class="simplefontwhite">
            All Recruiters Advertizing Jobs</div>
    </div>
    <div class="boxcorner">
        <!--hook up ajax-->
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    OnPageIndexChanging="GridView1_PageIndexChanging" GridLines="None" DataKeyNames="Empid"
                    Width="400px" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div>
                                    <br />
                                    <asp:Label ID="Label1" runat="server" CssClass="Stylea2" Text='<%# Bind("srecruitername") %>'></asp:Label>
                                    <asp:Label ID="Label12" runat="server" CssClass="Stylea2" Text="is now advertizing "></asp:Label>
                                    <asp:Label ID="Label2" runat="server" CssClass="Stylea2" Text='<%# Bind("totaljobs") %>'></asp:Label>
                                    <asp:Label ID="Label13" runat="server" CssClass="Stylea2" Text="jobs"></asp:Label>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Empid", "Recdetails.aspx?Empid={0}") %>'
                                        rel="facebox" Text="more..." CssClass="Stylea8"></asp:HyperLink>
                                    <br />
                                    <br />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="PagerStyle" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <!-- end panel -->
    </div>
</asp:Content>
