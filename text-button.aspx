<%@ Page Title="" Language="VB" MasterPageFile="~/page.master" AutoEventWireup="false" CodeFile="text-button.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="banner normal no-image">
        <div class="container">
            <h1><asp:Literal ID="ltl01" runat="server" /></h1>
        </div>
    </section>
    <section class="landing">
        <div class="text" runat="server" >
            <div class="container">
                <asp:Literal ID="ltl02" runat="server" />
                <br />
                <a href="#" runat="server" id="aBestellen" class="btn-default">Bestel nu</a>
            </div>
        </div>
    </section>
</asp:Content>