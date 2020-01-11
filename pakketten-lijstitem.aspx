<%@ Page Language="VB" EnableViewState="false" AutoEventWireup="false" CodeFile="pakketten-lijstitem.aspx.vb" MasterPageFile="~/page.master" Inherits="_Default" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
<%--    <script type="text/javascript" src='<%: Scripts.Url("~/bundles/pakket-JS") %>'></script>   --%>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="banner normal no-image">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                  <asp:Literal ID="ltl01" runat="server" /><br />
                </div>
            </div>
        </div>
    </section>

    <section class="package-detail">
        <div class="container">
            <div class="row packagelist">
                <div class="col-12">
                    <asp:Literal ID="ltl02" runat="server" />
                     <asp:RadioButtonList id="rblPakket" runat="server" RepeatDirection="Horizontal" CssClass="packages">
                        <asp:ListItem value="basis" >
                            <div class="title">Basis</div>
                            <div class="mailing">geen e-mailadressen</div>
                            <div class="pricing">€ 24,95 per maand</div>
                        </asp:ListItem>
                        <asp:ListItem value="plus"  >
                            <div class="title">Plus</div>
                            <div class="mailing">3 e-mailadressen</div>
                            <div class="pricing">€ 39,95 per maand</div>
                            <div class="highlight">
                                <b>Meest <br /> gekozen!</b>
                            </div>
                        </asp:ListItem>
                         <asp:ListItem value="extra">
                            <div class="title">Extra</div>
                            <div class="mailing">10 e-mailadressen</div>
                            <div class="pricing">€ 59,95 per maand</div>
                        </asp:ListItem>
                     </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 offset-sm-3"  runat="server" visible="false">
                    <div class="options">
                        <label for="rblDomein">Heeft u al een domeinnaam geregistreerd?</label> <div class="tooltip-toggle" data-toggle="tooltip" data-placement="top" tooltip-trigger="click focus" id="tooltipDomein" runat="server"><i class="fa fa-info-circle" aria-hidden="true"></i></div>
                        <div class="form-group">
                            <asp:RadioButtonList ID="rblDomein" CssClass="radio" repeatDirection="Horizontal" runat="server">
                                <asp:ListItem Selected="True" Text="Ja"></asp:ListItem>
                                <asp:ListItem Text="Nee"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="options"  runat="server" visible="false">
                        <label for="ddlEmail">Hoeveel e-mailadressen heeft u nodig?</label> <div class="tooltip-toggle" data-toggle="tooltip" data-placement="top" tooltip-trigger="click focus" id="tooltipEmail" runat="server"><i class="fa fa-info-circle" aria-hidden="true"></i></div>
                            <div class="form-group">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlEmail">
                                    <asp:ListItem Value="0" Text="geen"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                    <asp:ListItem Value="6" Text="6"></asp:ListItem>
                                    <asp:ListItem Value="7" Text="7"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                    <asp:ListItem Value="9" Text="9"></asp:ListItem>
                                    <asp:ListItem Value="10" Text="10 of meer"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                    </div>
                    <div class="options"  runat="server" visible="false">
                        <label for="rblFoto">Heeft u stock foto's nodig?</label> <div class="tooltip-toggle" data-toggle="tooltip" data-placement="top" tooltip-trigger="click focus" id="tooltipStock" runat="server" ><i class="fa fa-info-circle" aria-hidden="true"></i></div>
                            <div class="form-group">
                                <asp:RadioButtonList ID="rblFoto" CssClass="radio" repeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Selected="True" Text="Ja"></asp:ListItem>
                                    <asp:ListItem Text="Nee"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                    </div>
                    <div class="options"  runat="server" visible="false">
                        <label for="rblContract">Kies uw contractduur</label> <div class="tooltip-toggle" data-toggle="tooltip" data-placement="top" tooltip-trigger="click focus" id="tooltipContract" runat="server" ><i class="fa fa-info-circle" aria-hidden="true"></i></div>
                            <div class="form-group">
                                <asp:RadioButtonList ID="rblContract" CssClass="radio listed" repeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Value="1" Text="1 jaar" Selected="True"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                    </div>
                    <div class="options" runat="server" visible="false">
                         <label for="rblContract">Kortingscode</label>
                            <div class="form-group">
                            <asp:TextBox ID="txtKorting" runat="server" CssClass="form-control" Placeholder="Kortingscode" />
                        </div>
                    </div>
                    <div class="row" runat="server" visible="false">
                        <div class="col-sm-12">
                            <h3 class="centered pink">Extra diensten</h3>
                        </div>

                        <div class="col-sm-12">
                            <label for="rblFotografie">Fotografie € <asp:Literal runat="server" ID="fotografieKosten" />,-</label> <div class="tooltip-toggle" data-toggle="tooltip" id="tooltipFotografie" runat="server" data-placement="top" tooltip-trigger="click focus"><i class="fa fa-info-circle" aria-hidden="true"></i></div>
                            <div class="form-group">
                                <asp:RadioButtonList ID="rblFotografie" CssClass="radio" RepeatLayout="UnorderedList" runat="server">
                                    <asp:ListItem Text="Ja"></asp:ListItem>
                                    <asp:ListItem Selected="True" Text="Nee"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="col-sm-12">
                            <label for="rblVideo">Bedrijfsvideo € <asp:Literal runat="server" ID="videoKosten" />,-</label> <div class="tooltip-toggle" data-toggle="tooltip" id="tooltipVideo" runat="server" data-placement="top" tooltip-trigger="click focus"><i class="fa fa-info-circle" aria-hidden="true"></i></div>
                            <div class="form-group">
                                <asp:RadioButtonList ID="rblVideo" CssClass="checkbox" RepeatLayout="UnorderedList" runat="server">
                                    <asp:ListItem Text="Ja"></asp:ListItem>
                                    <asp:ListItem Selected="True" Text="Nee"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="col-sm-12">
                            <label for="rblHuisstijl">Huisstijl € <asp:Literal runat="server" ID="huisstijlKosten" />,-</label> <div class="tooltip-toggle" data-toggle="tooltip" id="tooltipHuisstijl" runat="server" data-placement="top" tooltip-trigger="click focus"><i class="fa fa-info-circle" aria-hidden="true"></i></div>
                            <div class="form-group">
                                <asp:RadioButtonList ID="rblHuisstijl" CssClass="checkbox" RepeatLayout="UnorderedList" runat="server">
                                    <asp:ListItem Text="Ja"></asp:ListItem>
                                    <asp:ListItem Selected="True" Text="Nee"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="col-sm-12">
                            <label for="rblSEO">SEO zoekwoorden onderzoek € <asp:Literal runat="server" ID="seoKosten" />,-</label> <div class="tooltip-toggle" data-toggle="tooltip" id="tooltipSEO" runat="server" data-placement="top" tooltip-trigger="click focus"><i class="fa fa-info-circle" aria-hidden="true"></i></div>
                            <div class="form-group">
                                <asp:RadioButtonList ID="rblSEO" CssClass="checkbox" RepeatLayout="UnorderedList" runat="server">
                                    <asp:ListItem Text="Ja"></asp:ListItem>
                                    <asp:ListItem Selected="True" Text="Nee"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                </div>
<%--                <div class="col-sm-6 offset-sm-1">
                    <h3 class="centered">Overzicht</h3>
                    <hr />
                    <div class="row">
                        <div class="col-6">
                            <label id="preview-pakket"></label>
                        </div>
                        <div class="col-6 right">
                            <label id="preview-price"></label>
                        </div>
                    </div>
                    
                    <div class="row inbegrepen-email">
                        <div class="col-6">
                            <label id="preview-inbegrepen"></label>
                        </div>
                        <div class="col-6 right">
                            <label id="preview-inbegrepen-aantal">inbegrepen</label>
                        </div>
                    </div>
                    
                    <div class="row gekozen-email">
                        <div class="col-6">
                            <label id="preview-gekozen"></label><label> extra e-mailadressen</label>
                        </div>
                        <div class="col-6 right">
                            <label id="preview-gekozen-price"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label id="preview-stock">Stock foto's</label>
                        </div>
                        <div class="col-6 right">
                            <label id="preivew-stock-choice"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Contractduur</label>
                        </div>
                        <div class="col-6 right">
                            <label id="preivew-contract-choice"></label>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-6">
                            <label>Totaal maandelijks</label>
                        </div>
                        <div class="col-6 right">
                            <label id="preivew-total"></label>
                        </div>
                    </div>
                            <hr />
                </div>--%>
            </div>
            <div class="row">
                <div class="col-sm-10 offset-sm-1">
                    <div class="contactform">
                        <h2 class="centered pink">Uw gegevens</h2>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control" Placeholder="Bedrijfsnaam" />
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" runat="server" ID="ddlAanhef">
                                        <asp:ListItem Text="Dhr."></asp:ListItem>
                                        <asp:ListItem Text="Mevr."></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                 <div class="form-group">
                                    <asp:TextBox ID="txtVoornaam" runat="server" CssClass="form-control" Placeholder="Voornaam" />
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtAchternaam" runat="server" CssClass="form-control" Placeholder="Achternaam" />
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtTelefoon" onkeypress="return isGetal(event.which);" runat="server" CssClass="form-control" Placeholder="Telefoonnummer" />
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="form-control" Placeholder="E-mailadres" />
                                </div>
                            </div>
                            <div class="col-sm-6" runat="server" visible="false">
                                 <div class="form-group">
                                    <asp:TextBox ID="txtRekeninghouder" runat="server" CssClass="form-control" Placeholder="Rekeninghouder" />
                                </div>
                            </div>
                            <div class="col-sm-6" runat="server" visible="false">
                                <div class="form-group">
                                    <asp:TextBox ID="txtIban" runat="server" CssClass="form-control" Placeholder="IBAN Nummer" />
                                </div>
                            </div>
                            <div class="col-12" >
                                <div class="form-group" runat="server" visible="false">
                                    <asp:checkboxList ID="chkbListAkkoordIncasso" CssClass="checkbox listed" RepeatLayout="UnorderedList" runat="server">
                                        <asp:ListItem Text="Ik ga akkoord met automatische incasso"></asp:ListItem>
                                    </asp:checkboxList>
                                </div>

                                <div class="form-group">
                                     <div class="checkbox">
                                        <asp:CheckBox runat="server" ID="cbPrivacy" value="check" />
                                        <label for="cbPrivacy">Ja, ik ga akkoord met de <a href="/privacyverklaring" target="_blank">Privacyverklaring.</a></label>
                                    </div>
                                </div>

                                <div class="form-group"  runat="server" visible="false">
                                    <asp:DropDownList ID="ddlBank" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                </div>

                                <asp:Literal ID="ltlBestelInfo" runat="server" />
                                <asp:Button runat="server" UseSubmitBehavior="false" OnClientClick="return isBestellingValid();" ID="btnSubmit" type="button" Text="Rond je bestelling af" class="btn-default full-width" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="portfolio-modal modal fade" id="modalBedankt" tabindex="-1" role="dialog" aria-hidden="true"  runat="server" visible="false">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <i class="fa fa-times fa-3x fa-fw"></i>
            </div>
            <div class="modal-body">
                <asp:Literal ID="ltlBedankt" runat="server" />
                <button type="button" class="border-button-black" data-dismiss="modal">Sluiten</button>
            </div>
        </div>
    </div>

    <asp:HiddenField runat="server" ID="hdfModalStatus" Value="" />
    <asp:HiddenField ID="hidArtikel" runat="server" />

    <div class="modal fade" id="incassoModal" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="incassoModalLabel"  runat="server" visible="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <asp:Literal runat="server" ID="modalTitle" />
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <asp:Literal runat="server" ID="modalTekst" />

                            Uw naam: <span class="rekeninghouder"></span><br />
                            IBAN: <span class="iban"></span><br />
                            Ondertekenaar voor machtiging bankrekening: <span class="naam"></span><br />
                            Datum: <span class="datum"></span> <br /><br />

                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <asp:checkboxList ID="chkbListAkkoordIncasso2" CssClass="checkbox listed" RepeatLayout="UnorderedList" runat="server">
                                    <asp:ListItem Text="Ik bevestig dat bovenstaande gegevens correct zijn ingevuld en dat ik gemachtigde ondertekenaar ben voor de bovenstaand geregistreerde bankrekening. Ik machtig Alfasite om bovenstaand geregistreerde bankrekeningnummer te gebruiken voor afschrijving van kosten. Ik ga ermee akkoord dat ik minimaal vijf dagen van te voren een factuur ontvang van Webapp Winkel waarop de kosten van de betreffende maand worden weergegeven."></asp:ListItem>
                                </asp:checkboxList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="return isAkkoordValid();">Akkoord</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>