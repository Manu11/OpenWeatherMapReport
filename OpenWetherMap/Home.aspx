<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OpenWetherMap.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Open Weather Map</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta http-equiv="imagetoolbar" content="no" />
    <link rel="stylesheet" href="styles/layout.css" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.jcarousel.pack.js"></script>
    <script type="text/javascript" src="scripts/jquery.jcarousel.setup.js"></script>
</head>
<body id="top">
    <form id="form1" runat="server">
        <div class="wrapper col1">
            <div id="header">
                <div id="logo">
                    <img width="80%" src="images/openmap.png" />
                    <p>weather report :: support center</p>
                </div>
                <%--<div id="topnav">
                        <ul>
                            <li class="active"><a href="#">Home</a></li>
                        
                        </ul>
                    </div>--%>
                <br class="clear" />
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <br />
        <br />
        <div style="padding-left: 40px">
            <table style="border:none">
                <tr>
                    <td>
                        <asp:GridView ID="gvECapCities" runat="server" AllowPaging="True" PageSize="15" Width="400px"
                            AutoGenerateColumns="False" GridLines="None" OnRowCommand="gvECapCities_RowCommand" OnPageIndexChanging="gvECapCities_PageIndexChanging" CellPadding="4" ForeColor="#333333">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="City Id" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCityId" runat="server" Text='<%# Bind("Id") %>' Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="County">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountry" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Capital City">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCapitalCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnView" runat="server" OnClientClick="return GetWeatherReport()" CommandName="ViewReport">View Weather</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="Black" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <%--<PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />--%>
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:Panel ID="pnlTab" runat="server" Visible="false">

                            <table summary="Summary Here" style="width: 50%" cellpadding="0" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Properties</th>
                                        <th>Value</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="light">
                                        <td>Sunrise</td>
                                        <td>
                                            <asp:Label ID="Sunrise" runat="server"></asp:Label></td>

                                    </tr>
                                    <tr class="dark">
                                        <td>Sunset</td>
                                        <td>
                                            <asp:Label ID="Sunset" runat="server"></asp:Label></td>

                                    </tr>
                                    <tr class="light">
                                        <td>TempMin</td>
                                        <td>
                                            <asp:Label ID="TempMin" runat="server"></asp:Label></td>

                                    </tr>
                                    <tr class="dark">
                                        <td>TempMax</td>
                                        <td>
                                            <asp:Label ID="TempMax" runat="server"></asp:Label></td>

                                    </tr>
                                    <tr class="light">
                                        <td>Name</td>
                                        <td>
                                            <asp:Label ID="Name" runat="server"></asp:Label></td>

                                    </tr>
                                    <tr class="dark">
                                        <td>Country</td>
                                        <td>
                                            <asp:Label ID="Country" runat="server"></asp:Label></td>

                                    </tr>
                                </tbody>
                            </table>
                        </asp:Panel>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
        <!-- ####################################################################################################### -->
        <div class="wrapper col5">
            <div id="copyright">
                <p class="fl_left">Copyright &copy; 2016 - All Rights Reserved - <a href="#">Domain Name</a></p>
                <p class="fl_right">Template by <a href="#" title="Free Website Templates">Sample</a></p>
                <br class="clear" />
            </div>
        </div>
    </form>
</body>
</html>
