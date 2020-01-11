<%@ Page Title="" Language="VB" MasterPageFile="~/page.master" AutoEventWireup="false" CodeFile="merken.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="full-width">
        <asp:Literal ID="ltlImgMerken" runat="server"></asp:Literal>
    </section>
    <asp:Repeater runat="server" ID="repMerken">
        <ItemTemplate>
            <section class="brand" id="merkItem" runat="server">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <span class="img"><img id="merkImg" src="" alt="" runat="server"/></span>
                            <p><%# Eval("sDescription") %></p>
                            <a target="_blank" href='<%# Eval("sItem1") %>'><%# Eval("sColor") %></a>
                        </div>
                    </div>
                </div>
            </section>
        </ItemTemplate>
    </asp:Repeater>

    <section class="gallery">
        <div id="instafeed" class="items responsive-image divSlickGallery"></div>
    </section>
    
        <%--<section class="brand">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <span class="img"><img src="/Resources/img/logo.png" /></span>
                        <p>
                            Postia cum laut hit. millacitio. Nam ipsam con cumet esed quossin nos magnatur alignient doluptatiur ma conseni magnamus eveniandis estemodit lab idebistrum
                            voluptatis namusandita inu Postia cum laut hit. millacitio. Nam ipsam con cumet esed qucumet esed quossin nos magnatur alignient doluptatiur ma
                            conseni magnamus eveniandis estemodit lab idebistrum voluptatis namusandita inu

                        </p>
                        <a href="#">www.mesoestetic.com</a>
                    </div>
                </div>
            </div>
        </section>--%>
        
</asp:Content>