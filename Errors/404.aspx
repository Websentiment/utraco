<%@ Page Language="VB" MasterPageFile="~/Errors/Error.Master" AutoEventWireup="false" CodeFile="404.aspx.vb" Inherits="Registreren" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
        <h4>404 - Pagina niet gevonden.</h4>
        <p>Het lijkt alsof u een pagina probeert te bereiken die (niet meer) bestaat.</p>
        <a href="/" class="btn-default ">
            Klik hier voor de Homepage
        </a>
        <a href="/" class="btn-default ">
            Hier voor het Gratis E-book
        </a>
        <a href="/" class="btn-default ">
            Hier om direct uw Alfasite te bestellen
        </a>
        <br /><br />
        <p>Heeft u een vraag maak dan gebruik van het <a href="/contact">contactformulier</a> of bel met telefoonnummer: <a href="tel:061465477">06-14654775</a>.</p>
    </div>
</asp:Content>