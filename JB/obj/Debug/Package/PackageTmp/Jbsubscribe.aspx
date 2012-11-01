<%@ Page Title="" Language="C#" MasterPageFile="~/Job.Master" AutoEventWireup="true"
    CodeBehind="Jbsubscribe.aspx.cs" Inherits="JB.jbsubscribe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/cs1.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--
        summary
        This code is liscenced by ahrcloud.com
        under free creative common liscence, but
        attribution must be made to the author
        site at www.ahrcloud.com or info@ahrcloud.com

        -->
    <div class="ux_divback">
        <div class="ux_simplefontwhite">
            Subscription in progress...
        </div>
    </div>
    <div class="ux_boxcorner">
        <br />
        <div class="ux_cleardata">
        </div>
        <div id="setbox">
            <div class="ux_simplefontblack">
                <img class="ux_img_lt_one" alt="one" src="/images/sprite.gif" />
                Please select the categories which you want to receive alerts for
            </div>
            <br />
            <div id="dvleftpanels1">
                <!-- div for industry-->
                <div>
                    <div class="ux_dvtabstop">
                        <asp:Label ID="Label14" runat="server" CssClass="ux_simplefontwhite" Text="Industry"></asp:Label>
                    </div>
                </div>
                <div id="dvltindustry" class="ux_divchkbxpop">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" CssClass="ux_checkboxlist" RepeatLayout="UnorderedList">
                    </asp:CheckBoxList>
                </div>
                <div class="ux_divheightsrch">
                </div>
                <!-- div for location-->
                <div>
                    <div class="ux_dvtabstop">
                        <asp:Label ID="Label15" runat="server" CssClass="ux_simplefontwhite" Text="Location"></asp:Label>
                    </div>
                </div>
                <div id="dvltlocation" class="ux_divchkbxpop">
                    <asp:CheckBoxList ID="CheckBoxList2" runat="server" CssClass="ux_checkboxlist" RepeatLayout="UnorderedList">
                    </asp:CheckBoxList>
                </div>
                <div class="ux_divheightsrch">
                </div>
            </div>
            <div id="dvleftpanels2">
                <!-- div for salary range-->
                <div>
                    <div class="ux_dvtabstop">
                        <asp:Label ID="Label18" runat="server" CssClass="ux_simplefontwhite" Text="Salary Range"></asp:Label>
                    </div>
                </div>
                <div id="dvltsalary" class="ux_divchkbxpop">
                    <asp:CheckBoxList ID="CheckBoxList6" runat="server" CssClass="ux_checkboxlist" RepeatLayout="UnorderedList">
                    </asp:CheckBoxList>
                </div>
                <div class="ux_divheightsrch">
                </div>
                <!-- div for contract-->
                <div>
                    <div class="ux_dvtabstop">
                        <asp:Label ID="Label16" runat="server" CssClass="ux_simplefontwhite" Text="Contract"></asp:Label>
                    </div>
                </div>
                <div id="dvltcontract" class="ux_divchkbxpop">
                    <asp:CheckBoxList ID="CheckBoxList3" runat="server" CssClass="ux_checkboxlist" RepeatLayout="UnorderedList">
                        <asp:ListItem Value="3000">Permanent</asp:ListItem>
                        <asp:ListItem Value="3001">Temporary</asp:ListItem>
                        <asp:ListItem Value="3002">Contract</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <div class="ux_divheightsrch">
                </div>
            </div>
            <div id="dvleftpanels3">
                <!-- div for hours-->
                <div>
                    <div class="ux_dvtabstop">
                        <asp:Label ID="Label5" runat="server" CssClass="ux_simplefontwhite" Text="Hours"></asp:Label>
                    </div>
                </div>
                <div id="dvlthours" class="ux_divchkbxpop">
                    <asp:CheckBoxList ID="CheckBoxList4" runat="server" CssClass="ux_checkboxlist" RepeatLayout="UnorderedList">
                        <asp:ListItem Value="3003">Full Time</asp:ListItem>
                        <asp:ListItem Value="3004">Part Time</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <div class="ux_divheightsrch">
                </div>
                <!-- div for employer-->
                <div>
                    <div class="ux_dvtabstop">
                        <asp:Label ID="Label6" runat="server" CssClass="ux_simplefontwhite" Text="Employer"></asp:Label>
                    </div>
                </div>
                <div id="dvltemployer" class="ux_divchkbxpop">
                    <asp:CheckBoxList ID="CheckBoxList5" runat="server" CssClass="ux_checkboxlist" RepeatLayout="UnorderedList">
                        <asp:ListItem Value="7000">Direct</asp:ListItem>
                        <asp:ListItem Value="7001">Agents</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
            </div>
        </div>
        <div class="ux_cleardata">
        </div>
        <br />
        <div>
            <div class="ux_simplefontblack">
                <img class="ux_img_lt_two" alt="two" src="/images/sprite.gif" />
                Please enter your email Address to create a job alert
            </div>
            <br />
            <div id="dvleftpanels4">
                <asp:TextBox ID="Emailsubs" CssClass="ux_TextBoxStyle" runat="server" Width="200px"
                    autofocus="autofocus"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Emailsubs"
                    CssClass="ux_simplefontblack" ErrorMessage="X"></asp:RequiredFieldValidator>
                <asp:Button ID="Button1" runat="server" Text="Subscribe" CssClass="ux_button" OnClick="Button1_Click" />
            </div>
        </div>
        <div class="ux_cleardata">
            <br />
            <br />
        </div>
    </div>
</asp:Content>