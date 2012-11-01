﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Recruiters/Recruiters.Master" AutoEventWireup="true"
    CodeBehind="Rechome.aspx.cs" Inherits="JB.Recruiters.Rechome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ux_recbgstytle">
        <asp:Label ID="Label2" runat="server" Text="Recruiter Dashboard" CssClass="ux_ftwhitebd"></asp:Label>
    </div>
    <div class="ux_cleardata">
    </div>
    <div class="ux_setrightbg">
        <!-- zoom level adjustment -->
        <div id="zoomslevel">
            <asp:DropDownList ID="zoomer" CssClass="ux_TextBoxStyle" runat="server" AutoPostBack="true">
                <asp:ListItem Selected="True" Value="200">Zoom Level: 200</asp:ListItem>
                <asp:ListItem Value="300">Zoom Level: 300</asp:ListItem>
                <asp:ListItem Value="400">Zoom Level: 400</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="ux_cleardata">
        </div>
        <br />
        <!-- charts start -->
        <div class="ux_divchartone">
            <div class="ux_divsimpleboxchart">
                <asp:Label ID="Label3" runat="server" CssClass="ux_simplefontblack" Text="JobsViewedbycandidates"></asp:Label>
                <hr />
                <asp:Chart ID="Chart1" runat="server" Height="200px">
                    <Series>
                        <asp:Series Name="Series1" ChartType="Spline" YValuesPerPoint="4">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>
        <div class="ux_divchartone">
            <div class="ux_divsimpleboxchart">
                <asp:Label ID="Label1" runat="server" CssClass="ux_simplefontblack" Text="JobApplicationsmade"></asp:Label>
                <hr />
                <asp:Chart ID="jobapps" runat="server" Height="200px">
                    <Series>
                        <asp:Series Name="Series1" ChartType="Spline" YValuesPerPoint="4">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>
        <div class="ux_divchartone">
            <div class="ux_divsimpleboxchart">
                <asp:Label ID="Label4" runat="server" CssClass="ux_simplefontblack" Text="JobsyouPosted"></asp:Label>
                <hr />
                <asp:Chart ID="jobpostedview" runat="server" Height="200px">
                    <Series>
                        <asp:Series Name="Series1" ChartType="Spline" YValuesPerPoint="4">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>
        <div class="ux_cleardata">
        </div>
        <br />
    </div>
</asp:Content>