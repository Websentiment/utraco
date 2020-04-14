<%@ Page Language="VB" AutoEventWireup="false" CodeFile="products.aspx.vb" MasterPageFile="~/page.master" Inherits="_Products" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCP8AOXuUJTgZDIKYoCUZd-bwBnkUApzEU"></script>
    <script src="/Resources/js/pages/products.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <section class="banner overlay black-overlay2 _noFilter _Nospacing">
         <picture>
                <source id="ltlSrcMobiel" runat="server" srcset="" media="(max-width: 415px)">
                <source id="ltlSrcTablet" runat="server" srcset="" media="(max-width: 768px)">
                <asp:literal ID="ltlImgbanner" runat="server"  />
            </picture>
        <div class="container">
            <div class="row">
                <div class="col-12">
                     <div class="_bannerTile">
                        <h1><asp:Literal ID="ltlTitle" runat="server" /></h1>
                    </div>
                </div>
                <div class="col-12 mt-4">
                    <div class="_bannerTexts white">
                        <p><asp:Literal ID="ltlTitleSub" runat="server" /></p>
                    </div>
               </div>
            </div>
        </div>
    </section>
    <section class="mt-5 _pageTitlePro">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <div class="_pageTitleProText">
                        <h2><asp:Literal ID="ltlInfoTitle" runat="server" /></h2>
                        <p><asp:Literal ID="ltlInfoTitleSub" runat="server" /></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="products _ProItemsContainer mt-5">
        <div class="container-fluid">
            <div class="_giveMePadding">
                <div class="row justify-content-between">
                    <asp:Repeater ID="repGroepen" runat="server">
                        <ItemTemplate>
                            <div class="col-lg col-6">
                                <div class="item">
                                    <img src='<%# Eval("sColor") %>' alt='<%# "Utraco Holland B.V. " & Eval("sTitle") %>' />
                                     <div class="inner">
                                         <div class="_title">
                                            <b><%# Eval("sTitle") %></b>
                                         </div>
                                            <ul>
                                                <asp:Repeater ID="repProducten" runat="server">
                                                    <ItemTemplate>
                                                        <li><%# Eval("sTitle") %></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>

                                    <a href="#" class="read-more JSmore">More products<i class="fas fa-chevron-down"></i></a>       
                                </div>
                            </div>
                            <%--<div class="product col-lg-2 col-6">
                                 <div class="item">
                                    <img src='<%# Eval("sColor") %>' alt='<%# "Utraco Holland B.V. " & Eval("sTitle") %>' />
                                     <div class="inner">
                                                <b><%# Eval("sTitle") %></b>
                                                <ul>
                                                    <asp:Repeater ID="repProducten" runat="server">
                                                        <ItemTemplate>
                                                           <li><%# Eval("sTitle") %></li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ul>
                                         </div>
                                                <a href="#" class="read-more JSmore">
                                                Lees Meer
                                                </a>       
                                </div>
                            </div>--%>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
