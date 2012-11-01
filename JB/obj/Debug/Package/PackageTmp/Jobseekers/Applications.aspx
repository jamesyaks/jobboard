<%@ Page Title="" Language="C#" MasterPageFile="~/JOB.Master" AutoEventWireup="true"
    CodeBehind="Applications.aspx.cs" Inherits="JB.JobSeekers.Applications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- TOP NAV-->
    <div class="ux_divback">
        <asp:Label ID="Label13" runat="server" CssClass="ux_simplefontwhite" Text="Application in progress..."></asp:Label>
    </div>
    <!-- div for details page -->
    <div class="ux_simpleboxdetail">
        <br />
        <div id="applicationsbreak">
            <div>
                <img alt="one" class="ux_img_lt_one" src="/images/sprite.gif" />
                <asp:Label ID="Label11" runat="server" CssClass="ux_simplefontblack" Text="Register to receive jobs by email!"
                    Width="200px"></asp:Label>
                <asp:Button ID="Button2" runat="server" CssClass="ux_button" Text="Register   " OnClick="Button2_Click" />
            </div>
            <br />
            <div>
                <img alt="two" class="ux_img_lt_two" src="/images/sprite.gif" />
                <asp:Label ID="Label12" runat="server" CssClass="ux_simplefontblack" Text="Continue without registration"
                    Width="200px"></asp:Label>
                <asp:Button ID="Button3" runat="server" CssClass="ux_button" Text="Just Apply" OnClick="Button3_Click" />
            </div>
        </div>
    </div>
    <div class="ux_cleardata">
    </div>
    <!--end divs-->
</asp:Content>