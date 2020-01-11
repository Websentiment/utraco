﻿<%@ Page Title="" Language="VB" MasterPageFile="~/page.master" AutoEventWireup="false" CodeFile="text.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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