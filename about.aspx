<%@ Page Title="" Language="VB" MasterPageFile="~/page.master" AutoEventWireup="false" CodeFile="about.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="banner normal no-image">
        <div class="container">
            <h1><asp:Literal ID="ltl01" runat="server" /></h1>
        </div>
    </section>
    <section class="landing">
        <div class="contactform" runat="server" visible="false">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-sm-5 img-fluid">
                        <img src="https://via.placeholder.com/1000x1000" />
                    </div>

                    <div class="col-sm-6 offset-sm-1">
                        <div class="ml-form-embed" data-account="1698512:q9p1p9q3t2" data-form="1551862:k9r7z2"> </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="text" runat="server" >
            <div class="container">
                <asp:Literal ID="ltl02" runat="server" />
            </div>
        </div>

        <div class="reviews" runat="server" visible="false">
            <div class="container">
                <div class="title">
                    <asp:Literal ID="ltlReviewstitle" runat="server" />
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        <div class="item">
                            <div class="img">
                                <img src="https://via.placeholder.com/1000x1000" />
                            </div>
                            <div class="content">
                                <div class="name">
                                    <b>Samantha James</b>
                                    Company and position
                                </div>
                                <p>
                                    Donec id elit non mi porta gravida at eget metus.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="item">
                            <div class="img">
                                <img src="https://via.placeholder.com/1000x1000" />
                            </div>
                            <div class="content">
                                <div class="name">
                                    <b>Samantha James</b>
                                    Company and position
                                </div>
                                <p>
                                    Donec id elit non mi porta gravida at eget metus.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="item">
                            <div class="img">
                                <img src="https://via.placeholder.com/1000x1000" />
                            </div>
                            <div class="content">
                                <div class="name">
                                    <b>Samantha James</b>
                                    Company and position
                                </div>
                                <p>
                                    Donec id elit non mi porta gravida at eget metus.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="about-landing" runat="server" visible="false">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 offset-sm-2">
                        <div class="title">
                            <asp:Literal ID="ltAbouttitle" runat="server" />
                        </div>

                        <div class="img-fluid">
                            <img src="https://via.placeholder.com/1000x500" />
                        </div>

                         <asp:Literal ID="ltAboutText" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>