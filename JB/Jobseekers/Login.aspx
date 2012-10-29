<%@ Page Title="" Language="C#" MasterPageFile="~/Logins.Master" AutoEventWireup="true"
         CodeBehind="Login.aspx.cs" Inherits="JB.JobSeekers.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="loginleft">
        <img alt="login logo" src="/Brandimages/brand_login.png" />
        <br />
        <asp:Label ID="Label10" runat="server" CssClass="ftblack" Text="Username"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBoxStyle">millie@ahrcloud.com</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                                    CssClass="ftblack" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label11" runat="server" CssClass="ftblack" Text="Password"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" CssClass="TextBoxStyle">test</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                                    CssClass="ftblack" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="Stylea101" OnClick="LinkButton1_Click"
                        CausesValidation="False">Forgot Password</asp:LinkButton>
        <asp:Label ID="Label12" runat="server" Text="or" CssClass="ftblack"></asp:Label>
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="Stylea101" OnClick="LinkButton2_Click"
                        CausesValidation="False">Register Now!</asp:LinkButton>
        <br />
        <br />
        <div class="alignright">
            <asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" CssClass="button" />
            <asp:Button ID="Button3" runat="server" Text="Cancel" OnClick="Button3_Click" CssClass="button"
                        CausesValidation="False" />
            <br />
        </div>
    </div>
    <div id="loginright">
        <h1>
            Get More
        </h1>
        <p>
            Did you know that you can get a lot more from purchased / hosted version of AHRCLOUD's
            Job board platform
            <br />
            <br />
            with paid version you get:
        </p>
        <ul class="ulist">
            <li>Full customizations</li>
            <li>Advanced search controls</li>
            <li>WAP Site </li>
            <li>Mobile Apps </li>
            <li>Recruiter Listings </li>
            <li>Content Management System </li>
            <li>Payment Gateways (most popular merchants already integrated, like paypal etc)</li>
            <li>Multi-Channel Adverts to generate ROI</li>
            <li>Secure and tested System</li>
            <li>Clean, Optimzed, Elegant and Innovative User Interface</li>
            <li>Ability to post Questions</li>
            <li>Ability to create subsites </li>
        </ul>
        <p>
            and a lot more...<br />
            <br />
            <br />
            <a href="http://ahrcloud.com">www.ahrcloud.com</a>
        </p>
    </div>
    <div class="cleardata">
    </div>
    <br />
    <br />
</asp:Content>