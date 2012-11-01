<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeekers/Candidates.Master" AutoEventWireup="true"
    CodeBehind="Jobseekerhome.aspx.cs" Inherits="JB.JobSeekers.JobSeekerHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/csjobseeker.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ux_cn_header">
        <asp:Label ID="Label2" runat="server" CssClass="ux_ftwhitebd" Text="Tips to get jobs"></asp:Label>
    </div>
    <div class="ux_setrightbg">
        <asp:LinkButton ID="LinkButton5" runat="server" OnClientClick=" return loadpg('Cvprepration.htm'); "
            CssClass="ux_fthlinkblack">CV Advice</asp:LinkButton>
        <asp:LinkButton ID="LinkButton6" runat="server" OnClientClick=" return loadpg('Interviewtips.htm'); "
            CssClass="ux_fthlinkblack">Interviewing tips</asp:LinkButton>
        <iframe id="ifra" security="restricted" name="ifra" class="ux_jseekerframe" src="../Blank.aspx">
        </iframe>
    </div>
    <script type="text/javascript">
        function loadpg(pgsrc) {
            window.ifra.location = "/Jobseekers/Supportdoc/" + pgsrc;
            return false;
        }

        loadpg('Cvprepration.htm');
    </script>
</asp:Content>