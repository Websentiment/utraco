<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cookies.aspx.vb" MasterPageFile="~/page.master" Inherits="_Default" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="banner normal no-image">
        <div class="picture">
            <picture>
                <source id="ltlSrcMobiel" srcset="https://via.placeholder.com/420x1080" media="(max-width: 415px)">
                <source id="ltlSrcTablet" srcset="https://via.placeholder.com/768x1080" media="(max-width: 768px)">
                <img src="#" alt="">
            </picture>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1>Wat zijn cookies</h1>
                    <asp:Literal ID="Title" runat="server" />
                </div>
            </div>
        </div>
    </section>

    <section class="cookies">
        <div class="container text">
            <div class="row">
                <div class="col-12">
                    <asp:Literal ID="ltlInstellingen" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="preference">
                        <div class="item">
                            <div class="row">
                                <div class="col-12 col-sm-2">
                                    <b>Functioneel</b>
                                </div>

                                <div class="col-12 col-sm-8">
                                        <asp:Literal ID="ltlFunctionalCookie" runat="server" />
                                </div>

                                <div class="col-12 col-sm-2 checkbox-mobile">
                                    <div class="checkbox disable">
                                        <asp:CheckBox ID="cbPreference" runat="server" Checked="true" />
                                        <label for="cbPreference"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-12 col-sm-2">
                                    <b>Analytisch</b>
                                </div>

                                <div class="col-12 col-sm-8">
                                    <asp:Literal ID="ltlGACookie" runat="server" />
                                </div>

                                <div class="col-12 col-sm-2 checkbox-mobile">
                                    <div class="checkbox">
                                        <asp:CheckBox ID="cbPreference1" runat="server" Checked="true" />
                                        <label for="cbPreference1"></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="pull-right">
                            <a href="#" class="btn-accept btn-default btn-orange">Accepteren</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <asp:Literal ID="ltlCookies" runat="server" />
                </div>
            </div>
        </div>

        <div class="container info">
            <ul>
                <li>
                    <h4 class="Toggle">Funtionele cookies</h4>
                    <div class="content">
                        <asp:Literal ID="ltlCookieSpec" runat="server" />
                        <div class="table">

                            <div class="row head">
                                <div class="col-2 col">
                                    Naam cookie
                                </div>
                                <div class="col-3 col">
                                    Domein
                                </div>
                                <div class="col-5 col">
                                    Doel cookie
                                </div>
                                <div class="col-2 col">
                                    Bewaartermijn
                                </div>
                            </div>
                            <asp:Repeater ID="repCookies" runat="server">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-2 col">
                                            <%# Eval("sTitle") %>
                                            <span class="border"></span>
                                        </div>
                                        <div class="col-3 col">
                                            <a href='<%# Eval("sItem2") %>'><%# Eval("sItem2") %></a>
                                            <span class="border"></span>
                                        </div>
                                        <div class="col-5 col">
                                            <%# Eval("sItem3") %>
                                            <span class="border"></span>
                                        </div>
                                        <div class="col-2 col">
                                            <%# Eval("sItem4") %>
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </li>
                <li>
                    <h4 class="Toggle">Analytische (statistieken) Cookies</h4>
                    <div class="content">
                        <asp:Literal ID="Literal1" runat="server" />
                        <div class="table">

                            <div class="row head">
                                <div class="col-2 col">
                                    Naam cookie
                                </div>
                                <div class="col-3 col">
                                    Domein
                                </div>
                                <div class="col-5 col">
                                    Doel cookie
                                </div>
                                <div class="col-2 col">
                                    Bewaartermijn
                                </div>
                            </div>
                            <asp:Repeater ID="repCookiesAn" runat="server">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-2 col">
                                            <%# Eval("sTitle") %>
                                            <span class="border"></span>
                                        </div>
                                        <div class="col-3 col">
                                            <a href='<%# Eval("sItem2") %>'><%# Eval("sItem2") %></a>
                                            <span class="border"></span>
                                        </div>
                                        <div class="col-5 col">
                                            <%# Eval("sItem3") %>
                                            <span class="border"></span>
                                        </div>
                                        <div class="col-2 col">
                                            <%# Eval("sItem4") %>
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="container text">
            <div class="row">
                <div class="col-12">
                    <asp:Literal ID="ltlDisclaimer" runat="server" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>
