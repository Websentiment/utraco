<%@ Page Title="" Language="VB" MasterPageFile="~/page.master" AutoEventWireup="false" CodeFile="text.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="banner text-page-banner normal no-image">
        <div class="picture">
            <picture>
                <source id="ltlSrcMobiel" runat="server" srcset="" media="(max-width: 415px)">
                <source id="ltlSrcTablet" runat="server" srcset="" media="(max-width: 768px)">
                <asp:literal ID="ltlImgbanner" runat="server" />
            </picture>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1><asp:Literal ID="ltlTitle" runat="server" /></h1>
                </div>
            </div>
        </div>
    </section>

    <section class="textpage">
        <div class="container">
            <asp:Literal runat="server" ID="ltlText" />
        </div>
    </section>
</asp:Content>