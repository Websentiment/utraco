<%@ Page Language="VB" AutoEventWireup="false" CodeFile="contact.aspx.vb" MasterPageFile="~/page.master" Inherits="_Contact" %>

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
                <asp:literal ID="ltlImgbanner" runat="server"  />
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
    <section class="information informationcontact mt-4">
        <div class="container-fluid">
            <div class="_giveMePadding">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="_titleInfo">
                            <h2><asp:Literal ID="ltlContactTitle" runat="server" /></h2>
                        </div>
                        <div class="_titleContactInfo">
                            <p><asp:Literal ID="ltlContactTitleSub" runat="server" /></p>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="innerText _Left">
                                    <p><asp:Literal ID="ltlContactTextLeft1" runat="server" /></p>
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <div class="innerText _Right">
                                    <p><asp:Literal ID="ltlContactTextRight1" runat="server" /></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="innerText _Left2">
                                    <p><asp:Literal ID="ltlContactTextLeft2" runat="server" /></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <img src="/resources/img/utraco-kaart-arkema.png" class="img-fluid" alt="Alternate Text" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="contactpage">
        <div class="container-fluid">
            <div class="_giveMePadding">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="title">
                            <asp:Literal ID="ltl02" runat="server" />
                            <br />
                            <h2>Contact form</h2>
                        </div>

                    </div>
                    <div class="col-lg-7">
                        <div class="contact-inner">
                            <div class="row">
                                <div class="col-sm-5">
                                    <label>Your name(required)</label>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-5 offset-sm-2">
                                    <label>Uw e-mail adres </label>
                                    <div class="form-group">
                                        <asp:TextBox  runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" />
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <label>Telefoonnummer</label>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" TextMode="Phone"/>
                                    </div>
                                </div>
                                <div class="col-sm-5 offset-sm-2">
                                    <label>Soort contact</label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlSoort" runat="server" CssClass="form-control">
                                            <asp:ListItem selected="True" Text="---" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Terugbelverzoek" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-12">
                                     <label>Bericht</label>
                                    <div class="form-group">
                                        <textarea runat="server" id="txtMessage" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-box ">
                                        <div class="checkbox">
                                            <asp:CheckBox runat="server" ID="cbPrivacy" value="check" />
                                            <label for="cbPrivacy">Ja, ik ga akkoord met de <a href="/privacyverklaring" target="_blank">Privacyverklaring.</a></label>
                                        </div>
                                    </div>
                                </div>
                             
                            </div>
                                </div>
                                <br />
                                <div class="col-lg-4">
                                    <asp:Button runat="server" ID="btnSubmit1" Text="Verzenden" CssClass="btn-default btn-orange" UseSubmitBehavior="false" OnClientClick="return isContactValid2()" />
                                 </div>
                            
                            </div>
                       
                        </div>
                    </div>

                    <div class="col-lg-4 offset-lg-1">
                        <div class="text first">
                            <asp:Literal ID="ltl03" runat="server" />

                            <div runat="server" id="test" visible="false">                            
                                <b><asp:Literal ID="ltlBedrijfsnaam" runat="server" /></b>
                                <ul>
                                    <li>
                                        <a href="#" id="astraat" runat="server"><asp:Literal ID="ltlStraat" runat="server" /></a>
                                    </li>
                                    <li>
                                        <a href="#" id="aPostcode" runat="server"><asp:Literal ID="ltlPostcode" runat="server" /></a>
                                    </li>
                                    <li>
                                        <a href="#" id="aTel" runat="server"><asp:Literal ID="ltlTel" runat="server" /></a>
                                    </li>
                                    <li>
                                        <a href="#" id="aMail" runat="server"><asp:Literal ID="ltlMail" runat="server" /></a>
                                    </li>
                                </ul>
                            </div>
                        
                            <asp:Literal ID="Openingstijden" runat="server" />
                            <asp:Literal ID="Spreekuur" runat="server" />
                        </div>
                    </div>
                </div>
                <div class=" img-contain">
                    <div class="row">
                        <div class="col-sm-6">
                            <asp:Literal ID="ltl05" runat="server" />
                        </div>
                        <div class="col-sm-6">
                            <asp:Literal ID="ltl06" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-7 col-sm-6">
                        <div id="map" class="map"></div>
                    </div>
                    <div class="col-lg-4 offset-lg-1 col-sm-6">
                        <div class="text time">
                            <div class="table">
                                <asp:Literal ID="ltl04" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

