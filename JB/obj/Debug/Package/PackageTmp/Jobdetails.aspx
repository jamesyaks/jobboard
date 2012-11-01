<%@ Page Title="" Language="C#" MasterPageFile="~/JOB.Master" AutoEventWireup="true"
    CodeBehind="Jobdetails.aspx.cs" Inherits="JB.Jobdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/csjobmaster.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--
        summary
        This code is liscenced by ahrcloud.com
        under free creative common liscence, but
        attribution must be made to the author
        site at www.ahrcloud.com or info@ahrcloud.com

        -->
    <!-- top bar -->
    <div class="ux_divback">
        <asp:Label ID="Label11" runat="server" CssClass="ux_Stylea1"></asp:Label>
    </div>
    <div class="ux_boxcorner">
        <!-- top image-->
        <div class="ux_lpad1">
            <asp:Image ID="Image7" runat="server" Width="75px" />
        </div>
        <div class="ux_cleardata">
        </div>
        <div id="dpabar">
        </div>
        <div class="ux_cleardata">
        </div>
        <div>
            <div id="jobdetaillt">
                <!-- categories -->
                <div class="ux_jdetstyle7">
                    <br />
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label33" runat="server" CssClass="ux_ftblackbd" Text="Job Title"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Label32" runat="server" CssClass="ux_ftblack"></asp:Label>
                    </div>
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label25" runat="server" CssClass="ux_ftblackbd" Text="Ref #"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Label26" runat="server" CssClass="ux_ftblack"></asp:Label>
                    </div>
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label13" runat="server" CssClass="ux_ftblackbd" Text="Salary"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Label20" runat="server" CssClass="ux_ftblack"></asp:Label>
                    </div>
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label14" runat="server" CssClass="ux_ftblackbd" Text="Company"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Label21" runat="server" CssClass="ux_ftblack"></asp:Label></div>
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label15" runat="server" CssClass="ux_ftblackbd" Text="Contract Type"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Label22" runat="server" CssClass="ux_ftblack"></asp:Label>
                    </div>
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label16" runat="server" CssClass="ux_ftblackbd" Text="Date Posted"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Label23" runat="server" CssClass="ux_ftblack"></asp:Label>
                    </div>
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label12" runat="server" CssClass="ux_ftblackbd" Text="Location"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Label19" runat="server" CssClass="ux_ftblack"></asp:Label>
                    </div>
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label1" runat="server" CssClass="ux_ftblackbd" Text="Industry"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Labelindustry" runat="server" CssClass="ux_ftblack"></asp:Label>
                    </div>
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label3" runat="server" CssClass="ux_ftblackbd" Text="Hours"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Labelhrs" runat="server" CssClass="ux_ftblack"></asp:Label>
                    </div>
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label5" runat="server" CssClass="ux_ftblackbd" Text="Employer Type"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Labeletype" runat="server" CssClass="ux_ftblack"></asp:Label>
                    </div>
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label28" runat="server" CssClass="ux_ftblackbd" Text="Contact Email"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Label30" runat="server" CssClass="ux_ftblack"></asp:Label>
                    </div>
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label29" runat="server" CssClass="ux_ftblackbd" Text="Website"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Label31" runat="server" CssClass="ux_ftblack"></asp:Label>
                    </div>
                    <br />
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label17" runat="server" Text="Role Details" CssClass="ux_ftblackbd"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <article>
                            <asp:Label ID="Label18" runat="server" CssClass="ux_Stylea2"></asp:Label>
                        </article>
                    </div>
                </div>
                <div class="ux_cleardata">
                </div>
                <div class="ux_jdetstyle7">
                    <div class="ux_styledbordertp">
                        <asp:Label ID="Label24" runat="server" CssClass="ux_ftblackbd" Text="Contact Person"></asp:Label>
                    </div>
                    <div class="ux_styledborder">
                        <asp:Label ID="Label27" runat="server" CssClass="ux_ftblack"></asp:Label>
                    </div>
                </div>
                <div class="ux_cleardata">
                </div>
            </div>
            <div id="reportpg">
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="Button1_Click" CssClass="ux_fontred">Report this page</asp:LinkButton>
                <div class="ux_jobdetailbr">
                </div>
            </div>
            <div class="ux_cleardata">
            </div>
            <br />
            <div class="ux_styledbordertp1">
                <asp:Button ID="Button2" runat="server" CssClass="ux_button" Text="  Apply  " OnClick="Button2_Click" />
            </div>
            <br />
            <div class="ux_cleardata">
            </div>
            <br />
        </div>
        <div class="ux_cleardata">
        </div>
    </div>
    <!-- end the categories-->
</asp:Content>