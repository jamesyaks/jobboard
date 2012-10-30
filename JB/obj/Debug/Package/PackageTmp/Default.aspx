<%@ Page Title="" Language="C#" MasterPageFile="~/JOB.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="JB.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.min.js" type="text/javascript"> </script>
    <script src="/Scripts/jquery.autocomplete.js" type="text/javascript"> </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--
        summary
        This code is liscenced by ahrcloud.com
        under free creative common liscence, but
        attribution must be made to the author
        site at www.ahrcloud.com or info@ahrcloud.com
        -->
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release">
    </asp:ScriptManager>
    <div class="leftpanel">
        <!-- search divs-->
        <div>
            <div class="divback">
                <div class="dvleft">
                    <asp:Label ID="Label1" runat="server" CssClass="ftwhite" Text="Advanced Search"></asp:Label>
                </div>
                <div class="dvright">
                    <asp:ImageButton ID="ClearFilters" runat="server" Visible="False" CssClass="img_lt_filters"
                        ImageUrl="/images/sprite.gif" OnClick="ClearFilters_Click" />
                </div>
            </div>
            <div id="dvclear">
            </div>
            <div class="divheightsrch">
            </div>
            <div class="lftp2">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="searchtextboxline" Width="100%"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBox2_TextBoxWatermarkExtender" runat="server"
                    Enabled="True" TargetControlID="TextBox2" WatermarkText="type here..." WatermarkCssClass="fontgray">
                </asp:TextBoxWatermarkExtender>
            </div>
            <div class="divheightsrch">
            </div>
            <asp:Label ID="Label14" runat="server" CssClass="headingone" Text="Industry"></asp:Label>
            <div class="ln_ccc">
            </div>
            <div id="dvltindustry" class="divchkbxpop">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" CssClass="checkboxlist" RepeatLayout="UnorderedList">
                </asp:CheckBoxList>
            </div>
            <div class="divheightsrch">
            </div>
            <!-- div for industry-->
            <asp:Label ID="Label15" runat="server" CssClass="headingone" Text="Location"></asp:Label>
            <div class="ln_ccc">
            </div>
            <div id="dvltlocation" class="divchkbxpop">
                <asp:CheckBoxList ID="CheckBoxList2" runat="server" CssClass="checkboxlist" RepeatLayout="UnorderedList">
                </asp:CheckBoxList>
            </div>
            <div class="divheightsrch">
            </div>
            <!-- div for salary range-->
            <asp:Label ID="Label18" runat="server" CssClass="headingone" Text="Salary Range"></asp:Label>
            <div class="ln_ccc">
            </div>
            <div id="dvltsalary" class="divchkbxpop">
                <asp:CheckBoxList ID="CheckBoxList6" runat="server" CssClass="checkboxlist" RepeatLayout="UnorderedList">
                </asp:CheckBoxList>
            </div>
            <div class="divheightsrch">
            </div>
            <!-- div for contract-->
            <asp:Label ID="Label16" runat="server" CssClass="headingone" Text="Contract"></asp:Label>
            <div class="ln_ccc">
            </div>
            <div id="dvltcontract" class="stylea3modified">
                <asp:CheckBoxList ID="CheckBoxList3" runat="server" CssClass="checkboxlist" RepeatLayout="UnorderedList">
                    <asp:ListItem Value="3000">Permanent</asp:ListItem>
                    <asp:ListItem Value="3001">Temporary</asp:ListItem>
                    <asp:ListItem Value="3002">Contract</asp:ListItem>
                </asp:CheckBoxList>
            </div>
            <div class="divheightsrch">
            </div>
            <!-- div for hours-->
            <asp:Label ID="Label5" runat="server" CssClass="headingone" Text="Hours"></asp:Label>
            <div class="ln_ccc">
            </div>
            <div id="dvlthours" class="stylea3modified">
                <asp:CheckBoxList ID="CheckBoxList4" runat="server" CssClass="checkboxlist" RepeatLayout="UnorderedList">
                    <asp:ListItem Value="3003">Full Time</asp:ListItem>
                    <asp:ListItem Value="3004">Part Time</asp:ListItem>
                </asp:CheckBoxList>
            </div>
            <div class="divheightsrch">
            </div>
            <!-- div for employer-->
            <asp:Label ID="Label6" runat="server" CssClass="headingone" Text="Employer"></asp:Label>
            <div class="ln_ccc">
            </div>
            <div id="dvltemployer" class="stylea3modified">
                <asp:CheckBoxList ID="CheckBoxList5" runat="server" CssClass="checkboxlist" RepeatLayout="UnorderedList">
                    <asp:ListItem Value="7000">Direct</asp:ListItem>
                    <asp:ListItem Value="7001">Agents</asp:ListItem>
                </asp:CheckBoxList>
            </div>
            <!--search button-->
            <div class="ln_ccc">
            </div>
            <div class="lftp2">
                <asp:Button ID="Button1" runat="server" CausesValidation="False" CssClass="button"
                    OnClick="Button1_Click" Text="Filter Search" />
            </div>
            <div class="divheightsrch">
            </div>
        </div>
        <!-- end search divs-->
        <!-- menu for additional links-->
        <br />
        <div class="tpboundbrdr">
            <img class="img_lt_blog" src="/images/sprite.gif" alt="blog" />
            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="lowerbrdrdotted" NavigateUrl="~/webblog.aspx">Our Blog</asp:HyperLink>
        </div>
        <div class="tpboundbrdr">
            <img class="img_lt_contact" src="/images/sprite.gif" alt="contact" />
            <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CssClass="lowerbrdrdotted"
                OnClick="LinkButton44_Click">Contact us</asp:LinkButton>
        </div>
        <div class="tpboundbrdr">
            <img class="img_lt_users" src="/images/sprite.gif" alt="recruiters" />
            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="lowerbrdrdotted"
                OnClick="LinkButtonj_Click">All Recruiters</asp:LinkButton>
        </div>
        <div class="tpboundbrdr">
            <img class="img_lt_mail" src="/images/sprite.gif" alt="set up email alert" />
            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="lowerbrdrdotted"
                OnClick="LinkButton2_Click">Setup a Job Alert</asp:LinkButton>
        </div>
        <div class="tpboundbrdr">
            <img class="img_lt_rss" src="/images/sprite.gif" alt="rss" />
            <a href="/jobrss.aspx" class="lowerbrdrdotted">Subscribe to RSS</a>
        </div>
        <div>
        </div>
    </div>
    <div class="centerpanel">
        <!--grid-->
        <div class="boxmid">
            <div id="dvbk" class="divback">
                <div class="dvleft">
                    <asp:Label ID="Label13" runat="server" CssClass="ftwhite" Text=" Jobs Found!"></asp:Label>
                </div>
            </div>
            <div class="cleardata">
            </div>
            <div>
                <!-- grid view for the adverts -->
                <div class="align_frec">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BorderWidth="0px"
                        GridLines="None">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="left_align_frec">
                                        <asp:Image ID="Image7" runat="server" Width="75px" ImageUrl='<%#                                        Bind("Article_data") %>' />
                                    </div>
                                    <div class="right_align_frec">
                                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="fthlinkblackbd" NavigateUrl='<%#                                        "JobDetails.aspx?JobID=" + Eval("idJobs") %>'
                                            Text='<%#Bind("sTitle") %>'></asp:HyperLink>
                                        <br />
                                        <asp:Label ID="Label7" runat="server" CssClass="simplefontblack" Text='<%#Bind("descr") %>'></asp:Label>
                                    </div>
                                    <br />
                                    <div class="cleardata">
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="cleardata">
                </div>
                <!-- grid view for the center box -->
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound"
                    ShowHeader="False" Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="gridmain">
                                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%#                "JobDetails.aspx?JobID=" + Eval("idJobs") %>'
                                        CssClass="fontredh1" Text='<%#Bind("sTitle") %>'></asp:HyperLink>
                                    <br />
                                    <asp:Label ID="Label11" runat="server" Text="posted on" CssClass="ftblack"></asp:Label>
                                    <asp:Label ID="Label21" runat="server" Text='<%#                Bind("dtEnteredDate", "{0:dd/M/yyyy}") %>'
                                        CssClass="ftblack"></asp:Label>
                                    <asp:Label ID="Label12" runat="server" Text="■ salary " CssClass="ftblack"></asp:Label>
                                    <asp:Label ID="Label4" runat="server" Text='<%#Bind("sSalaryText") %>' CssClass="ftblack"></asp:Label>
                                    <asp:Label ID="Label17" runat="server" Text="■ applications " CssClass="ftblack"></asp:Label>
                                    <asp:Label ID="Label22" runat="server" Text='<%#Bind("applicationvolume") %>' CssClass="ftblack"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Text='<%#Bind("sShortDescription") %>' CssClass="ftgray"></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="PagerStyle" />
                </asp:GridView>
                <br />
            </div>
        </div>
        <br />
    </div>
    <div class="rightpanel">
        <div class="divback">
            <asp:Label ID="Label20" runat="server" CssClass="ftwhite" Text="Google Ads"></asp:Label>
        </div>
        <div class="googads">
            Ads by google...
        </div>
        <div class="divheightsrch">
        </div>
    </div>
</asp:Content>