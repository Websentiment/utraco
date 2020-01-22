<%@ Page Title="" Language="VB" MasterPageFile="~/page.master" AutoEventWireup="false" CodeFile="aanbieding.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="banner normal no-image">
        <div class="container">
            <h1><asp:Literal ID="ltl01" runat="server" /></h1>
        </div>
    </section>
    <section class="landing">
        <div class="text" runat="server" >
            <div class="container">
                <asp:Literal ID="ltl02" runat="server" />
                
            </div>
        </div>
    </section>

    <section class="package-detail white">
        <div class="container">
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
                                <asp:Button runat="server" UseSubmitBehavior="false" OnClientClick="return isBestellingValid();" ID="btnSubmit" type="button" Text="Rond uw bestelling af" class="btn-default full-width" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>