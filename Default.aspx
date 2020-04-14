<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" MasterPageFile="~/page.master" Inherits="_Default" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="/Resources/js/widgets/Facebookwidget.js"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="widget-messenger">
        <div class="chatboxcon">
            <div class="closebtncon">
                <img src="/Resources/img/Facebook-Messenger.png" />
                <div class="closebtninnercon">
                    <span class="closebtn">&times;</span>
                </div>
            </div>
            <div class="textbox">
                <b>Utraco Holland B.V.</b>
                <br />
                Hallo, Heeft u een probleem?
                <br />
                Dan nemen wij zo snel mogelijk contact op.
                <br />
            </div>
            <div>
                <div class="btnberichtversturen">
                    <i class="fab fa-facebook-messenger"></i>
                    Start Chat
                </div>
            </div>
        </div>
        <div class="messengerbtncon">
            <i class="fab fa-facebook-messenger"></i>
        </div>
    </div>
    <section class="banner _shadow">
        <picture>
                <source id="ltlSrcMobiel" runat="server" srcset="" media="(max-width: 415px)">
                <source id="ltlSrcTablet" runat="server" srcset="" media="(max-width: 768px)">
                <asp:literal ID="ltlImgbanner" runat="server" />
        </picture>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="_bannerTile">
                        <h1><asp:Literal ID="ltlTitle" runat="server" /></h1>
                    </div>
                </div>
                <div class="col-sm-6 offset-sm-3 text-center mt-3">                    
                    <div class="_bannerTexts">
                        <asp:Literal ID="ltlTitleSub" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="usp mt-5">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg col-6">
                    <div class="item">
                        <img src="/resources/img/erlenmeyer glass.svg" alt="Alternate Text" />  
                        <b>Chemical industry</b>
                    </div>
                </div>
                <div class="col-lg col-6">
                    <div class="item">
                        <img src="/resources/img/Pillen.svg" alt="Alternate Text" />   
                        <b>Pharmaceuticals and API's</b>
                    </div>
                </div>
                <div class="col-lg col-6">
                    <div class="item">
                        <img src="/resources/img/cutlery.svg" alt="Alternate Text" />  
                        <b>Food and feed industry</b>
                    </div>
                </div>
                <div class="col-lg col-6">
                    <div class="item">
                        <img src="/resources/img/make-up.svg" alt="Alternate Text" />  
                        <b>Cosmetic industry</b>
                    </div>
                </div>
                <div class="col-lg col-6">
                    <div class="item">
                        <img src="/resources/img/wijn fles.svg" alt="Alternate Text" />   
                        <b>Glass industry</b>
                   </div>
                </div>
            </div>
            <div class="row mt-5">
                 <div class="col-sm-12">                     
                    <h2 class="giveMeSize">Official distributor/agent for</h2>
                     <div class="img-wrapper">
                         <a href="#" target="_blank" onclick="return false;">
                            <img src="/resources/img/ci2.png" alt="Alternate Text" />
                         </a>
                         <a href="#" target="_blank" onclick="return false;">
                            <img src="/resources/img/Logo Arkema.jpg" alt="Alternate Text" />
                         </a>
                     </div>
                </div>               
            </div>

        </div>
    </section>
    <br />
    <section class="information home-info">
        <div class="container-fluid">
            <div class="_giveMePadding">
                <div class="row align-items-center">
                    <div class="col-md-12 col-lg-6">
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
                    <div class="col-md-12 col-lg-6">
                        <img src="/resources/img/utraco-wereldkaart.svg" class="giveImageSize" alt="Alternate Text" />
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

