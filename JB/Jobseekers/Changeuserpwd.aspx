<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeekers/Candidates.Master" AutoEventWireup="true"
    CodeBehind="Changeuserpwd.aspx.cs" Inherits="JB.JobSeekers.Changeuserpwd" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/csjobseeker.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="backgrdstyle">
        <asp:Label ID="Label5" runat="server" CssClass="ftwhitebd" Text="Password change in progress..."></asp:Label>
    </div>
    <div class="setrightbg">
        <asp:Label ID="Label1" runat="server" CssClass="ftgraybd" Text="Old password"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBoxStyle" Width="150px" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
            CssClass="ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" CssClass="ftgraybd" Text="New password"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBoxStyle" Width="150px" TextMode="Password"></asp:TextBox>
        <asp:PasswordStrength ID="TextBox2_PasswordStrength" runat="server" Enabled="True"
            TargetControlID="TextBox2" DisplayPosition="RightSide" StrengthIndicatorType="Text"
            PreferredPasswordLength="10" PrefixText="Strength:" TextCssClass="Stylepwd" MinimumNumericCharacters="0"
            MinimumSymbolCharacters="0" RequiresUpperAndLowerCaseCharacters="false" CalculationWeightings="15;20;15;50">
        </asp:PasswordStrength>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
            CssClass="ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" CssClass="ftgraybd" Text="Confirm password"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" CssClass="TextBoxStyle" Width="150px" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
            CssClass="ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox3"
            ControlToValidate="TextBox2" CssClass="Stylepwd" ErrorMessage="Passwords donot match!"></asp:CompareValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" CssClass="button" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Cancel" CssClass="button"
            CausesValidation="False" />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" CssClass="ftgraybd"></asp:Label>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    </div>
</asp:Content>
