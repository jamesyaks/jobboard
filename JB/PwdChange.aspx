<%@ Page Title="" Language="C#" MasterPageFile="~/Job.Master" AutoEventWireup="true"
    CodeBehind="PwdChange.aspx.cs" Inherits="JB.PasswordResetForm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/cs2.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- 
    summary
    This code is liscenced by ahrcloud.com
    under free creative common liscence, but 
    attribution must be made to the author
    site at www.ahrcloud.com or info@ahrcloud.com
    
    -->
    <!--linkup divs here-->
    <div class="divback">
        <asp:Label ID="Label13" runat="server" Text="Password change in progress..." CssClass="Stylea1"></asp:Label>
    </div>
    <br />
    <div class="pwleft">
        <asp:Label ID="Label1" runat="server" Text="New password" CssClass="StyleRa1"></asp:Label>
    </div>
    <div class="pwleft">
        <asp:TextBox ID="TextBox1" runat="server" CssClass="TextboxSt" TextMode="Password"
            Width="200px" autofocus="autofocus"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
            CssClass="Stylea101" ErrorMessage="X"></asp:RequiredFieldValidator>
        <asp:PasswordStrength ID="TextBox12_PasswordStrength" runat="server" Enabled="True"
            TargetControlID="TextBox1" DisplayPosition="RightSide" StrengthIndicatorType="Text"
            PreferredPasswordLength="10" PrefixText="Strength:" TextCssClass="StyleRa1" MinimumNumericCharacters="0"
            MinimumSymbolCharacters="0" RequiresUpperAndLowerCaseCharacters="false" CalculationWeightings="15;20;15;50">
        </asp:PasswordStrength>
    </div>
    <div class="cleardata">
    </div>
    <div class="setheight">
    </div>
    <div class="pwleft">
        <asp:Label ID="Label2" runat="server" Text="Confirm password" CssClass="StyleRa1"></asp:Label>
    </div>
    <div class="pwleft">
        <asp:TextBox ID="TextBox2" runat="server" CssClass="TextboxSt" TextMode="Password"
            Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
            CssClass="Stylea101" ErrorMessage="X"></asp:RequiredFieldValidator>
    </div>
    <div class="cleardata">
    </div>
    <div class="setheight">
    </div>
    <asp:Button ID="Button1" runat="server" Text="Reset" CssClass="button" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="button" CausesValidation="False"
        OnClick="Button2_Click" />
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
</asp:Content>
