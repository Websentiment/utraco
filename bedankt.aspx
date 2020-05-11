<%@ Page Title="" Language="VB" MasterPageFile="~/page.master" AutoEventWireup="false" CodeFile="bedankt.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="errors thanks">
        <div class="container">
            <div class="row ">
                <div class="col-sm-8 offset-sm-2">
                    <div class="content">
                        <asp:Literal ID="ltlBedankt" runat="server" />
                    </div>
                    <a href="/" class="btn-back"><asp:Literal runat="server" Text='<%$ Resources:Resource, bedanktTerug %>' /></a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>