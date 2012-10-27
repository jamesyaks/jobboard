<%@ Page Title="" Language="C#" MasterPageFile="~/Job.Master" AutoEventWireup="true"
    CodeBehind="Resetpassword.aspx.cs" Inherits="JB.Resetpassword" %>

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
    <div class="box2">
        <div class="divback">
            <asp:Label ID="Label13" runat="server" Text="Password change in progress..." CssClass="Stylea1"></asp:Label>
        </div>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Email Address" CssClass="StyleRa1"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" CssClass="TextboxSt" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
            CssClass="Stylea101" ErrorMessage="X"></asp:RequiredFieldValidator>
        
        <br />
        <asp:CheckBox ID="CheckBox1" runat="server" CssClass="Stylea8" Text="I am a recruiter" />
        <div class="cleardata">
        </div>
        <br />
        <div class="pwleft">
            <asp:Button ID="Button1" runat="server" Text="Reset" CssClass="button" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="button" CausesValidation="False"
                OnClick="Button2_Click" />
        </div>
    </div>
</asp:Content>
