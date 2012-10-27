<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeekers/Candidates.Master" AutoEventWireup="true"
    CodeBehind="Jobseekerhome.aspx.cs" Inherits="JB.JobSeekers.JobSeekerHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/csjobseeker.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="backgrdstyle">
        <asp:Label ID="Label2" runat="server" CssClass="ftwhitebd" Text="Tips to get jobs"></asp:Label>
    </div>
    <div class="setrightbg">
        <asp:LinkButton ID="LinkButton5" runat="server" OnClientClick="return loadpg('Cvprepration.htm');"
            CssClass="fthlinkblack">CV Advice</asp:LinkButton>
        <asp:LinkButton ID="LinkButton6" runat="server" OnClientClick="return loadpg('Interviewtips.htm');"
            CssClass="fthlinkblack">Interviewing tips</asp:LinkButton>
        <iframe id="ifra" security="restricted" name="ifra" width="100%" height="400px" frameborder="0"
            src="../Blank.aspx"></iframe>
    </div>
    <script type="text/javascript">
        function loadpg(pgsrc) {
            ifra.location = "/Jobseekers/Supportdoc/" + pgsrc;
            return false;
        }
        loadpg('Cvprepration.htm');
    </script>
</asp:Content>
