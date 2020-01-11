<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" MasterPageFile="~/page.master" Inherits="_Default" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="head-home">
<%--        <div class="video">
            <video autoplay="" loop="loop" muted="muted" playsinline="playsinline" class="video1" id="vid1" poster="/ui/images/vid_screenshot.jpg">
                <source src="https://alfasite.nl/Uploads/video/backvid.mp4" type="video/mp4">
            </video>
        </div>--%>
        <div class="overlay-inner h-100">
            <div class="container-fluid center wow fadeIn">
                <div class="row ">
                    <div class="col-lg-5 offset-lg-1">
                        <div class="inner-custom">
                            <asp:Literal runat="server" ID="introTitel" />
                            <br />
                            <a href="#pakketten" class="btn-default smooth-scroll">Weten wat je krijgt?</a>
                        </div>
                    </div>
                    <div class="col-lg-4 offset-lg-1">
                        <div class="inner-custom">
                            <asp:Literal runat="server" ID="formTekst" />

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCompany" placeholder="Bedrijfsnaam" />
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" placeholder="Email" />
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtPhone" placeholder="Telefoon" />
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <textarea runat="server" class="form-control" id="txtMessage" placeholder="Bericht" />
                                    </div>

                                    <div class="form-group">
                                        <div class="checkbox">
                                            <asp:CheckBox runat="server" ID="cbPrivacy" value="check" />
                                            <label for="cbPrivacy">Ja, ik ga akkoord met de <a href="/privacyverklaring" target="_blank">Privacyverklaring.</a></label>
                                        </div>
                                    </div>

                                    <asp:Button runat="server" ID="btnSubmit1" Text="Bel mij terug" CssClass="btn-default w-100" UseSubmitBehavior="false" OnClientClick="return isFormHomeValid()" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <a href="#company" class="smooth-scroll scrolldown">
            <i class="fas fa-chevron-down"></i>
        </a>
    </section>

    <section class="about" id="company">
        <div class="container">
            <div class="row align-items-center wow fadeIn"  >
                <div class="col-sm-2">
                    <img src="/resources/img/alfasite-logo.png" class="img-fluid"/>
                </div>
                <div class="col-sm-9 offset-sm-1">
                    <asp:Literal runat="server" ID="introTekst" />
                </div>
            </div>
        </div>
    </section>

    <section class="about-grid" id="voordelen">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 offset-lg-1">
                    <div class="row">
                        <asp:Repeater ID="repVoordelen" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-6 wow fadeIn">
                                    <div class="title">
                                        <i class='<%# Eval("sSubTitle") %>'></i>
                                        <h3><%# Eval("sTitle") %></h3>
                                    </div>
                                    <p><%# Eval("sDescription") %></p>
                                </div>
                            </ItemTemplate>
                    </asp:Repeater>
                    </div>
                </div>
                <div class="col-sm-3 d-none-mobile wow fadeInRight">
                    <img src="/resources/img/desk.png" />
                </div>
            </div>
        </div>
    </section>

    <section class="about centered  wow fadeIn" id="functionaliteit">
        <div class="container">
            <asp:Literal ID="functionTitle" runat="server" />
        </div>
    </section>

    <section class="about-grid">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-10 offset-lg-1  wow fadeIn">
                    <div class="row">
                        <asp:Repeater ID="repFunctionaliteit" runat="server">
                            <ItemTemplate>
                                <div class="col-lg-4 col-sm-6">
                                     <div class="title">
                                        <i class='<%# Eval("sSubTitle") %>'></i>
                                        <h3><%# Eval("sTitle") %></h3>
                                    </div>
                                    <p><%# Eval("sDescription") %></p>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section-slide" id="#voorbeeld">
        <div class="slide-home  wow fadeIn">
           <asp:Repeater ID="repReferenties" runat="server">
                <ItemTemplate>
                    <div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm-5 offset-sm-1">
                                    <h4><%# Eval("sTitle") %></h4>
                                    <p><%# Eval("sDescription") %></p>
                                    
                                </div>
                                <div class="col-sm-4 offset-sm-1 wow fadeInRight">
                                    <img src="" alt="" id="imgDesktop" runat="server"  />
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

    <section class="extra" id="extra">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="title">Extra diensten</div>
                    <div class="row">
                        <asp:Repeater ID="repExtra" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-6  wow fadeIn">
                                    <div class="title">
                                        <h4><%# Eval("sTitle") %></h4>
                                    </div>
                                    <p><%# Eval("sDescription") %></p>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="prices" id="pakketten">
        <div class="container">
            <asp:Literal ID="PakkettenTitle" runat="server" />
            <div class="row  wow fadeIn">
                <asp:Repeater ID="repPakketten" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-4">
                            <div class="packages">
                                <div class="highlight">
                                    <b>Meest <br /> gekozen!</b>
                                </div>
                                <h2><%# Eval("sTitle") %></h2>
                                <h3>€ <%# Eval("sSubTitle") %> per maand</h3>
                                <a href='<%# "/bestel-uw-alfasite?pakket=" & Eval("sTitle") %>' class="btn-default" >Bestellen</a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="col-sm-12">
                    <table>
                        <tr>
                            <th></th>
                            <th>Basis</th>
                            <th>Plus</th>
                            <th>Extra</th>
                        </tr>
                        <asp:Repeater ID="repServices" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("sTitle") %></td>
                                    <td class="<%# Eval("sHtml1") %>"><span><%# Eval("sHtml1") %></span></td>
                                    <td class="<%# Eval("sHtml2") %>"><span><%# Eval("sHtml2") %></span></td>
                                    <td class="<%# Eval("sHtml3") %>"><span><%# Eval("sHtml3") %></span></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                <tr>
                                    <td></td>
                                    <td><a href="/bestel-uw-alfasite?pakket=Basis" class="btn-default">Bestellen</a></td>
                                    <td><a href="/bestel-uw-alfasite?pakket=Plus" class="btn-default">Bestellen</a></td>
                                    <td><a href="/bestel-uw-alfasite?pakket=Extra" class="btn-default">Bestellen</a></td>
                                </tr>
                            </FooterTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
        </div>
        
    </section>
</asp:Content>

