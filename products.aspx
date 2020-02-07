<%@ Page Language="VB" AutoEventWireup="false" CodeFile="products.aspx.vb" MasterPageFile="~/page.master" Inherits="_Products" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCP8AOXuUJTgZDIKYoCUZd-bwBnkUApzEU"></script>
    <script src="/Resources/js/pages/products.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <section class="banner overlay black-overlay2 _noFilter _Nospacing">
         <picture>
                <source srcset="resources//img/Utraco-mobiel-products.jpg" media="(max-width: 415px)">
                <source srcset="resources//img/Utraco-tablet-products.jpg" media="(max-width: 768px)">
                <img src="resources//img/Utraco-desktop-products.jpg" class="img-responsive " >
            </picture>
        <div class="container">
            <div class="row">
                <div class="col-12">
                     <div class="_bannerTile">
                        <h1>Our products group</h1>
                    </div>
                </div>
                <div class="col-12 mt-4">
                    <div class="_bannerTexts white">
                        <p>
                            From acrylics to thiochemicals, browse below for Utraco's major product
                            groups(listed in alphabetical order under each industry group)
                        </p>
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
                        <h1> Our producy list includes:</h1>
                        <p>(Chech back regulary for additions and updats)</p>
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
                            <div class="product _productItem">
                                <div class="item">
                                    <img src='<%# Eval("sColor") %>' alt='<%# "Utraco Holland " & Eval("sTitle") %>' />
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

                                    <a href="#" class="read-more JSmore">Lees Meer</a>       
                                </div>
                            </div>
                            <%--<div class="product col-lg-2 col-6">
                                 <div class="item">
                                    <img src='<%# Eval("sColor") %>' alt='<%# "Utraco Holland " & Eval("sTitle") %>' />
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
