<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ceritifcates.aspx.vb" MasterPageFile="~/page.master" Inherits="_ceritifcates" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCP8AOXuUJTgZDIKYoCUZd-bwBnkUApzEU"></script>
    <script src="/Resources/js/pages/products.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <section class="banner">
        <img class="productimg" src="resources//img/Utraco-Certificates.jpg" alt="Alternate Text" />
<%--         <picture>
                <source id="ltlSrcMobiel" runat="server" srcset="" media="(max-width: 415px)">
                <source id="ltlSrcTablet" runat="server" srcset="" media="(max-width: 768px)">
                <asp:literal ID="ltlImgbanner" runat="server"  />
            </picture>--%>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="producth1">Ceritifcates</h1>
                </div>
            </div>
        </div>
    </section>
    <section class="usp gviemewidth">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <br />
                    <h3>Our ceritifcates</h3>
                </div>
               
                <div class="col-sm-6 offset-sm-3">
                     <br />
                    <p>
                       Lorem ipsum is een opvultekst die drukkers, zetters,
                        grafisch ontwerpers en dergelijken gebruiken om te kijken hoe een opmaak er grafisch uitziet.
                        De eerste woorden van de tekst luiden doorgaans
                    </p>
                    <br />
                    <a href="#">Click on the logo's below for more information.</a>
                </div>
                <ul class="ceritifcatesimageul">
                   <li> <img class="ceritifcatesimage" src="resources//img/ISO9001 4KL Nederlands Certificatie Kantoor (NCK).JPG" alt="Alternate Text" /></li>
                   <li> <img class="ceritifcatesimage" src="resources//img/ISO9001 4KL Nederlands Certificatie Kantoor (NCK).JPG" alt="Alternate Text" /></li>
                   <li> <img class="ceritifcatesimage" src="resources//img/ISO9001 4KL Nederlands Certificatie Kantoor (NCK).JPG" alt="Alternate Text" /></li>
                </ul>
            </div>
        </div>
        <br />
    </section>
    <br />
</asp:Content>
