<%@ Page Language="VB" MasterPageFile="~/page.Master" AutoEventWireup="false" CodeFile="Bevestiging.aspx.vb" Inherits="Bevestiging" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="banner normal">
        <div class="picture">
            <picture>
                <source id="ltlSrcMobiel" srcset="https://via.placeholder.com/420x1080" media="(max-width: 415px)">
                <source id="ltlSrcTablet" srcset="https://via.placeholder.com/768x1080" media="(max-width: 768px)">
                <img src="#" alt="#">
            </picture>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1>Uw bestelling</h1>
                </div>
            </div>
        </div>
    </section>

    <section class="order-confirmation">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="inner">
                        <div class="order-complete-message">
                            <asp:Literal ID="Success" Visible="false" runat="server" />
                            <asp:Literal ID="expired" Visible="false" runat="server" />
                            <asp:Literal ID="pending" Visible="false" runat="server" />
                            <asp:Literal ID="rekening" Visible="false" runat="server" />
                            <br />
                            <div class="heading"><asp:Literal ID="Literal2" Text="<%$ Resources:Resource, OrderNummerIs %>" runat="server" /> <asp:Literal ID="ltlFactuur" runat="server" /></div>
                        </div>

                        <div class="row row-eq-height bevestiging">
                            <div class="col-lg-4 col-sm-6">
                                <div class="inner">
                                    <div class="heading">Contactpersoon</div>
                                    <asp:Literal ID="ltlName" runat="server" /><br />
                                    <asp:Literal ID="ltlEmail" runat="server" /><br />
                                    <asp:Literal ID="ltlTelefoon" runat="server" /><br />
                                    <asp:Literal ID="ltlFactuuradres" runat="server" />
                                </div>
                            </div>

                            <div class="col-lg-4 col-sm-6">
                                <div class="inner">
                                    <div class="heading">Medereizigers</div>
                                    <asp:Repeater ID="repMedereizigers" runat="server">
                                        <ItemTemplate>
                                            <asp:Literal Text='<%# Eval("sAanhef") & " " & Eval("sTitel")%>' runat="server" /><br />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>

                            <div class="col-lg-4 col-sm-6">
                                <div class="inner">
                                    <div class="heading"><asp:Literal ID="Literal7" Text="Contactinformatie" runat="server" /></div>
                                    <asp:Literal ID="Contact" runat="server" />
                                </div>
                            </div>
                        </div>

                        <div runat="server" id="divAccount">
                            <p><asp:Literal ID="ltlInfo" runat="server" /></p>
                        </div>
                        <br />
                        <div class="row" runat="server" visible="false">
                            <div class="col-sm-6 offset-sm-3">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <a id="aAccount" runat="server" class="btn-default btn-white">
                                            <asp:Literal ID="Literal23" Text="<%$ Resources:Resource, MijnAccount %>" runat="server" />
                                            <div class="icon-wrapper">
                                                <i class="fas fa-arrow-right"></i>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-sm-6">
                                         <a id="aBestellingen" runat="server" class=" btn-default btn-orange">
                                            <asp:Literal ID="Literal1" Text="<%$ Resources:Resource, MijnBestellingen %>" runat="server" />
                                            <div class="icon-wrapper">
                                                <i class="fas fa-arrow-right"></i>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <asp:HiddenField ID="hidFacKopID" runat="server" />
</asp:Content>