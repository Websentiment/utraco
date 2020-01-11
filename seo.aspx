<%@ Page Title="" Language="VB" MasterPageFile="~/page.master" AutoEventWireup="false" CodeFile="seo.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section class="seo">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumbs">
                        <asp:Literal ID="ltlBreadCrumps" runat="server" />    
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="text-wrapper">
                        <asp:Literal runat="server" ID="ltlText" />
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="wrapper">
                        <div class="item">
                            <a href="/contact" class="btn-seo">Contact</a>
                            <asp:Literal ID="ltlText1" runat="server" />
                        </div>
                        <div class="item img-responsive">
                            <asp:Literal ID="ltlImgAfbeelding" runat="server" />
                        </div>
                        <div class="item">
                            <asp:Literal ID="ltlText2" runat="server" />
                        </div>
                        <div class="item img-responsive">
                            <asp:Literal ID="ltlImgAfbeelding2" runat="server" />
                        </div>
                        <div class="item mobile-del">
                            <h3>Openingstijden</h3>
                            <table class="table table-condensed">
                                <tbody>
                                    <asp:Repeater ID="repOpeningstijden" runat="server">
                                        <ItemTemplate>
                                            <tr id="trDay" runat="server">
                                                <td><asp:Literal ID="ltlDayOfWeek" runat="server" Text='<%# Eval("iDayOfWeek") %>' /></td>
                                                <td><asp:Literal ID="ltlTijd" runat="server" /></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>