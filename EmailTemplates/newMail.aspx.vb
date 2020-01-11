
Partial Class MailTemplates_Mail
    Inherits System.Web.UI.Page


    Dim BP As New BasePage
    Dim iTaalID As Long = 0
    Public sURL As String
    Dim sLanguage As String = BP.sDefaultLanguage.ToUpper

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim U As New clsUtility
        sURL = U.URL()

        Dim iFacKopID As Long = 0

        If Request.QueryString("lang") IsNot Nothing Then
            sLanguage = Request.QueryString("lang").ToString().ToUpper
        End If
        If Request.QueryString("iFacKopID") IsNot Nothing Then
            iFacKopID = Request.QueryString("iFacKopID")
        End If
        If Request.QueryString("iTaalID") IsNot Nothing Then
            iTaalID = Request.QueryString("iTaalID")
        End If
        Dim PI As New clsPageItems
        PI.sPI(Page, sLanguage, "Algemeen", True, False, False)

        Dim PT As New clsPartijen
        'Partij gegevens ophalen
        PT.sPartij(BP.iPartijIDBeheerder)
        '    Dim sUrl As String = BP.sURL()
        '  Dim P As New clsPage
        ltlInfo.Text = PT.sPartijGegevens
        ltlTel.Text = "+31 (0)76 581 6597"
        aTel.HRef = "tel:" & ltlTel.Text
        'img1.Src = PT.sLogo.Replace("~/", U.Config("UrlCms"))
        '  imgLogo2.Src = imgLogo.Src
        'aWebsite.HRef = PT.sWebsite
        'aWebsite.InnerHtml = PT.sBedrijfsnaam

        Dim FK As New clsFacKop
        FK.dt = FK.sFacKopAndOrderByFacKopID(iFacKopID)
        If FK.dt.Rows.Count > 0 Then
            FK.dr = FK.dt.Rows(0)
            ltlTotaal.Text = FK.dr("iFactuurBedrag")
            ltlAanvraagID.Text = FK.dr("sOrdernummer")
        End If

        Dim FR As New clsFacRgl
        Dim PERS As New clsPersonen
        FR.dt = FR.sFacRglsByFacKopID(iFacKopID)
        If FR.dt.Rows.Count > 0 Then
            FR.dr = FR.dt.Rows(0)
            ltlName.Text = FR.dr("sTitel")
            ltlName2.Text = ltlName.Text
            ltlTelefoon.Text = FR.dr("sTelefoon")
            ltlEmail.Text = FR.dr("sEmail")
            ltlAdres.Text = FR.dr("sStraat") & " " & FR.dr("sHuisNr") & ", " & FR.dr("sPostcode") & " " & FR.dr("sPlaats")

            repFacRgls.DataSource = FR.dt
            repFacRgls.DataBind()
        Else
            repFacRgls.Visible = False
        End If

        'TemplateHeader.Style.Add("background-image", sUrl & "Uploads/Editor/background.jpg")
        imgLogo.Src = sURL & "/Uploads/Editor/logo-mail.png"
        aLogo.HRef = sURL

        If PT.sTwitter = "" Then
            aTwitter.Visible = False
        Else
            aTwitter.HRef = PT.sTwitter
            imgTwitter.Src = sURL & "\Resources\img\sm\twitter.png"
        End If

        If PT.sFacebook = "" Then
            aFacebook.Visible = False
        Else
            aFacebook.HRef = PT.sFacebook
            imgFacebook.Src = sURL & "\Resources\img\sm\facebook.png"
        End If

        If PT.sInstagram = "" Then
            aInstagram.Visible = False
        Else
            aInstagram.HRef = PT.sInstagram
            imgInstagram.Src = sURL & "\Resources\img\sm\instagram.png"
        End If

        If PT.sGoogle = "" Then
            aGoogle.Visible = False
        Else
            aGoogle.HRef = PT.sGoogle
            imgGoogle.Src = sURL & "\Resources\img\sm\google.png"
        End If

        If PT.sLinkedIn = "" Then
            aLinkedIn.Visible = False
        Else
            aLinkedIn.HRef = PT.sLinkedIn
            imgLinkedIn.Src = sURL & "\Resources\img\sm\linkedin.png"
        End If

    End Sub

    Dim ROUTE As New clsRoutes
    Dim IMG As New clsImages
    Private Sub repFacRgls_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles repFacRgls.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem Or e.Item.ItemType = ListItemType.Item Then
            Dim iArtikelID As Long = DataBinder.Eval(e.Item.DataItem, "iArtikelID")
            Dim aLink As HtmlAnchor = e.Item.FindControl("aLink")
            'ROUTE.dt = ROUTE.sRoutes("artikel", iArtikelID, iTaalID)
            'If ROUTE.dt.Rows.Count > 0 Then
            '    ROUTE.dr = ROUTE.dt.Rows(0)
            '    aLink.HRef = ROUTE.dr.Item("sURL").ToString().Replace("~/", BP.sURL() & "/")
            'Else
            '    aLink.HRef = "#"
            'End If
            IMG.dt = IMG.sImageByTussTypeAndID("Artikel", iArtikelID)
            If IMG.dt.Rows.Count > 0 Then
                For Each IMG.dr In IMG.dt.Rows
                    Select Case IMG.dr.Item("sSoort").ToString().ToLower()
                        Case "foto"
                            Dim imgThumb As HtmlImage = e.Item.FindControl("imgThumb")
                            imgThumb.Src = IMG.dr.Item("sSmall").replace("~/", BP.sURL())
                            imgThumb.Alt = IMG.dr.Item("sData")
                    End Select
                Next
            End If
        End If
    End Sub
End Class