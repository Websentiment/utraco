
Imports System.Data

Partial Class _Default
    Inherits BasePage
    Dim IMG As New clsImages
    Dim LI As New clsLijstItems
    Dim MOLLIE As New clsMollie
    Dim PI As New clsPageItems
    Dim iTaalID As Long
    Public sLanguage, URL, sQs, sParentPage As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        URL = RouteData.Values("url")
        Dim list As String = "Pakket" ' Lijst met lijstitems
        Dim responseBack As String = "/"

        If sLanguage Is Nothing Then
            sLanguage = "NL"
        Else
            sLanguage = RouteData.Values("language")
        End If

        iTaalID = sTaalID(sLanguage)

        If Page.IsPostBack = False Then
            sQs = RouteData.Values("page").ToString()


            If Request.QueryString("pakket") IsNot Nothing Then
                Dim sPakket As String = Request.QueryString("pakket").ToLower
                Dim item As ListItem

                item = rblPakket.Items.FindByValue(sPakket)
                If item IsNot Nothing Then
                    item.Selected = True
                End If
            Else
                Dim item As ListItem
                item = rblPakket.Items.FindByValue("plus")
                item.Selected = True
            End If



            If RouteData.Values("parentpage") IsNot Nothing Then
                sParentPage = RouteData.Values("parentpage")
            End If

            PI.sPI(Page, sLanguage, sQs, False, False, True, sParentPage)

            'LI.dt = LI.sLIByTypeAndTaal("Pakket", iTaalID, iPartijIDBeheerder, False)
            'If LI.dt.Rows.Count > 0 Then
            '    repPakketten.DataSource = LI.dt
            '    repPakketten.DataBind()
            'End If
        End If


        'tooltipDomein.Attributes.Add("data-original-title", PI.scPageItem(sLanguage, "pakketten", "domeinLtl", iPartijID))
        'tooltipEmail.Attributes.Add("data-original-title", PI.scPageItem(sLanguage, "pakketten", "emailLtl", iPartijID))
        'tooltipStock.Attributes.Add("data-original-title", PI.scPageItem(sLanguage, "pakketten", "stockLtl", iPartijID))
        'tooltipContract.Attributes.Add("data-original-title", PI.scPageItem(sLanguage, "pakketten", "contractLtl", iPartijID))

        'tooltipFotografie.Attributes.Add("data-original-title", PI.scPageItem(sLanguage, "pakketten", "fotografieLtl", iPartijID))
        'tooltipVideo.Attributes.Add("data-original-title", PI.scPageItem(sLanguage, "pakketten", "bedrijfsvideoLtl", iPartijID))
        'tooltipHuisstijl.Attributes.Add("data-original-title", PI.scPageItem(sLanguage, "pakketten", "huisstijlLtl", iPartijID))
        'tooltipSEO.Attributes.Add("data-original-title", PI.scPageItem(sLanguage, "pakketten", "SEOLtl", iPartijID))

        'lblFotoKost.Attributes.Add("title", PI.scPageItem(sLanguage, "pakketten", "fotografieKosten", iPartijID))
        'fotografieKost.Text = PI.scPageItem(sLanguage, "pakketten", "fotografieKosten", iPartijID)

        'lblVideoKost.Attributes.Add("title", PI.scPageItem(sLanguage, "pakketten", "videoKosten", iPartijID))
        'videoKost.Text = PI.scPageItem(sLanguage, "pakketten", "videoKosten", iPartijID)

        'lblHuisstijl.Attributes.Add("title", PI.scPageItem(sLanguage, "pakketten", "huisstijlKosten", iPartijID))
        'huisstijlKost.Text = PI.scPageItem(sLanguage, "pakketten", "huisstijlKosten", iPartijID)

        'lblSeo.Attributes.Add("title", PI.scPageItem(sLanguage, "pakketten", "seoKosten", iPartijID))
        'seoKost.Text = PI.scPageItem(sLanguage, "pakketten", "seoKosten", iPartijID)

        MOLLIE.ListIssuers(ddlBank)
        ddlBank.Items(0).Selected = True


        Dim iLijstItemID As Long = 0

        LI.dt = LI.sLijstItemByID(iLijstItemID)
        If LI.dt.Rows.Count > 0 Then
            LI.dr = LI.dt.Rows(0)

            'ltlTitleBlog.Text = LI.dr.Item("sTitle")
            'ltlHtml1.Text = LI.dr.Item("sHtml1")

            'HIER VERDER MEER VARIABELEN VULLEN VANUIT LI.dr.Item("<>")

            Title = LI.dr.Item("sPageTitle")
            MetaDescription = LI.dr.Item("sPageDescription")
            MetaKeywords = LI.dr.Item("sKeywords")

            'IMG.dt = IMG.sImageByIDAndSoort(iLijstItemID, "Header", sType)
            'If IMG.dt.Rows.Count > 0 Then
            '    IMG.dr = IMG.dt.Rows(0)
            '    'imgThumb.Src = IMG.dr.Item("sSmall").Replace("~/", sDomain)
            '    'imgThumb.Alt = IMG.dr.Item("sData")
            '    ltlImgHeader.Text = "<img src='" & IMG.dr.Item("sSmall").Replace("~/", sDomain) & "' alt='" & IMG.dr.Item("sData") & "' />"
            'End If

            Dim og_Image, og_Sitename, og_Description, og_url, og_Title, og_Type As New HtmlMeta
            Dim U As New clsUtility

            'Facebook afbeelding
            'IMG.dt = IMG.sImageByIDAndSoort(iLijstItemID, "Facebook", sType)
            'If IMG.dt.Rows.Count > 0 Then
            '    IMG.dr = IMG.dt.Rows(0)
            '    og_Image.Attributes.Add("property", "og:image")
            '    og_Image.Content = IMG.dr.Item("sSmall").Replace("~/", sDomain)
            '    Page.Header.Controls.Add(og_Image)
            'End If

            'FB title
            og_Title.Attributes.Add("property", "og:title")
            og_Title.Content = LI.dr.Item("sPageTitle")
            Page.Title = LI.dr.Item("sPageTitle")
            Page.Header.Controls.Add(og_Title)

            'FB description
            og_Description.Attributes.Add("property", "og:description")
            og_Description.Content = LI.dr.Item("sPageDescription")
            Page.Header.Controls.Add(og_Description)

            'FB type
            og_Type.Attributes.Add("property", "og:type")
            og_Type.Content = "website"
            Page.Header.Controls.Add(og_Type)

            'FB URL
            og_url.Attributes.Add("property", "og:url")
            og_url.Content = Page.Request.Url.ToString()
            Page.Header.Controls.Add(og_url)

            'FB site name
            og_Sitename.Attributes.Add("property", "og:site_name")
            og_Sitename.Content = U.Config("URL")
            Page.Header.Controls.Add(og_Sitename)
        Else
            'Response.Redirect(responseBack)
        End If
    End Sub

    Public iCount As Long = 0
    'Protected Sub repPakketten_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles repPakketten.ItemDataBound
    '    If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
    '        Dim rb As HtmlInputRadioButton = e.Item.FindControl("rb")
    '        rb.ID = "rb" & DataBinder.Eval(e.Item.DataItem, "iLijstItemID")
    '        If iCount = 0 Then
    '            hidArtikel.Value = DataBinder.Eval(e.Item.DataItem, "sTitle") 'standaard waarde 
    '        End If
    '        iCount = iCount + 1

    '        If DataBinder.Eval(e.Item.DataItem, "sTitle").ToString.ToLower = URL Then
    '            rb.Checked = True
    '        End If
    '    End If
    'End Sub

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

        msg = msg.Replace("[pakket]", rblPakket.SelectedValue)
        msg = msg.Replace("[aantalemail]", ddlEmail.SelectedItem.Text)
        msg = msg.Replace("[fotos]", rblFoto.SelectedItem.Text)
        msg = msg.Replace("[contract]", rblContract.SelectedItem.Text)

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
        Dim sOnderwerp1 As String = dr.Item("sSubTitle")

        Dim sTemplate1 As String = M.sHtml("~/EmailTemplates/Mail.aspx")
        sTemplate1 = sTemplate1.Replace("[subject]", sOnderwerp1)
        sTemplate1 = sTemplate1.Replace("[body]", msg)
        Dim iMailID As Long = M.iscMail(0, iPartijIDBeheerder, "versturen", dr.Item("sTitle"), "", txtEmail.Text, dr.Item("sItem2"), "", "", sOnderwerp1, sTemplate1, "", "", sName, Now)

        dt.Clear()
        dt = LI.sLijstItemByTitleAndType("Bestelling_naar_klant", iTaalID, "Mailing")
        dr = dt.Rows(0)

        msg = dr.Item("sDescription")
        sName = ddlAanhef.SelectedItem.Text & " " & txtVoornaam.Text & " " & txtAchternaam.Text

        msg = msg.Replace("[pakket]", rblPakket.SelectedValue)
        msg = msg.Replace("[aantalemail]", ddlEmail.SelectedItem.Text)
        msg = msg.Replace("[fotos]", rblFoto.SelectedItem.Text)
        msg = msg.Replace("[contract]", rblContract.SelectedItem.Text)

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

        txtVoornaam.Text = ""
        txtAchternaam.Text = ""
        txtEmail.Text = ""
        'txtPostcode.Text = ""
        'txtHuisnr.Text = ""
        'txtAdres.Text = ""
        txtTelefoon.Text = ""
        txtCompany.Text = ""
        txtRekeninghouder.Text = ""
        txtIban.Text = ""

        ltlBedankt.Text = dr.Item("sItem3")
        hdfModalStatus.Value = "1"
    End Sub

End Class