<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Corporate.aspx.vb" MasterPageFile="~/page.master" Inherits="_Corporate" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="banner overlay _noFilter _spacing">
        <picture>
                <source id="ltlSrcMobiel" runat="server" srcset="" media="(max-width: 415px)">
                <source id="ltlSrcTablet" runat="server" srcset="" media="(max-width: 768px)">
                <asp:literal ID="ltlImgbanner" runat="server"  />
            </picture>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="_bannerTile">
                        <h1 class="contactcolor"><asp:Literal ID="ltlTitle" runat="server" /></h1>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="info mt-4">
        <div class="container">
            <div class="row">
                <div class="col-12 mb-4">
                    <div class="_infoTile">
                        <h2><asp:Literal ID="ltlInfoTitle" runat="server" /></h2>
                    </div>
                </div>
                
                <div class="col-sm-12">
             
                    <div class="_infoDescription">
                        <p><asp:Literal ID="ltlInfoDescription" runat="server" /></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
