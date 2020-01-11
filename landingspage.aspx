<%@ Page Title="" Language="VB" MasterPageFile="~/page.master" AutoEventWireup="false" CodeFile="landingspage.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
<!-- MailerLite Universal -->
<script>
    (function (m, a, i, l, e, r) {
    m['MailerLiteObject'] = e; function f() {
        var c = { a: arguments, q: [] }; var r = this.push(c); return "number" != typeof r ? r : f.bind(c.q);
    }
        f.q = f.q || []; m[e] = m[e] || f.bind(f.q); m[e].q = m[e].q || f.q; r = a.createElement(i);
        var _ = a.getElementsByTagName(i)[0]; r.async = 1; r.src = l + '?v' + (~~(new Date().getTime() / 1000000));
        _.parentNode.insertBefore(r, _);
    })(window, document, 'script', 'https://static.mailerlite.com/js/universal.js', 'ml');

    var ml_account = ml('accounts', '1698512', 'q9p1p9q3t2', 'load');
</script>
<!-- End MailerLite Universal -->
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="banner normal no-image">
        <div class="container">
            <h1><asp:Literal ID="ltlTitle" runat="server" /></h1>
        </div>
    </section>

    <section class="landing">
        <div class="contactform" id="form">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-sm-5 img-fluid">
                        <img src="/Resources/img/e-book.png" />
                    </div>

                    <div class="col-sm-6 offset-sm-1">
                        <a href="javascript:;" onclick="ml_account('webforms', '1552156', 'y3d9v4', 'show')" class="btn-default btn-centered">
                         Ja, ik download het boek
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="text">
            <div class="container">
                <asp:Literal ID="ltlText01" runat="server" />
            </div>
        </div>

        <div class="reviews">
            <div class="container">
                <div class="title">
                    <asp:Literal ID="ltlReviewstitle" runat="server" />
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        <div class="item">
<%--                            <div class="img">
                                <img src="https://via.placeholder.com/1000x1000" />
                            </div>--%>
                            <div class="content">
                                <div class="name">
                                    <b>Lotte</b>
                                    Tilburg
                                </div>
                                <p>
                                    “Wietze, ik heb het inzicht gekregen dat ik niet zichtbaar hoef te zijn voor heel Nederland, maar slechts in Tilburg. Dat scheel ons heel veel marketingkosten.” 
                                </p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-4">
                        <div class="item">
<%--                            <div class="img">
                                <img src="https://via.placeholder.com/1000x1000" />
                            </div>--%>
                            <div class="content">
                                <div class="name">
                                    <b>Thijs</b>
                                     Groningen
                                </div>
                                <p>
                                    Helder geschreven en het is mij duidelijk: iederen zijn vak.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="item">
<%--                            <div class="img">
                                <img src="https://via.placeholder.com/1000x1000" />
                            </div>--%>
                            <div class="content">
                                <div class="name">
                                    <b>Daan</b>
                                    Utrecht
                                </div>
                                <p>
                                  “Dat mensen meer en meer op hun mobiel doen zie ik elke dag in ons restaurant. Ze kijken meer op hun mobiel dan naar elkaar. Ook laten ze vaak de reservering zien op hun mobiel.”
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="about-landing">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 offset-sm-2">
                        <div class="title">
                            <asp:Literal ID="ltAbouttitle" runat="server" />
                        </div>

                        <div class="img-fluid">
                            <img src="/resources/img/WietzedeVries.jpeg" />
                        </div>

                         <asp:Literal ID="ltAboutText" runat="server" />
                       <a href="javascript:;" onclick="ml_account('webforms', '1552156', 'y3d9v4', 'show')" class="btn-default">
                            Ja, ik download het boek
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>