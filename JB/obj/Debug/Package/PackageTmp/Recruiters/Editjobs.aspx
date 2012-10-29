<%@ Page Title="" Language="C#" MasterPageFile="~/Recruiters/Recruiters.Master" AutoEventWireup="true"
         CodeBehind="Editjobs.aspx.cs" Inherits="JB.Recruiters.Editjobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/csrecruiter.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="recbgstytle">
        <asp:Label ID="Label5" runat="server" CssClass="ftwhitebd" Text="Job Edits"></asp:Label>
    </div>
    <div class="setrightbg">
        <asp:Image ID="Image11" CssClass="img_lt_red" runat="server" ImageUrl="/images/sprite.gif" />
        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="ftgray" OnClick="LinkButton4_Click">Active</asp:LinkButton>
        <asp:Image ID="Image12" runat="server" CssClass="img_lt_green" ImageUrl="/images/sprite.gif" />
        <asp:LinkButton ID="LinkButton5" runat="server" CssClass="ftgray" OnClick="LinkButton5_Click">Archived</asp:LinkButton>
        <!-- hookup ajax-->
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="400px"
                              ShowHeader="False" BorderWidth="0px" AllowPaging="True" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging"
                              OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:TemplateField>                           
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%#                                        Bind("sTitle") %>' CssClass="StyleBlackbold"></asp:Label>
                                <br />
                                <asp:Label ID="Label3" runat="server" Text='<%#                                        Bind("dtEnteredDate", "{0:dd/M/yyyy}") %>'
                                           CssClass="StyleBlack"></asp:Label>
                                <span class="StyleBlack">/</span>
                                <asp:Label ID="Label4" runat="server" Text='<%#Bind("sSalaryText") %>' CssClass="StyleBlack"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label2" runat="server" CssClass="StyleGray" Text='<%#Bind("sShortDescription") %>'></asp:Label>
                                <asp:HyperLink ID="HyperLink7" runat="server" CssClass="Stylea8" NavigateUrl='<%#                "JobForm.aspx?Fg=1&JobID=" + Eval("idJobs") %>'>Edit...</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="PagerStyle" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:HiddenField ID="HiddenField1" runat="server" Visible="False" Value="1" />
    </div>
</asp:Content>