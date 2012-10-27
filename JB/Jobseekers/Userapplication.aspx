<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeekers/Candidates.Master" AutoEventWireup="true"
    CodeBehind="Userapplication.aspx.cs" Inherits="JB.JobSeekers.UserRegistration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/csjobseeker.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="backgrdstyle">
        <asp:Label ID="Label27" runat="server" Text="Application form" CssClass="ftwhitebd"></asp:Label>
    </div>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div class="setrightbg">
        <asp:Label ID="Label10" runat="server" CssClass="ftgraybd" Text="First Name"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
            CssClass="ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label11" runat="server" CssClass="ftgraybd" Text="Last Name"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
            CssClass="ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label12" runat="server" CssClass="ftgraybd" Text="Address1"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4"
            CssClass="ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label13" runat="server" CssClass="ftgraybd" Text="Address2"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox5" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <br />
        <asp:Label ID="Label14" runat="server" CssClass="ftgraybd" Text="Address3"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox6" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <br />
        <asp:Label ID="Label15" runat="server" CssClass="ftgraybd" Text="Town"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox7" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <br />
        <asp:Label ID="Label16" runat="server" CssClass="ftgraybd" Text="County"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox8" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <br />
        <asp:Label ID="Label24" runat="server" CssClass="ftgraybd" Text="Country"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox16" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox16"
            CssClass="ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label17" runat="server" CssClass="ftgraybd" Text="PostCode"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox9" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox9"
            CssClass="ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label25" runat="server" CssClass="ftgraybd" Text="Date of Birth"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox17" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <asp:CalendarExtender ID="TextBox17_CalendarExtender" runat="server" Enabled="True"
            TargetControlID="TextBox17" PopupButtonID="Image8" Format="dd/M/yyyy">
        </asp:CalendarExtender>
        <asp:Image ID="Image8" runat="server" ImageUrl="~/images/Calender.png" onmouseover="document.body.style.cursor='pointer'"
            onmouseout="document.body.style.cursor='default'" ImageAlign="AbsMiddle" />
        <br />
        <br />
        <asp:Label ID="Label20" runat="server" CssClass="ftgraybd" Text="Email"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox11" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <asp:Label ID="Label21" runat="server" CssClass="ftgray" Text="**This will be your user name"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox11"
            CssClass="ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <asp:Label ID="Label26" runat="server" CssClass="ftgraybd" ForeColor="Red" Text="User already exists!"
            Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label22" runat="server" CssClass="ftgraybd" Text="Home Phone"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox14" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <br />
        <asp:Label ID="Label23" runat="server" CssClass="ftgraybd" Text="Work Phone"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox15" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label18" runat="server" CssClass="ftgraybd" Text="Password"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox12" runat="server" CssClass="TextboxSt" TextMode="Password"></asp:TextBox>
        <asp:PasswordStrength ID="TextBox12_PasswordStrength" runat="server" Enabled="True"
            TargetControlID="TextBox12" DisplayPosition="RightSide" StrengthIndicatorType="Text"
            PreferredPasswordLength="10" PrefixText="Strength:" TextCssClass="Stylepwd" MinimumNumericCharacters="0"
            MinimumSymbolCharacters="0" RequiresUpperAndLowerCaseCharacters="false" CalculationWeightings="15;20;15;50">
        </asp:PasswordStrength>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox12"
            CssClass="ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label28" runat="server" CssClass="ftgraybd" Text="Confirm Password"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox18" runat="server" CssClass="TextboxSt" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox18"
            CssClass="Stylepwd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox18"
            ControlToValidate="TextBox12" CssClass="Stylepwd" ErrorMessage="Passwords donot match!"></asp:CompareValidator>
        <br />
        <asp:Label ID="Label19" runat="server" CssClass="ftgraybd" Text="Password Hint"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox13" runat="server" CssClass="TextboxSt"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox13"
            CssClass="ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="Label30" runat="server" CssClass="ftgraybd" Text="Confirm you are human"></asp:Label>
            <br />
            <asp:TextBox ID="capts" runat="server" CssClass="TextboxSt"></asp:TextBox>
            <img alt="" src="
                                <%
          
                                  
                                    JB.CLCaptchacls clmppg = new JB.CLCaptchacls();

                                    // get 1st random string 
                                    string Rand1 = clmppg.RandomcapString(3);

                                    // get 2nd random string 
                                    string Rand2 = clmppg.RandomcapString(5);

                                    
                                    // create full rand string
                                    string Texter = "../" + "captcha.aspx?ranstr="+ Rand1 + "  " + Rand2;

                                    Response.Write(Texter.Trim());
                                    
                                 %>
                            .png" />
        </asp:Panel>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Save" CssClass="button" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="Cancel" CssClass="button" OnClick="Button3_Click"
            CausesValidation="False" />
    </div>
</asp:Content>
