<%@ Page Language="VB" AutoEventWireup="false" CodeFile="newMail.aspx.vb" Inherits="MailTemplates_Mail" %>

<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,500&display=swap" rel="stylesheet">
    <title>E-mail</title>
    <style>
        @media only screen and (max-width: 620px) {
            table[class=body] h1 {
                font-size: 28px !important;
                margin-bottom: 10px !important;
            }

            table[class=body] p,
            table[class=body] ul,
            table[class=body] ol,
            table[class=body] td,
            table[class=body] span,
            table[class=body] a {
                font-size: 16px !important;
            }

            table[class=body] .wrapper,
            table[class=body] .article {
                padding: 10px !important;
            }

            table[class=body] .content {
                padding: 0 !important;
            }

            table[class=body] .container {
                padding: 0 !important;
                width: 100% !important;
            }

            table[class=body] .main {
                border-left-width: 0 !important;
                border-radius: 0 !important;
                border-right-width: 0 !important;
            }

            table[class=body] .btn table {
                width: 100% !important;
            }

            table[class=body] .btn a {
                width: 100% !important;
            }

            table[class=body] .img-responsive {
                height: auto !important;
                max-width: 100% !important;
                width: auto !important;
            }
        }

        @media all {
            .ExternalClass {
                width: 100%;
            }

                .ExternalClass,
                .ExternalClass p,
                .ExternalClass span,
                .ExternalClass font,
                .ExternalClass td,
                .ExternalClass div {
                    line-height: 100%;
                }

            .apple-link a {
                color: inherit !important;
                font-family: inherit !important;
                font-size: inherit !important;
                font-weight: inherit !important;
                line-height: inherit !important;
                text-decoration: none !important;
            }

            .btn-primary table td:hover {
                background-color: #e66d02 !important;
            }

            .btn-primary a:hover {
                background-color: #e66d02 !important;
                border-color: #e66d02 !important;
            }
        }
    </style>
</head>
<body class="table" style="background-color: #f6f6f6; font-family: Poppins; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;">
    <table border="0" cellpadding="0" cellspacing="0" class="body" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f6f6f6; width: 100%;" width="100%" bgcolor="#f6f6f6">
        <tr>
            <td style="font-family: Poppins; font-size: 14px; vertical-align: top;" valign="top">&nbsp;</td>
            <td class="container" style="font-family: Poppins; font-size: 14px; vertical-align: top; display: block; max-width: 580px; padding: 10px; width: 580px; margin: 0 auto;" width="580" valign="top">
                <table style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;" width="100%">
                    <tr>
                        <td class="banner-wrap" style="font-family: Poppins; font-size: 14px; vertical-align: top; text-align: center;" valign="top">
                            <a id="aLogo" runat="server">
                                <img id="imgLogo" runat="server" src="#" alt="" class="banner" style="border: none; -ms-interpolation-mode: bicubic; max-width: 200px; width: 200px; margin-bottom: 20px;"></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="font-family: Poppins; font-size: 14px; vertical-align: top;" valign="top">&nbsp;</td>
            <td class="container" style="font-family: Poppins; font-size: 14px; vertical-align: top; display: block; max-width: 580px; padding: 10px; width: 580px; margin: 0 auto;" width="580" valign="top">
                <div class="content" style="box-sizing: border-box; display: block; margin: 0 auto; max-width: 580px; padding: 10px;">
                    <table class="main" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background: #ffffff; border-radius: 3px; width: 100%;" width="100%">
                        <!-- START CENTERED WHITE CONTAINER -->
                        <span class="preheader" style="color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;"></span>
                        <!-- START MAIN CONTENT AREA -->
                        <tr>
                            <td class="wrapper" style="font-family: Poppins; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;" valign="top">
                                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;" width="100%">
                                    <tr>
                                        <td style="font-family: Poppins; font-size: 14px; vertical-align: top;" valign="top">
                                            <p style="font-family: Poppins; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 20px;">
                                                AANVRAAGBEVESTIGING
                                            </p>
                                            <p style="font-family: Poppins; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;">
                                                Beste
                                                <asp:Literal ID="ltlName" runat="server" />,
                                            </p>
                                            Bedankt voor je aanvraag bij YourVisa!
                                            <br />
                                            Wij hebben onderstaande aanvraag met aanvraag ID <asp:Literal ID="ltlAanvraagID" runat="server" /> in goede orde ontvangen. 
                                            <br /><br />
                                            Hieronder tref je een overzicht van je bestelling:
                                            <br /><br />
                                            UW PERSOONSGEGEVENS
                                            <br />
                                            <table>
                                                <tr>
                                                    <td>Volledige naam</td>
                                                    <td><asp:Literal ID="ltlName2" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Telefoonnummer</td>
                                                    <td><asp:Literal ID="ltlTelefoon" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                    <td>E-mailadres</td>
                                                    <td><asp:Literal ID="ltlEmail" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Adres</td>
                                                    <td><asp:Literal ID="ltlAdres" runat="server" /></td>
                                                </tr>
                                            </table>
                                            <br />
                                            <br />
                                            <asp:Repeater ID="repMedereizigers" runat="server">
                                                <HeaderTemplate>
                                                    MEDEREIZIGERS
                                                    <br />
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                </HeaderTemplate>
                                                <ItemTemplate>                                                    
                                                    <tr>
                                                        <td>Volledige naam</td>
                                                        <td><asp:Literal Text='<%# Eval("sAanhef") & " " & Eval("sTitel")%>' runat="server" /></td>
                                                    </tr>                                                   
                                                    <tr>
                                                        <td>Geboortedatum</td>
                                                        <td><asp:Literal Text='<%# Eval("dtGeboorteDatum").ToString("dd MM yyyy")%>' runat="server" /></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            <asp:Repeater ID="repFacRgls" runat="server">
                                                <HeaderTemplate>
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                        <tr style="width: 100%;">
                                                            <td width="150" style="width: 40%; text-align: left; font-weight: 700; padding-right: 15px; max-width: 150px;">Artikel
                                                            </td>
                                                            <td style="width: 20%; text-align: left; font-weight: 700; padding-right: 15px;">Aantal
                                                            </td>
                                                            <td style="width: 40%; text-align: left; font-weight: 700; padding-right: 15px;">Totaal
                                                            </td>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr style="width: 100%;">
                                                        <td style="width: 50%;">
                                                            <asp:Literal ID="ltlNr" runat="server" /><asp:Literal Text='<%# Eval("sArtikel")%>' runat="server" /><br />
                                                        </td>
                                                        <td style="width: 20%; text-align: left; padding-right: 15px;" valign="top">
                                                            <asp:Literal Text='<%# CInt(Eval("iAantal")) %>' runat="server" />
                                                        </td>
                                                        <td style="width: 30%; text-align: left; padding-right: 15px;" valign="top">&euro;
                                            <asp:Literal Text='<%# Eval("iBedrag")%>' runat="server" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <tr style="width: 100%;">
                                                        <td style="width: 50%;">&nbsp;
                                                        </td>
                                                        <td style="width: 20%; text-align: left; padding-right: 15px;" valign="top"></td>
                                                        <td style="width: 30%; text-align: left; padding-right: 15px;" valign="top"></td>
                                                    </tr>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            <tr style="width: 100%;">
                                                <td style="width: 50%;"></td>
                                                <td style="width: 20%; text-align: left; padding-right: 15px; font-weight: 700;" valign="top">Totaal:
                                                </td>
                                                <td style="width: 30%; text-align: left; padding-right: 15px; font-weight: 700;" valign="top">&euro;
                                                    <asp:Literal ID="ltlTotaal" runat="server" />
                                                </td>
                                            </tr>
                                </table>
                                <br />
                                Indien u vragen heeft met betrekking tot uw aanvraag kunt u contact opnemen via onze <a href="https://visumaanvragenchina.nl">website</a>, of telefonisch via <a id="aTel" runat="server"><asp:Literal id="ltlTel" runat="server" /></a>.
                                <br />
                                <br />
                                Met vriendelijke groet,
                                <br />
                                <br />
                                e-visum China
                                <table border="0" cellpadding="0" cellspacing="0" class="btn btn-primary" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; box-sizing: border-box; width: 100%;" width="100%">
                                    <tbody>
                                        <tr>
                                            <td align="left" style="font-family: Poppins; font-size: 14px; vertical-align: top; padding-bottom: 15px;" valign="top">
                                                <%-- <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;">
                                  <tbody>
                                    <tr>
                                      <td style="font-family: Poppins; font-size: 14px; vertical-align: top; border-radius: 5px; text-align: center; background-color: #EC6707;" valign="top" align="center" bgcolor="#EC6707"> </td>
                                    </tr>
                                  </tbody>
                                </table>--%>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>

        <!-- END MAIN CONTENT AREA -->
    </table>

    <!-- START FOOTER -->
    <div class="footer" style="clear: both; margin-top: 10px; text-align: center; width: 100%;" align="center">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;" width="100%" align="center">
            <tr align="center">
                <td class="content-block" align="center" style="font-family: Poppins; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;" valign="top" align="center">
                    <span class="apple-link" style="color: #999999; font-size: 12px; text-align: center;">
                        <asp:Literal ID="ltlInfo" runat="server"></asp:Literal></span>
                </td>
            </tr>
            <tr align="center">
                <td class="content-block" style="font-family: Poppins; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;" valign="top" align="center">
                    <div class="social-icons" style="margin-top: 15px;">
                        <a href="#" id="aTwitter" runat="server" style="text-decoration: underline; color: #999999; font-size: 12px; text-align: center;">
                            <img id="imgTwitter" runat="server" src="#" class="social-icon" alt="" style="display: none; border: none; -ms-interpolation-mode: bicubic; max-width: 100%; width: 30px;" width="30"></a>
                        <a href="#" target="_blank" id="aFacebook" runat="server" style="text-decoration: underline; color: #00b4db; font-size: 12px; text-align: center;">
                            <img id="imgFacebook" runat="server" src="#" class="social-icon" alt="" style="border: none; -ms-interpolation-mode: bicubic; max-width: 100%; width: 30px; margin-right: 15px;" width="30"></a>
                        <a href="#" target="_blank" id="aInstagram" runat="server" style="text-decoration: underline; color: #00b4db; font-size: 12px; text-align: center;">
                            <img id="imgInstagram" runat="server" src="#" class="social-icon" alt="" style="border: none; -ms-interpolation-mode: bicubic; max-width: 100%; width: 30px; margin-right: 15px;" width="30"></a>
                        <a href="#" id="aGoogle" runat="server" style="text-decoration: underline; color: #999999; font-size: 12px; text-align: center;">
                            <img id="imgGoogle" runat="server" src="#" class="social-icon" alt="" style="display: none; border: none; -ms-interpolation-mode: bicubic; max-width: 100%; width: 30px;" width="30"></a>
                        <a href="#" id="aLinkedIn" runat="server" style="text-decoration: underline; color: #999999; font-size: 12px; text-align: center;">
                            <img id="imgLinkedIn" runat="server" src="#" class="social-icon" alt="" style="display: none; border: none; -ms-interpolation-mode: bicubic; max-width: 100%; width: 30px;" width="30"></a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <!-- END FOOTER -->

    <!-- END CENTERED WHITE CONTAINER -->
    </div>
        </td>
        <td style="font-family: Poppins; font-size: 14px; vertical-align: top;" valign="top">&nbsp;</td>
    </tr>
    </table>
</body>
</html>
