<%@ Page Title="" Language="C#" MasterPageFile="~/Recruiters/Recruiters.Master" AutoEventWireup="true"
    CodeBehind="JobForm.aspx.cs" Inherits="JB.Recruiters.RecJobs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div class="ux_recbgstytle">
        <asp:Label ID="Label14" runat="server" CssClass="ux_ftwhitebd" Text="Job Posting"></asp:Label>
    </div>
    <div class="ux_setrightbg">
        <asp:Label ID="Label1" runat="server" CssClass="ux_ftgraybd" Text="JobTitle"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" CssClass="ux_TextBoxStyle" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="X"
            ControlToValidate="TextBox1" CssClass="ux_ftgraybd"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label2" runat="server" CssClass="ux_ftgraybd" Text="Short Description"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" CssClass="ux_TextBoxStyle" Height="50px" TextMode="MultiLine"
            Wrap="True" Width="400px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="X"
            ControlToValidate="TextBox2" CssClass="ux_ftgraybd"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label13" runat="server" CssClass="ux_ftgraybd" Text="Details"></asp:Label>
        <br />
        <asp:TextBox ID="Editor1" runat="server" CssClass="ux_TextBoxStyle" Height="50px" TextMode="MultiLine"
            Wrap="True" Width="400px"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" CssClass="ux_ftgraybd" Text="Posting Start Date"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" CssClass="ux_TextBoxStyle" Width="200px"></asp:TextBox>
        <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" Format="dd/M/yyyy"
            Enabled="True" TargetControlID="TextBox3" PopupButtonID="Image8">
        </asp:CalendarExtender>
        <asp:Image ID="Image8" CssClass="ux_img_lt_calender" runat="server" ImageUrl="/images/sprite.gif"
            onmouseover="document.body.style.cursor='pointer'" onmouseout="document.body.style.cursor='default'"
            ImageAlign="AbsMiddle" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="X"
            ControlToValidate="TextBox3" CssClass="ux_ftgraybd"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label4" runat="server" CssClass="ux_ftgraybd" Text="Posting End Date"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" CssClass="ux_TextBoxStyle" Width="200px"></asp:TextBox>
        <asp:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" Enabled="True"
            TargetControlID="TextBox4" PopupButtonID="Image9" Format="dd/M/yyyy">
        </asp:CalendarExtender>
        <asp:Image ID="Image9" CssClass="ux_img_lt_calender" runat="server" ImageUrl="/images/sprite.gif"
            onmouseover="document.body.style.cursor='pointer'" onmouseout="document.body.style.cursor='default'"
            ImageAlign="AbsMiddle" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="X"
            ControlToValidate="TextBox4" CssClass="ux_ftgraybd"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" CssClass="ux_ftgraybd" Text="Location"></asp:Label>
        <div class="ux_border">
            <div class="ux_divchkbxpop">
                <asp:CheckBoxList ID="CheckBoxList2" runat="server" CssClass="ux_checkboxlist" RepeatLayout="UnorderedList">
                </asp:CheckBoxList>
            </div>
        </div>
        <asp:Label ID="Label6" runat="server" CssClass="ux_ftgraybd" Text="Contract Type"></asp:Label>
        <div class="ux_border">
            <div class="ux_divchkbxpop">
                <asp:CheckBoxList ID="CheckBoxList3" runat="server" CssClass="ux_checkboxlist" RepeatLayout="UnorderedList">
                    <asp:ListItem Value="3000">Permanent</asp:ListItem>
                    <asp:ListItem Value="3001">Temporary</asp:ListItem>
                    <asp:ListItem Value="3002">Contract</asp:ListItem>
                </asp:CheckBoxList>
            </div>
        </div>
        <asp:Label ID="Label7" runat="server" CssClass="ux_ftgraybd" Text="Hours"></asp:Label>
        <div class="ux_border">
            <div class="ux_divchkbxpop">
                <asp:CheckBoxList ID="CheckBoxList7" runat="server" CssClass="ux_checkboxlist" RepeatLayout="UnorderedList">
                    <asp:ListItem Value="3003">Full Time</asp:ListItem>
                    <asp:ListItem Value="3004">Part Time</asp:ListItem>
                </asp:CheckBoxList>
            </div>
        </div>
        <asp:Label ID="Label8" runat="server" CssClass="ux_ftgraybd" Text="Employer"></asp:Label>
        <div class="ux_border">
            <div class="ux_divchkbxpop">
                <asp:CheckBoxList ID="CheckBoxList8" runat="server" CssClass="ux_checkboxlist" RepeatLayout="UnorderedList">
                    <asp:ListItem Value="7000">Direct</asp:ListItem>
                    <asp:ListItem Value="7001">Agent</asp:ListItem>
                </asp:CheckBoxList>
            </div>
        </div>
        <asp:Label ID="Label9" runat="server" CssClass="ux_ftgraybd" Text="Industry"></asp:Label>
        <div class="ux_border">
            <div class="ux_divchkbxpop">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" CssClass="ux_checkboxlist" RepeatLayout="UnorderedList">
                </asp:CheckBoxList>
            </div>
        </div>
        <asp:Label ID="Label10" runat="server" CssClass="ux_ftgraybd" Text="Salary"></asp:Label>
        <div class="ux_border">
            <div class="ux_divchkbxpop">
                <asp:CheckBoxList ID="CheckBoxList6" runat="server" CssClass="ux_checkboxlist" RepeatLayout="UnorderedList">
                </asp:CheckBoxList>
            </div>
        </div>
        <br />
        <asp:Label ID="Label11" runat="server" CssClass="ux_ftgraybd" Text="Salary Text"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox5" runat="server" CssClass="ux_TextBoxStyle" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox5"
            CssClass="ux_ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label12" runat="server" CssClass="ux_ftgraybd" Text="Job Ref #"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox6" runat="server" CssClass="ux_TextBoxStyle" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox6"
            CssClass="ux_ftgraybd" ErrorMessage="X"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" CssClass="ux_button" Text="Save" OnClick="Button1_Click" />
    </div>
</asp:Content>