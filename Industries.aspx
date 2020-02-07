<%@ Page Language="VB" AutoEventWireup="false" CodeFile="contact.aspx.vb" MasterPageFile="~/page.master" Inherits="_Contact" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCP8AOXuUJTgZDIKYoCUZd-bwBnkUApzEU"></script>
    <script src="/Resources/js/pages/contact.js"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="banner overlay black-overlay2 _noFilter _spacing">
        <picture>
                <source srcset="resources//img/Utraco-mobiel-industries.jpg" media="(max-width: 415px)">
                <source srcset="resources//img/Utraco-tablet-industries.jpg" media="(max-width: 768px)">
                <img src="resources//img/Utraco-desktop-industries.jpg" class="img-responsive " >
            </picture>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="_bannerTile">
                        <h1 class="contactcolor">Industries</h1>
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
                                <h3>TOTAL Glass lubricants</h3>
                            </div>
                            <div class="_optionsDes">
                                <p>
                                    UTRACO HOLLAND b.v. is the local distributor for Hungary, Romania and Bulgaria for TOTAL specialties USA Inc.
                                    Glass Proudcts Division, world leader in Glass lubricants
                                </p>
                                <p>
                                    For more information about the product range of TOTAL's Kleenmold product line please click on the TOTAL logo below.
                                </p>
                            </div>
                            <div class="_optionsImg">
                                <img src="resources//img/ci2.png" alt="Alternate Text" class="smallimg" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="tweedechild">
                                <div class="_boxTitle">
                                    <b>TOTAL's Kleenmold product line includes lubricants for all glass applications:</b>
                                </div>
                                <div class="_boxTexts">
                                    <ul>
                                        <li>Shear Sprays</li>
                                        <li>Delivery Coatings</li>
                                        <li>Precoats</li>
                                        <li>Blank Swabbing Lubricants</li>
                                        <li>Pressware</li>
                                        <p>I.S. Machine lubricants</p>
                                        <li>Ring Dopes</li>
                                        <li>Mold Lubricants</li>
                                        <li>Blank Sprays</li>
                                        <li>Swab stations for maximus performance</li>
                                        <li><p>While wordking with Kleenmold lubricants</p></li>
                                    </ul>
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
                                <h3>ARKEMA France</h3>
                            </div>
                            <div class="_optionsDes">
                                <p>
                                    We are the sales agent in Hungary, Romania nd Bulgaria for 
                                    ARKEMA France, and Certincoat ® Glass Container Coatings Systems,
                                    Equipment and Spare Parts.
                                </p>
                                <p>
                                    For more information about ARKEMA's Certincoat product line please 
                                    click the ARKEMA logo below.
                                </p>
                            </div>
                            <div class="_optionsImg">
                                <img src="resources//img/Logo Arkema.png" alt="Alternate Text" class="smallimg" /> 
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="tweedechild">
                                <div class="_boxTitle">
                                    <b>ARKEMA France products</b>
                                </div>
                                <div class="_boxTexts">
                                    <p>
                                    Certincoat ® TC100 is the most frequently used hot-end coating 
                                        material in the world. Tegoglas ® is the most widely recognised 
                                        name in cold-end coating products around the world. ARKEMA
                                        is continuously wordking to develop new equipment and spare
                                        parts tp improve coating quality and production efficiency of 
                                        glass containers.
                                    </p>
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
                                <h3>Get in touch</h3>
                            </div>
                            <div class="_optionsDes">
                                 <p>
                                    if you have any specific question abpout Arkema's or Total's
                                    product line, please feel free to contact us at: <a href="mailto:sales@utraco.nl">sales@utraco.nl</a>
                              </p>
                            </div>
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>