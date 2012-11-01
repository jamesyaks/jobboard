<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeekers/Candidates.Master" AutoEventWireup="true"
    CodeBehind="Myapplications.aspx.cs" Inherits="JB.JobSeekers.Myapplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/csjobseeker.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ux_cn_header">
        <asp:Label ID="Label1" runat="server" CssClass="ux_ftwhitebd" Text="Applications made"></asp:Label>
    </div>
    <div class="ux_setrightbg">
        <!-- hook up ajax-->
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="ux_ftblack"
                    AllowPaging="True" BorderStyle="None" GridLines="Horizontal" OnPageIndexChanging="GridView1_PageIndexChanging"
                    Width="400px" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="sTitle" HeaderText="Job Title">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dtEntered" DataFormatString="{0:dd/M/yyyy}" HeaderText="Date Applied">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="sRecruiterName" HeaderText="Recruiter">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>