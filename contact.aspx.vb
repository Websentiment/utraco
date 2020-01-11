Partial Class _Contact
    Inherits BasePage
    Dim P As New clsPage
    Public sLanguage, sQs, sParentPage As String
    Dim iTaalID As Long

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If RouteData.Values("language") IsNot Nothing Then
            sLanguage = RouteData.Values("language").ToString().ToUpper
        Else
            sLanguage = sDefaultLanguage.ToUpper
        End If

        iTaalID = sTaalID(sLanguage)

        If Page.IsPostBack = False Then
            sQs = RouteData.Values("page").ToString()

            If RouteData.Values("parentpage") IsNot Nothing Then
                sParentPage = RouteData.Values("parentpage")
            End If

            Dim PI As New clsPageItems
            PI.sPI(Page, sLanguage, sQs, False, False, True, sParentPage)

            Dim PT As New clsPartijen
            Dim ADR As New clsAdressen
            Dim PartijGegevens As String = PT.sPartij(iPartijIDBeheerder)

            ADR.dt = ADR.sAdresByPartijIDAndType(iPartijIDBeheerder, "Bezoek")
            If ADR.dt.Rows.Count > 0 Then
                ADR.dr = ADR.dt.Rows(0)
                ltlStraat.Text = ADR.dr.Item("sStraat") & " " & ADR.dr.Item("sHuisNr") & ADR.dr.Item("sToev")
                astraat.HRef = PT.sGoogleAnalytics
                ltlPostcode.Text = ADR.dr.Item("sPostCode") & " " & ADR.dr.Item("sPlaats")
                aPostcode.HRef = astraat.HRef
            End If

            ltlBedrijfsnaam.Text = PT.sBedrijfsnaam
            ltlMail.Text = PT.sEmail
            aMail.HRef = "mailto:" & ltlMail.Text
            ltlTel.Text = PT.sTelefoon
            aTel.HRef = "tel:" & ltlTel.Text

            'sBreadcrumbs(ltlBreadCrumps)
        End If

    End Sub

    Public Sub btnSubmit1_Click(sender As Object, e As EventArgs) Handles btnSubmit1.Click
        If Page.RouteData.Values("language") IsNot Nothing Then
            sLanguage = Page.RouteData.Values("language").ToString().ToUpper
        Else
            sLanguage = sDefaultLanguage.ToUpper
        End If
        Try
            Dim RC As New clsRecaptcha
            Dim hidRecaptcha As HiddenField = Me.Master.FindControl("hidRecaptcha")
            Dim obj As reCAPTCHA.Response = RC.validate(hidRecaptcha.Value)
            If Not obj.success Then
                Exit Sub
            End If
        Catch ex As Exception
            Exit Sub
        End Try

        Dim U As New clsUtility

        'If txtLeeg.Text <> "" Then
        '    Exit Sub
        'End If

        iTaalID = sTaalID(sLanguage)
        Dim LI As New clsLijstItems
        LI.dt = LI.sLijstItemByTitleAndType("Contactformulier", iTaalID, "Mailing")
        If LI.dt.Rows.Count > 0 Then
            LI.dr = LI.dt.Rows(0)
            Dim sBericht As String = LI.dr.Item("sDescription")
            Dim email As String = LI.dr.Item("sItem1")
            sBericht = sBericht.Replace("[naam]", txtName.Text)
            sBericht = sBericht.Replace("[email]", txtEmail.Text)
            sBericht = sBericht.Replace("[tel]", txtPhone.Text)
            sBericht = sBericht.Replace("[soort]", ddlSoort.SelectedItem.Text)
            sBericht = sBericht.Replace("[bericht]", txtBericht.Text)
            sBericht = sBericht.Replace("[privacy]", Date.Now)

            Dim sType As String = LI.dr.Item("sTitle")
            Dim sVan As String = LI.dr.Item("sItem5").replace("[email]", email)
            Dim sNaar As String = LI.dr.Item("sItem2").replace("[email]", email)
            Dim sCC As String = LI.dr.Item("sItem1").replace("[email]", email)
            Dim sBCC As String = LI.dr.Item("sItem4").replace("[email]", email)
            Dim sOnderwerp As String = LI.dr.Item("sSubTitle").replace("[email]", email)
            Dim sBijlagen As String = ""
            Dim sInfo As String = txtName.Text

            Dim M As New clsMail
            Dim sTemplate As String = M.sHtml("~/EmailTemplates/Mail.aspx")
            sTemplate = sTemplate.Replace("[subject]", sOnderwerp)
            sTemplate = sTemplate.Replace("[body]", sBericht)

            Dim iMailID As Long = M.iscMail(0, iPartijIDBeheerder, "versturen", sType, "", sVan, sNaar, sCC, sBCC, sOnderwerp, sTemplate, sBijlagen, "", sInfo, Now)

            LI.dt = LI.sLijstItemByTitleAndType("Contactformulier bevestiging", iTaalID, "Mailing")
            If LI.dt.Rows.Count > 0 Then
                LI.dr = LI.dt.Rows(0)
                sBericht = LI.dr.Item("sDescription")
                email = LI.dr.Item("sItem1")
                sBericht = sBericht.Replace("[naam]", txtName.Text)

                sType = LI.dr.Item("sTitle")
                sVan = LI.dr.Item("sItem5").replace("[email]", email)
                sNaar = txtEmail.Text
                sCC = LI.dr.Item("sItem1").replace("[email]", email)
                sBCC = LI.dr.Item("sItem4").replace("[email]", email)
                sOnderwerp = LI.dr.Item("sSubTitle").replace("[email]", email)
                sBijlagen = ""
                sInfo = U.Name.ToString

                Dim sTemplate1 As String = M.sHtml("~/EmailTemplates/Mail.aspx")
                sTemplate1 = sTemplate1.Replace("[subject]", sOnderwerp)
                sTemplate1 = sTemplate1.Replace("[body]", sBericht)

                iMailID = M.iscMail(0, iPartijIDBeheerder, "versturen", sType, "", sVan, sNaar, sCC, sBCC, sOnderwerp, sTemplate1, sBijlagen, "", sInfo, Now)

                'Follow Cookie
                Dim cCookie As HttpCookie = Request.Cookies("Follow")
                If cCookie IsNot Nothing Then
                    Dim sSessie As Sessie = Newtonsoft.Json.JsonConvert.DeserializeObject(Of Sessies)(cCookie.Value).seSessies(0)
                    sSessie.save(iPartijIDBeheerder, txtEmail.Text, "Contact")
                End If
                'Follow Cookie

                Response.Redirect(P.sPageUrlByGuid(sLanguage, "6373546f-97ae-4dac-be7d-ee46100c5fb7"))
            Else

            End If
        End If
    End Sub


End Class