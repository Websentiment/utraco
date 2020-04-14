<%@ Page Language="VB" AutoEventWireup="false" CodeFile="certificates.aspx.vb" MasterPageFile="~/page.master" Inherits="_ceritifcates" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCP8AOXuUJTgZDIKYoCUZd-bwBnkUApzEU"></script>
    <script src="/Resources/js/pages/products.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <section class="banner">
        <img class="productimg bright" src="resources//img/Utraco-Certificates.jpg" alt="Alternate Text" />
<%--         <picture>
                <source id="ltlSrcMobiel" runat="server" srcset="" media="(max-width: 415px)">
                <source id="ltlSrcTablet" runat="server" srcset="" media="(max-width: 768px)">
                <asp:literal ID="ltlImgbanner" runat="server"  />
            </picture>--%>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="producth1">
                        <asp:Literal ID="ltlTitle" runat="server" /></h1>
                </div>
            </div>
        </div>
    </section>
    <section class="usp gviemewidth">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <br />
                    <h3><asp:Literal ID="ltlSubTitle" runat="server" /></h3>
                </div>
               
                <div class="col-sm-6 offset-sm-3">
                    <br />
                    <asp:Literal ID="ltlText" runat="server" />
                </div>
                <ul class="ceritifcatesimageul">
                   <li><asp:Literal ID="ltlLogo1" runat="server" /></li>
                   <li><asp:Literal ID="ltlLogo2" runat="server" /></li>
                   <li><asp:Literal ID="ltlLogo3" runat="server" /></li>
                </ul>
            </div>
        </div>
        <br />
    </section>
    <br />
</asp:Content>
