
Partial Class _Default
    Inherits BasePage
    Dim LI As New clsLijstItems
    Dim IMG As New clsImages
    Public sLanguage, sQs, sParentPage As String
    Dim iTaalID As Long
    Dim bIsOnline As Boolean = False

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

            Dim P As New clsPage
            'aContact.HRef = P.sPageUrlByGuid(sLanguage, "5724127d-b971-4318-b12c-4b92482fee60")
            'aRequest.HRef = P.sPageUrlByGuid(sLanguage, "f6a7b79e-b9ff-4470-ae8d-3bb029eafadd")

            'aAanvragen.HRef = P.sPageUrlByGuid(sLanguage, "33350da8-7b25-4fec-b66a-29ff2bda8286")
            'aAanvragen2.HRef = aAanvragen.HRef

            'LI.dt = LI.sLIByTypeAndTaal("Services", iTaalID, iPartijIDBeheerder, False)
            'If LI.dt.Rows.Count > 0 Then
            '    repServices.DataSource = LI.dt
            '    repServices.DataBind()
            'End If


            'bIsOnline = IsOnline()
            'ST.InitWebshopSettings(iPartijIDBeheerder)

            Dim L As New clsLanden
            'L.dt = L.sLanden(iPartijIDBeheerder)

            'ddlBestemming.DataSource = L.dt
            'ddlBestemming.DataTextField = "sLand"
            'ddlBestemming.DataValueField = "iLandID"
            'ddlBestemming.DataBind()
            'ddlBestemming.Items.Insert(0, New ListItem("Maak uw keuze...", 0))

            'ddlNat.DataSource = L.dt
            'ddlNat.DataTextField = "sLand"
            'ddlNat.DataValueField = "iLandID"
            'ddlNat.DataBind()
            'ddlNat.Items.Insert(0, New ListItem("Maak uw keuze...", 0))



        End If
    End Sub

    'Private Sub btnAanvraag_Click(sender As Object, e As EventArgs) Handles btnAanvraag.Click
    '    Session("SessionAanvraag") = New Dictionary(Of String, Object) From {
    '        {"sReden", ddlReden.SelectedValue},
    '        {"iNat", ddlNat.SelectedValue},
    '        {"iBestemming", ddlBestemming.SelectedValue}
    '    }

    '    Dim P As New clsPage
    '    Response.Redirect(P.sPageUrlByGuid(sLanguage, "f6a7b79e-b9ff-4470-ae8d-3bb029eafadd"))
    'End Sub

    'Private Sub repCategories_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles repCategories.ItemDataBound
    '    If e.Item.ItemType = ListItemType.AlternatingItem Or e.Item.ItemType = ListItemType.Item Then
    '        Dim iCatID As Long = DataBinder.Eval(e.Item.DataItem, "iCatID")
    '        Dim repArtikelen As Repeater = e.Item.FindControl("repArtikelen")


    '        ART.dt = ART.sArtikelenAndRoutesByCategorie(iTaalID, iCatID, 3)
    '        repArtikelen.DataSource = ART.dt
    '        repArtikelen.DataBind()

    '    End If
    'End Sub

    'Protected Sub repArtikelenFeatured_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles repArtikelenFeatured.ItemDataBound
    '    If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then

    '        Dim iArtikelID As Long = DataBinder.Eval(e.Item.DataItem, "iArtikelID")
    '        'Afbeelding tonen
    '        IMG.dt = IMG.sImageByTussTypeAndID("Artikel", iArtikelID)
    '        Dim imgThumb As HtmlImage = e.Item.FindControl("imgThumb")
    '        If IMG.dt.Rows.Count > 0 Then
    '            For Each IMG.dr In IMG.dt.Rows
    '                Select Case IMG.dr.Item("sSoort").ToString().ToLower()
    '                    Case "thumb"
    '                        imgThumb.Src = IMG.dr.Item("sSmall").replace("~/", sURL())
    '                        imgThumb.Alt = IMG.dr.Item("sData")
    '                End Select
    '            Next
    '        Else
    '            imgThumb.Src = sURL() & "UI/images/placehold-small.jpg"
    '        End If

    '        Dim AI As New clsArtikelItems
    '        AI.dt = AI.sArtikelItemsByArtikelID(iArtikelID, iTaalID)
    '        Dim sName As String = ""
    '        If AI.dt.Rows.Count > 0 Then
    '            For Each AI.dr In AI.dt.Rows
    '                Select Case AI.dr.Item("sType").toLower
    '                    Case "naam"
    '                        Dim ltlName As Literal = e.Item.FindControl("ltlName")
    '                        ltlName.Text = AI.dr.Item("sWaarde")
    '                        sName = AI.dr.Item("sWaarde")

    '                End Select
    '            Next
    '        End If


    '        ROUTE.dt = ROUTE.sRoutes("artikel", iArtikelID, iTaalID)
    '        If ROUTE.dt.Rows.Count > 0 Then
    '            ROUTE.dr = ROUTE.dt.Rows(0)
    '            Dim aFollow As HtmlAnchor = e.Item.FindControl("aFollow")
    '            aFollow.HRef = ROUTE.dr.Item("sURL")

    '        End If
    '        'Voorraad controle
    '        If ST.bVoorraad Then
    '            Dim AV As New clsArtikelVarianten
    '            AV.dt = AV.sArtikelVariantenBeschikbaar(iArtikelID)
    '            Dim spVoorraadInfo As HtmlGenericControl = e.Item.FindControl("spVoorraadInfo")
    '            Dim bWinkelwagen As Boolean = True
    '            If AV.dt.Rows.Count > 0 Then
    '                AV.dr = AV.dt.Rows(0)
    '                Dim iBeschikbaar As Integer = AV.scBeschikbaar(AV.dr.Item("iArtikelVariantID"))
    '                If iBeschikbaar > 0 Then
    '                    spVoorraadInfo.Visible = False
    '                Else
    '                    spVoorraadInfo.Visible = True
    '                    spVoorraadInfo.InnerHtml = "<span style='color:#f00;'>SOLD OUT</span>"
    '                End If
    '            Else
    '                spVoorraadInfo.Visible = True
    '                spVoorraadInfo.InnerHtml = "<span style='color:#e12c2c;'>SOLD OUT</span>"
    '            End If
    '        End If


    '        Dim dKorting As Decimal = CDec(DataBinder.Eval(e.Item.DataItem, "sKorting").ToString().Replace(".", ","))
    '        Dim dPrijs As Decimal = DataBinder.Eval(e.Item.DataItem, "iPrijs")

    '        'Korting tonen ja / nee
    '        If dKorting <> 0 Then
    '            Dim ltlNewPrice As Literal = e.Item.FindControl("ltlNewPrice")
    '            ltlNewPrice.Text = "&euro;" & dPrijs - dKorting
    '            'e.Item.FindControl("divDiscount").Visible = True
    '            e.Item.FindControl("spanPrice").Visible = True
    '            Dim spPrice As HtmlGenericControl = e.Item.FindControl("spPrice")
    '            spPrice.Attributes.Add("class", "price old-price")
    '        Else

    '            'e.Item.FindControl("divDiscount").Visible = False
    '            e.Item.FindControl("spanPrice").Visible = False
    '        End If
    '    End If
    'End Sub

    'Private Sub repCategories_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles repCategories.ItemDataBound
    '    If e.Item.ItemType = ListItemType.AlternatingItem Or e.Item.ItemType = ListItemType.Item Then

    '        Dim iCatID As Long = DataBinder.Eval(e.Item.DataItem, "iCatID")
    '        ROUTE.dt = ROUTE.sRoutes("Categorie", iCatID, iTaalID)
    '        If ROUTE.dt.Rows.Count > 0 Then
    '            ROUTE.dr = ROUTE.dt.Rows(0)
    '            Dim aLink As HtmlAnchor = e.Item.FindControl("aLink")
    '            aLink.HRef = ROUTE.dr.Item("sURL")

    '        End If
    '    End If
    'End Sub
    'Private Sub repSlider_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles repSlider.ItemDataBound
    '    If e.Item.ItemType = ListItemType.AlternatingItem Or e.Item.ItemType = ListItemType.Item Then
    '        Dim iLijstItemID As Long = DataBinder.Eval(e.Item.DataItem, "iLijstItemID")
    '        IMG.dt = IMG.sImageByTussTypeAndID("Slider", iLijstItemID)
    '        Dim bMobile As Boolean = False

    '        If IMG.dt.Rows.Count > 0 Then
    '            IMG.dr = IMG.dt.Rows(0)
    '            Dim imgDesktop As HtmlImage = e.Item.FindControl("imgDesktop")
    '            imgDesktop.Src = IMG.dr.Item("sSmall").Replace("~/", sURL())
    '            imgDesktop.Alt = IMG.dr.Item("sData")
    '        Else
    '            e.Item.Visible = False
    '        End If
    '    End If
    'End Sub



    'Dim sCurrentURL As String = sURL()
    'Protected Sub repSliderCategories_ItemDataBound(sender As Object, e As RepeaterItemEventArgs)
    '    If e.Item.ItemType = ListItemType.AlternatingItem Or e.Item.ItemType = ListItemType.Item Then
    '        Dim iCategorieID As Long = DataBinder.Eval(e.Item.DataItem, "iCatID")
    '        ROUTE.dt = ROUTE.sRoutes("categorie", iCategorieID, iTaalID)
    '        If ROUTE.dt.Rows.Count > 0 Then
    '            ROUTE.dr = ROUTE.dt.Rows(0)
    '            Dim aArtikelLink As HtmlAnchor = e.Item.FindControl("aCategoryLink")
    '            aArtikelLink.HRef = ROUTE.dr.Item("sURL")
    '        End If

    '        'Afbeelding tonen
    '        IMG.dt = IMG.sImageByTussTypeAndID("Categorie", iCategorieID)
    '        Dim iIndex As Long = 0
    '        Dim imgCategorieThumb As HtmlImage = e.Item.FindControl("imgCategorieThumb")
    '        If imgCategorieThumb IsNot Nothing Then
    '            If IMG.dt.Rows.Count > 0 Then
    '                For Each IMG.dr In IMG.dt.Rows
    '                    Select Case IMG.dr.Item("sSoort").ToString().ToLower()
    '                        Case "thumb"
    '                            If iIndex = 0 Then
    '                                imgCategorieThumb.Src = IMG.dr.Item("sSmall").replace("~/", sCurrentURL)
    '                                imgCategorieThumb.Alt = IMG.dr.Item("sData")
    '                                iIndex = iIndex + 1
    '                            End If
    '                    End Select
    '                Next
    '            Else
    '                imgCategorieThumb.Src = sCurrentURL & "UI/images/placehold-small.jpg"
    '            End If
    '        End If
    '    End If
    'End Sub
    'Protected Sub repReviews_ItemDataBound(sender As Object, e As RepeaterItemEventArgs)
    '    If e.Item.ItemType = ListItemType.AlternatingItem Or e.Item.ItemType = ListItemType.Item Then
    '        Dim dtDatum As Date = DataBinder.Eval(e.Item.DataItem, "dtDatum")
    '        Dim ltlDatum As Literal = e.Item.FindControl("ltlDatum")

    '        Dim sDate As String() = dtDatum.ToString("dd-MM-yyyy").Split("-")
    '        sDate(1) = MonthName(sDate(1))

    '        ltlDatum.Text = sDate(0) + " " + sDate(1) + " " + sDate(2)
    '    End If
    'End Sub

End Class