Imports System.Data
Partial Class _Default
    Inherits BasePage
    Public sLanguage, sQs, sParentPage As String
    Dim iTaalID As Long

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If RouteData.Values("language") IsNot Nothing Then
            sLanguage = RouteData.Values("language").ToString().ToUpper
        Else
            sLanguage = sDefaultLanguage.ToUpper
        End If

        'iTaalID = sTaalID(sLanguage)

        If Page.IsPostBack = False Then
            sQs = RouteData.Values("page").ToString()

            If RouteData.Values("parentpage") IsNot Nothing Then
                sParentPage = RouteData.Values("parentpage")
            End If

            Dim PI As New clsPageItems

            PI.sPI(Page, sLanguage, sQs, False, False, True, sParentPage)

            Dim P As New clsPage
            'Dim sType As String = Request.QueryString("from")
            'Select Case sType
            '    Case "contact"
            '        ltlBContact.Visible = True
            '    Case "booking"
            '        ltlBBooking.Visible = True
            '    Case "apply"
            '        ltlBApply.Visible = True
            '    Case "apply-escort"
            '        ltlBApplyEscort.Visible = True
            '    Case Else
            'End Select
        End If
    End Sub

    Public Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim U As New clsUtility

        ltlBestelInfo.Text = ""
        Dim V As New clsValidatie
        If V.VerplichtTextBox(txtVoornaam) = False Then
            ltlBestelInfo.Text = "Voer s.v.p. uw naam in."
            Exit Sub
        End If
        If V.VerplichtTextBox(txtAchternaam) = False Then
            ltlBestelInfo.Text = "Voer s.v.p. uw naam in."
            Exit Sub
        End If
        'If V.VerplichtTextBox(txtHuisnr) = False Then
        '    ltlBestelInfo.Text = "Voer s.v.p. uw huisnummer in."
        '    Exit Sub
        'End If
        'If V.VerplichtTextBox(txtAdres) = False Then
        '    ltlBestelInfo.Text = "Voer s.v.p. uw adres in."
        '    Exit Sub
        'End If
        If V.VerplichtTextBox(txtTelefoon) = False Then
            ltlBestelInfo.Text = "Voer s.v.p. uw telefoonnummer in."
            Exit Sub
        End If
        If V.VerplichtEmail(txtEmail) = False Then
            ltlBestelInfo.Text = "Voer s.v.p. uw e-mailadres in."
            Exit Sub
        End If
        If V.VerplichtTextBox(txtCompany) = False Then
            ltlBestelInfo.Text = "Voer s.v.p. uw bedrijfsnaam in."
            Exit Sub
        End If
        'If V.VerplichtTextBox(txtRekeninghouder) = False Then
        '    ltlBestelInfo.Text = "Voer s.v.p. de naam van de rekeninghouder in."
        '    Exit Sub
        'End If
        'If V.VerplichtTextBox(txtIban) = False Then
        '    ltlBestelInfo.Text = "Voer s.v.p. uw IBAN Nummer in."
        '    Exit Sub
        'End If


        'Dim EenmaligeKosten As String = "250.00"

        'If txtKorting.Text IsNot "" Then
        '    If txtKorting.Text <> "QRSCXID232019" Then
        '        ltlBestelInfo.Text = "Kortingscode is niet geldig"
        '        Exit Sub
        '    Else
        '        EenmaligeKosten = "250.00"
        '    End If
        'End If

        Dim M As New clsMail
        Dim LI As New clsLijstItems
        Dim dt As New DataTable

        Dim iTaalID As Long = sTaalID(sLanguage)
        dt = LI.sLijstItemByTitleAndType("Bestelling", iTaalID, "Mailing")
        Dim dr As DataRow
        dr = dt.Rows(0)

        Dim msg As String = dr.Item("sDescription")
        Dim sName As String = ddlAanhef.SelectedItem.Text & " " & txtVoornaam.Text & " " & txtAchternaam.Text

        msg = msg.Replace("[naam]", sName)
        msg = msg.Replace("[email]", txtEmail.Text)
        'msg = msg.Replace("[postcode]", txtPostcode.Text)
        'msg = msg.Replace("[huisnummer]", txtHuisnr.Text)
        'msg = msg.Replace("[adres]", txtAdres.Text)
        msg = msg.Replace("[telefoon]", txtTelefoon.Text)
        msg = msg.Replace("[bedrijfsnaam]", txtCompany.Text)
        'msg = msg.Replace("[rekeninghouder]", txtRekeninghouder.Text)
        'msg = msg.Replace("[iban]", txtIban.Text)
        'msg = msg.Replace("[incasso]", chkbListAkkoordIncasso.SelectedItem.Text)

        'msg = msg.Replace("[fotografie]", rblFotografie.SelectedItem.Text)
        'msg = msg.Replace("[video]", rblVideo.SelectedItem.Text)
        'msg = msg.Replace("[huisstijl]", rblHuisstijl.SelectedItem.Text)
        'msg = msg.Replace("[SEO]", rblSEO.SelectedItem.Text)
        Dim sOnderwerp1 As String = dr.Item("sSubTitle") & " - aanbieding"

        Dim sTemplate1 As String = M.sHtml("~/EmailTemplates/Mail.aspx")
        sTemplate1 = sTemplate1.Replace("[subject]", sOnderwerp1)
        sTemplate1 = sTemplate1.Replace("[body]", msg)
        Dim iMailID As Long = M.iscMail(0, iPartijIDBeheerder, "versturen", dr.Item("sTitle"), "", txtEmail.Text, dr.Item("sItem2"), "", "", sOnderwerp1, sTemplate1, "", "", sName, Now)

        dt.Clear()
        dt = LI.sLijstItemByTitleAndType("Bestelling_naar_klant", iTaalID, "Mailing")
        dr = dt.Rows(0)

        msg = dr.Item("sDescription")
        sName = ddlAanhef.SelectedItem.Text & " " & txtVoornaam.Text & " " & txtAchternaam.Text

        'msg = msg.Replace("[pakket]", rblPakket.SelectedValue)
        'msg = msg.Replace("[aantalemail]", ddlEmail.SelectedItem.Text)
        'msg = msg.Replace("[fotos]", rblFoto.SelectedItem.Text)
        'msg = msg.Replace("[contract]", rblContract.SelectedItem.Text)

        msg = msg.Replace("[naam]", sName)
        msg = msg.Replace("[email]", txtEmail.Text)
        'msg = msg.Replace("[postcode]", txtPostcode.Text)
        'msg = msg.Replace("[huisnummer]", txtHuisnr.Text)
        'msg = msg.Replace("[adres]", txtAdres.Text)
        msg = msg.Replace("[telefoon]", txtTelefoon.Text)
        msg = msg.Replace("[bedrijfsnaam]", txtCompany.Text)
        msg = msg.Replace("[rekeninghouder]", txtRekeninghouder.Text)
        'msg = msg.Replace("[iban]", txtIban.Text)
        'msg = msg.Replace("[incasso]", chkbListAkkoordIncasso.SelectedItem.Text)

        'msg = msg.Replace("[fotografie]", rblFotografie.SelectedItem.Text)
        'msg = msg.Replace("[video]", rblVideo.SelectedItem.Text)
        'msg = msg.Replace("[huisstijl]", rblHuisstijl.SelectedItem.Text)
        'msg = msg.Replace("[SEO]", rblSEO.SelectedItem.Text)

        Dim sOnderwerp As String = dr.Item("sSubTitle")

        Dim sTemplate As String = M.sHtml("~/EmailTemplates/Mail.aspx")
        sTemplate = sTemplate.Replace("[subject]", sOnderwerp)
        sTemplate = sTemplate.Replace("[body]", msg)

        Dim iMailID2 As Long = M.iscMail(0, iPartijIDBeheerder, "versturen", dr.Item("sTitle"), "", dr.Item("sItem5"), txtEmail.Text, "", "", sOnderwerp, sTemplate, "", "", "Alfasite", Now)

        'Dim JaarlijkseKosten As String

        'Select Case hidArtikel.Value.ToString.ToLower
        '    Case "basis"
        '        JaarlijkseKosten = "250.00"
        '    Case "plus"
        '        JaarlijkseKosten = "300.00"
        '    Case "extra"
        '        JaarlijkseKosten = "350.00"
        'End Select

        'Dim sPaymentURL As String = ""
        'Dim sResponsePage As String = "/bevestiging"
        'sPaymentURL = MOLLIE.CreatePayment(JaarlijkseKosten, "NL", sResponsePage, "Opstartkosten Webappwinkel", 0, iMailID, 0, "ideal", ddlBank.SelectedValue, "", iMailID2)
        'Session("sPaymentID") = MOLLIE.sPaymentID
        'Response.Redirect(sPaymentURL)

        Dim P As New clsPage
        Response.Redirect(P.sPageUrlByGuid(sLanguage, "23cb39f0-2386-4bd6-8460-1239f9225158"))
    End Sub
End Class
