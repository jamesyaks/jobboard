<%@ Page Title="" Language="C#" MasterPageFile="~/Recruiters/Recruiters.Master" AutoEventWireup="true"
         CodeBehind="Changerecpwd.aspx.cs" Inherits="JB.Recruiters.Changerecpwd" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="recbgstytle">
        <asp:Label ID="Label5" runat="server" CssClass="ftwhitebd" Text="Password Change in progress"></asp:Label>
    </div>
    <div class="setrightbg">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" CssClass="ftblack" Text="Old password"></asp:Label>
                <br />
                <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBoxStyle" Width="150px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                            CssClass="ftblack" ErrorMessage="X"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" CssClass="ftblack" Text="New password"></asp:Label>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBoxStyle" Width="150px" TextMode="Password"></asp:TextBox>
                <asp:PasswordStrength ID="TextBox2_PasswordStrength" runat="server" Enabled="True"
                                      TargetControlID="TextBox2" DisplayPosition="RightSide" StrengthIndicatorType="Text"
                                      PreferredPasswordLength="10" PrefixText="Strength:" TextCssClass="Stylepwd" MinimumNumericCharacters="0"
                                      MinimumSymbolCharacters="0" RequiresUpperAndLowerCaseCharacters="false" CalculationWeightings="15;20;15;50">
                </asp:PasswordStrength>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                            CssClass="ftblack" ErrorMessage="X"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" CssClass="ftblack" Text="New password again"></asp:Label>
                <br />
                <asp:TextBox ID="TextBox3" runat="server" CssClass="TextBoxStyle" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                                            CssClass="ftblack" ErrorMessage="X"></asp:RequiredFieldValidator>
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
                <asp:Label ID="Label4" runat="server" CssClass="ftblack"></asp:Label>
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>