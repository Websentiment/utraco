<%@ Page Language="VB" AutoEventWireup="false" CodeFile="category.aspx.vb" MasterPageFile="~/page.master" Inherits="_categorie" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="shop">
        <div class="container">
            <div class="row">
                <div class="col-sm-10 offset-sm-1">
                    <div class="title temp1">
                        <b class="title"><asp:Literal runat="server" id="ltlTitle" /></b>
                        <p><asp:Literal runat="server" id="ltTekst" /></p>
                    </div>
                </div>
                
                <div class="col-md-3" runat="server" id="divCategories" >
                    <div class="keuzehulp">
                        <h5>Producten</h5>
                        <asp:Repeater runat="server" ID="repCategories">
                            <HeaderTemplate>
                                <ul >
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li runat="server" id="aLink"  class="toggle" role="button" aria-haspopup="true" aria-expanded="true">
                                    <a href='<%# Eval("sURL").ToString().Replace("~", "") %>'><asp:Literal runat="server" Text='<%# Eval("sTitle") %>' /></a>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="" runat="server" id="divProducts">
                    <div class="row">
                        <asp:Repeater runat="server" ID="repCategorien">
                            <ItemTemplate>
                                <div class="col-md-3 col-6">
                                    <a runat="server" id="aNoFollow" rel="nofollow" href='<%# Eval("sURL").ToString().Trim("~") %>'>
                                        <div class="item">
                                            <img runat="server" class="category-img" id="imgCategorieThumb"  src='<%# Eval("sSmall").ToString().Replace("~/", sURL()) %>'/>
                                        </div>
                                        <div class="item-desc">
                                            <b><asp:Literal runat="server" Text='<%# Eval("sTitle") %>' /></b>
                                        </div>
                                    </a>
                                </div>

                                <%--<div id="divGridItem" class="col-lg-3 col-sm-4 divItem" runat="server">
                                    <div class="divPrice">
                                        <span runat="server" id="spPrice" class="categoryPrice">
                                        </span> 
                                        <span runat="server" id="spanPrice" class="">
                                                <asp:Literal runat="server" ID="ltlNewPrice" />
                                        </span>
                                        <span class="direct" runat="server" id="spVoorraadInfo" visible="false"></span>
                                    </div>
                                </div>--%>
                            </ItemTemplate>
                        </asp:Repeater>
                        
                        <asp:Repeater runat="server" ID="repArtikelen" OnItemDataBound="repArtikelen_ItemDataBound" Visible="true">
                            <ItemTemplate>
                                <div id="divGridItem" class="col-md-3 col-6" data-artikel-id='<%# Eval("iArtikelID") %>' runat="server">
                                    <a runat="server" id="aNoFollow" href='<%# Eval("sURL").ToString().Trim("~") %>' rel="nofollow">
                                        <div class="item">
                                            <img runat="server" id="imgThumb" class="" src='<%# Eval("sSmall").ToString().Replace("~/", sURL()) %>'/>
                                        </div>
                                        <div class="item-desc">
                                            <b><asp:Literal runat="server" ID="ltlName" /></b>
                                            <p runat="server" id="spanPrice" class=""><asp:Literal runat="server" ID="ltlNewPrice" /></p>
                                            <span class="direct" runat="server" id="spVoorraadInfo" visible="false"></span>
                                            <p class="" id="oldPrice" runat="server"><asp:Literal ID="ltlPrice" runat="server" /></p>
                                        </div>
                                    </a>
                                </div>

                                <div class="col-md-3 col-sm-4 divItem" Visible="false" runat="server">
                                    <div class="item">
                                        <div class="divPrice lead">
                                            <span runat="server" id="spPrice" class="price"></span>
                                            
                                        </div>
                                    </div>

                                    <span class="title" visible="false">.                                        
                                        <asp:Literal runat="server" Visible="false" ID="ltlOmschrijving" />
                                    </span>

                                    <div class="request" runat="server" id="divRequest" visible="false">
                                        <asp:Literal runat="server" Text='<%$ Resources:Resource, priceOnRequest %>' />
                                        <a class="btn btn-black aProductLink" runat="server" id="aFollow">
                                            <asp:Literal runat="server" ID="ltlLink" />
                                        </a>
                                    </div>
                                </div>

            <%--                        <div class="caption">
                                        <span class="group inner list-group-item-heading title"></span>
                                        <p class="group inner list-group-item-text">
                                            <div visible="false"></div>
                                        </p>
                                    </div>--%>
                            </ItemTemplate>
                        </asp:Repeater>
                            
                        <%--<div class="col-md-3 col-sm-6">
                            <a href="#">
                                <div class="item">
                                    <img src="/Resources/img/placeholder.png" />
                                </div>
                                <div class="item-desc">
                                    <b>Product 2</b>
                                    <p>€ 40,00</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <a href="#">
                                <div class="item">
                                    <img src="/Resources/img/placeholder.png" />
                                </div>
                                <div class="item-desc">
                                    <b>Product 3</b>
                                    <p>€ 40,00</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <a href="#">
                                <div class="item">
                                    <img src="/Resources/img/placeholder.png" />
                                </div>
                                <div class="item-desc">
                                    <b>Product 4</b>
                                    <p>€ 40,00</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <a href="#">
                                <div class="item">
                                    <img src="/Resources/img/placeholder.png" />
                                </div>
                                <div class="item-desc">
                                    <b>Product 5</b>
                                    <p>€ 40,00</p>
                                </div>
                            </a>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="collection category fs1">
        <div class="container">
            <div class="row">
                <div runat="server" id="divPageTitle" class="inner ">
                    <asp:Literal ID="Titel" runat="server" />
                </div>
            
                <asp:Repeater ID="repSubCategorieLabels" OnItemDataBound="repSubCategorieLabels_ItemDataBound" runat="server">
                    <HeaderTemplate>
                        <div class="col-sm-12">
                            <ul class="sub-cat">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <a href='<%# Eval("sURL") %>' runat="server">
                            <li id="liSubCatLabel" runat="server">
                                <asp:Literal runat="server" Text='<%# Eval("sTitle") %>' />
                            </li>
                        </a>
                    </ItemTemplate>
                    <FooterTemplate>
                            </ul>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            
                <div class="tekst" id="divTekst" runat="server">
                    <asp:Literal ID="Tekst" runat="server" />
                </div>

                

                
            </div>
        </div>
    </section>

    <section class="gallery">
        <div id="instafeed" class="items responsive-image divSlickGallery"></div>
    </section>
     <asp:HiddenField ID="hidIndex" runat="server" />
</asp:Content>
