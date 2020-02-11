<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Industries.aspx.vb" MasterPageFile="~/page.master" Inherits="_Industries" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCP8AOXuUJTgZDIKYoCUZd-bwBnkUApzEU"></script>
    <script src="/Resources/js/pages/contact.js"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="banner overlay black-overlay2 _noFilter _spacing">
        <picture>
                <source id="ltlSrcMobiel" runat="server" srcset="" media="(max-width: 415px)">
                <source id="ltlSrcTablet" runat="server" srcset="" media="(max-width: 768px)">
                <asp:literal ID="ltlImgbanneri" runat="server" />
            </picture>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="_bannerTile">
                        <h1 class="contactcolor"><asp:Literal ID="ltlTitle" runat="server" /></h1>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="options mt-5">
        <div class="container-fluid">
            <div class="_giveMePadding">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="_optionsTile">
                                <h2><asp:Literal ID="ltlCompanyTitle1" runat="server" /></h2>
                            </div>
                            <div class="_optionsDes">
                                <p><asp:Literal ID="ltlCompanyText1" runat="server" /></p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="tweedechild">
                                <div class="_boxTitle">
                                    <span><asp:Literal ID="ltlCompanyBoxTitle1" runat="server" /></span>
                                </div>
                                <div class="_boxTexts">
                                    <asp:Literal ID="ltlCompanyBoxText1" runat="server" />
                                </div>
                              </div>
                             </div> 
                            </div>
                        <br />
                        <hr />
                </div>
            </div>
        </div>
    </section>
    <section class="options mt-4">
        <div class="container-fluid">
            <div class="_giveMePadding">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="_optionsTile">
                                <h2><asp:Literal ID="ltlCompanyTitle2" runat="server" /></h2>
                            </div>
                            <div class="_optionsDes">
                                <p><asp:Literal ID="ltlCompanyText2" runat="server" /></p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="tweedechild">
                                <div class="_boxTitle">
                                    <span><asp:Literal ID="ltlCompanyBoxTitle2" runat="server" /></span>
                                </div>
                                <div class="_boxTexts">
                                    <p><asp:Literal ID="ltlCompanyBoxText2" runat="server" /></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="touch options mt-4">
        <div class="container-fluid">
            <div class="_giveMePadding">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="_optionsTile">
                                <h2><asp:Literal ID="ltlContactTitle" runat="server" /></h2>
                            </div>
                            <div class="_optionsDes">
                                 <p><asp:Literal ID="ltlContactText" runat="server" /></p>
                            </div>
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>