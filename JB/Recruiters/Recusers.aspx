<%@ Page Title="" Language="C#" MasterPageFile="~/Recruiters/Recruiters.Master" AutoEventWireup="true"
         CodeBehind="Recusers.aspx.cs" Inherits="JB.Recruiters.RecUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="recbgstytle">
        <asp:Label ID="Label1" runat="server" CssClass="ftwhitebd" Text="Users linked to this recruiter"></asp:Label>
    </div>
    <div class="divsimpleboxlight">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True"
                      CssClass="ftblack" DataKeyNames="idUsers" OnRowEditing="GridView1_RowEditing">
            <Columns>
                <asp:BoundField DataField="uUserName" HeaderText="UserName" />
                <asp:BoundField DataField="uFirstName" HeaderText="FirstName" />
                <asp:BoundField DataField="uLastName" HeaderText="LastName" />
                <asp:BoundField DataField="uIsPrimary" HeaderText="MainUser" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>