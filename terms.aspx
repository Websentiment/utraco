<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/page.master" CodeFile="terms.aspx.vb" Inherits="_Default" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script src="/Resources/js/pages/terms.js"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="banner normal no-image">
        <div class="picture">
            <picture>
                <source id="ltlSrcMobiel" srcset="https://via.placeholder.com/420x1080" media="(max-width: 415px)">
                <source id="ltlSrcTablet" srcset="https://via.placeholder.com/768x1080" media="(max-width: 768px)">
                <img src="#" alt="">
            </picture>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1>Algemene voorwaarden</h1>
                </div>
            </div>
        </div>
    </section>

    <div class="terms" >
        <div class="container-fluid ">
            <div class="row">
                <div class="col-md-3">
                    <div class="list divScrollSpyList">
                        <ul class="list-group">
                            <asp:Repeater ID="repTermsScrollSpy" runat="server">
                                <ItemTemplate>
                                    <li class="list-group-item">
                                        <a class="smooth-scroll" href="#item<%# Container.ItemIndex %>">
                                            <span class="list-title"><asp:Literal Text='<%# Eval("sTitle")%>' runat="server" /></span>
                                            <asp:Literal runat="server" Text='<%# Eval("sSubTitle") %>' />
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
                <div class="col-md-8">
                    <asp:Repeater ID="repTerms" runat="server">
                        <ItemTemplate>
                            <div class="terms_section " id="item<%# Container.ItemIndex %>">
                                <h4>
                                    <asp:Literal Text='<%# Eval("sTitle")%>' runat="server" />
                                    <asp:Literal runat="server" Text='<%# Eval("sSubTitle") %>' />
                                </h4>
                                <p>
                                    <asp:Literal Text='<%# Eval("sDescription")%>' runat="server" />
                                </p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
