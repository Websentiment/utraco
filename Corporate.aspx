<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" MasterPageFile="~/page.master" Inherits="_Default" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="banner overlay _noFilter _spacing">
        <picture>
                <source srcset="resources//img/Utraco-mobiel-corporate.jpg" media="(max-width: 415px)">
                <source srcset="resources//img/Utraco-tablet-corporate.jpg" media="(max-width: 768px)">
                <img src="resources//img/Utraco-desktop-corporate.jpg" class="img-responsive " >
            </picture>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="_bannerTile">
                        <h1  class="contactcolor">Corporate</h1>
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
                        <h3>Optimizing your supply chain</h3>
                    </div>
                </div>
               
                <div class="col-sm-12">
                    <div class="_infoDescription">
                        <p>
                            Utraco Holland B.V. organizes global chains and transport with efficient logistic solutions that enure reliable transfer of
                            product safety and integirty right to the point of delivery.
                            <br />
                            In cooperation with our logistics & warehousing partner, we van offer almost any packing you may require. small packages, drums,
                            large bags, bulk or even a producct in solution, all are possible!
                            <br />
                            Transport and storage of dangerous goods are controlled according to the applicable international rules and regulations,
                            ADR/RID, IATA and IMDG.
                            <br />
                            We offer door-to-door transport according to GDP regulations under temperature controlled conditions by road, by sea and by air.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
</asp:Content>
