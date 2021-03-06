﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="contact.aspx.vb" MasterPageFile="~/page.master" Inherits="_Contact" %>

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
                <asp:literal ID="ltlImgbanner" runat="server" />
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
            
                <div class="row align-items-center ">
                    <div class="col-md-12 col-lg-6">
                        <div class="_titleInfo">
                            <h2><asp:Literal ID="ltlContactTitle" runat="server" /></h2>
                        </div>
                        <div class="_titleContactInfo">
                            <p><asp:Literal ID="ltlContactTitleSub" runat="server" /></p>
                        </div>
                        <div class="row">
                            <div class="col-lg-5 col-md-12">
                                <div class="innerText _Left">
                                    <p><asp:Literal ID="ltlContactTextLeft1" runat="server" /></p>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-12">
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
                    <div class="col-md-12 col-lg-6">
                        <img src="/resources/img/utraco-wereldkaart.svg" class="giveImageSize" alt="Alternate Text" />
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
                            <h2 class="giveMeMargin">Contact form</h2>
                        </div>

                    </div>
                    <div class="col-lg-8">
                        <div class="contact-inner">
                            <div class="row">
                                <div class="col-lg-5 col-sm-6">
                                    <label class="required">Your Name </label>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtName" placeholder="Your Name" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-lg-5 offset-lg-2 col-sm-6">
                                    <label class="required">Your email address </label>
                                    <div class="form-group">
                                        <asp:TextBox  runat="server" ID="txtEmail" placeholder="Your email address" CssClass="form-control" TextMode="Email" />
                                    </div>
                                </div>
                                <div class="col-lg-5 col-sm-6">
                                    <label>How can we help you?</label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlSoort" runat="server" CssClass="form-control">
                                            <asp:ListItem selected="True" Text="---" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Terugbelverzoek" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                        <span><i class="fas fa-chevron-down"></i></span>
                                    </div>
                                </div>
                                <div class="col-lg-5 offset-lg-2 col-sm-6">
                                    <label class="required">Subject</label>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtPhone" placeholder="Subject" CssClass="form-control" TextMode="Phone"/>
                                    </div>
                                </div>
                                <div class="col-12">
                                     <label>Your Message</label>
                                    <div class="form-group">
                                        <textarea placeholder="Your Message" runat="server" id="txtMessage" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div class="required-ex">
                                                <span>*</span> Required
                                            </div>
                                            <div class="form-box ">
                                                <div class="form-group checkbox">
                                                    <asp:CheckBox runat="server" ID="cbPrivacy" value="check" />
                                                    <label for="cbPrivacy">Yes, I agree with the <a href="/privacy-policy" target="_blank">Privacy policy.</a></label>
                                                </div>
                                            </div>
                                        </div>
                             
                                    </div>
                                </div>
                                
                                <div class="col-lg-4">
                                    <div class="captcha form-group">
                                        <div class="g-recaptcha" id="captcha" data-callback="recaptchaCallBack" data-sitekey="6LcPp_UUAAAAAMktq4zMV2HndUcZEkh06S1ItZsL"></div>
                                    </div>

                                    <div class="btn-submit">
                                        <asp:Button runat="server" ID="btnSubmit1" Text="Send" CssClass="btn-default btn-orange" UseSubmitBehavior="false" OnClientClick="return isContactValid2()" />
                                    </div>
                                 </div>
                                <br />
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
        <br />
    </section>
</asp:Content>



