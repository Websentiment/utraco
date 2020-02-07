<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" MasterPageFile="~/page.master" Inherits="_Default" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="banner _shadow">
        <picture>
                <source srcset="resources//img/Utraco-mobiel-home.jpg" media="(max-width: 415px)">
                <source srcset="resources//img/Utraco-tablet-home.jpg" media="(max-width: 768px)">
                <img src="resources//img/utraco-desktop-home (1).jpg" class="img-responsive " >
            </picture>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="_bannerTile">
                        <h1>Welcome! Allow us to introduce our company</h1>
                        <asp:Literal ID="ltl01" runat="server" />
                    </div>
                </div>
                <div class="col-sm-6 offset-sm-3 text-center mt-3">                    
                    <div class="_bannerTexts">
                        <asp:Literal ID="ltl02" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="usp mt-5">
        <div class="container">
            <div class="row justify-content-between">
                <div class="customCol">
                    <div class="item">
                        <img src="/resources/img/erlenmeyer glass.svg" alt="Alternate Text" />  
                        <b>Chemical industry</b>
                    </div>
                </div>
                <div class="customCol">
                    <div class="item">
                        <img src="/resources/img/Pillen.svg" alt="Alternate Text" />   
                        <b>Pharmaceuticals and API's</b>
                    </div>
                </div>
                <div class="customCo">
                    <div class="item">
                        <img src="/resources/img/cutlery.svg" alt="Alternate Text" />  
                        <b>Food and feed industry</b>
                    </div>
                </div>
                <div class="customCol">
                    <div class="item">
                        <img src="/resources/img/make-up.svg" alt="Alternate Text" />  
                        <b>Cosmetic industry</b>
                    </div>
                </div>
                <div class="customCol">
                    <div class="item">
                        <img src="/resources/img/wijn fles.svg" alt="Alternate Text" />   
                        <b>Glass industry</b>
                   </div>
                </div>
            </div>
            <div class="row mt-5">
                 <div class="col-sm-12">                     
                    <h3>Official distributor/agent for</h3>

                     <div class="img-wrapper">
                         <img src="/resources/img/ci2.png" alt="Alternate Text" />
                        <img src="/resources/img/Logo Arkema.jpg" alt="Alternate Text" />
                     </div>
                </div>               
            </div>

        </div>
    </section>
    <br />
    <section class="information">
        <div class="container-fluid">
            <div class="_giveMePadding">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="_titleInfo">
                            <b>Get in touch</b>
                        </div>
                        <div class="_titleContactInfo">
                            <p>Please contact us by e-mail <a href="mailto:sales@utraco.nl">sales@utraco.nl</a> or by phone <a href="tel:+31302318444">+31 30 2318444</a></p>
                            <%--<p class="txtsmall">Please contact us by e-mail<b class="emailblue"> sales2utraco.nl</b> or by phone<b class="emailblue"> +31 30</b></p>--%>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="innerText _Left">
                                    <b>UTRACO HOLLAND B.V.</b>
                                    <p><b>phone: </b><a href="tel:+31302318444">+31 30 2318444</a></p>
                                    <p><b>E-mail: </b><a href="mailto:sales@utraco.nl">sales@utraco.nl</a></p>
                                </div>
                                <%--<b class="smallfont">UTRACO HOLLAND B.V.</b>
                                <p class="smallfont"><b>phone:</b>+31302318444</p>
                                <p class="smallfont"><b>E-mail:</b>sales@utraco.nl</p>--%>
                            </div>
                            <div class="col-sm-7">
                                <div class="innerText _Right">
                                    <b>Company data</b>
                                    <p><b>ISO nr. </b>3242931</p>
                                    <p><b>API reg. nr. </b>API 6137</p>
                                    <p><b>Feed Approved Establishment nr . </b>aNL208728</p>
                                </div>
                                <%--<b class="smallfont">Company data</b>
                                <p class="smallfont"><b> ISO nr.</b> 3242931</p>
                                <p class="smallfont"><b>API reg. nr.</b> API 6137</p>
                                <p class="smallfont"><b>Feed Approved Establishment nr .</b> aNL208728</p>--%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="innerText _Left2">
                                    <b>Address</b>
                                    <p>Smallepad 32</p>
                                    <p>3811 MG Amersfoort, The Nederlands</p>
                                </div>
                                <%--<b class="smallfont"> Address</b>
                                <p class="smallfont">Smallepad 32</p>
                                <p class="smallfont">3811 MG Amersfoort, The Nederlands</p>--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <img src="/resources/img/utraco-kaart-arkema.png" class="img-fluid" alt="Alternate Text" />
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

