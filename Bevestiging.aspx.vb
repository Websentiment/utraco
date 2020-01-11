Imports System.Globalization
Imports System.Web.Services
Imports System.Web.Routing
Imports System.Data

Partial Class Bevestiging
    Inherits BasePage

    Dim LOG As New clsLog
    Dim UTIL As New clsUtility
    Dim PI As New clsPageItems
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
            Dim iFacKopID As String = RouteData.Values("ifackopid")
            If iFacKopID = Nothing Then
                Exit Sub
            End If
            'If iFacKopID = "rekening" Then
            '    rekening.Visible = True
            '    Exit Sub
            'End If

            If IsOnline() = False Then
                divAccount.Visible = False
            End If

            'Dim FACITEMS As New clsFacItems
            'FACITEMS.sFacItems(iFacKopID)
            'If FACITEMS.sTimestamp <> RouteData.Values("timestamp") Then
            '    Response.Redirect("~/")
            'End If

            hidFacKopID.Value = iFacKopID
            Dim FACKOP As New clsFacKop
            Dim BP As New BasePage
            FACKOP.dt = FACKOP.sFacKopByFacKopID(iFacKopID, BP.iPartijIDBeheerder)
            If FACKOP.dt.Rows.Count > 0 Then
                FACKOP.dr = FACKOP.dt.Rows(0)
                ltlFactuur.Text = FACKOP.dr.Item("sFactuur")
                'ltlBezorgadres.Text = FACKOP.dr.Item("sVerzendGegevens").Replace(Environment.NewLine, "<br/>")
                'ltlFactuuradres.Text = FACKOP.dr.Item("sPartijGegevens").Replace(Environment.NewLine, "<br/>")
                'tr_4MQ5VgBzSf

                Dim FR As New clsFacRgl
                'FR.dt = FR.sFacRglsByFacKopID(iFacKopID)
                If FR.dt.Rows.Count > 0 Then
                    FR.dr = FR.dt.Rows(0)
                    ltlName.Text = FR.dr("sTitel")
                    'ltlName2.Text = ltlName.Text
                    ltlTelefoon.Text = FR.dr("sTelefoon")
                    ltlEmail.Text = FR.dr("sEmail")
                    ltlFactuuradres.Text = FR.dr("sStraat") & " " & FR.dr("sHuisNr") & ", " & FR.dr("sPostcode") & " " & FR.dr("sPlaats")

                    'repFacRgls.DataSource = FR.dt
                    'repFacRgls.DataBind()
                Else
                    'repFacRgls.Visible = False
                End If

                'FR.dt = FR.sFacRglsByFacKopIDFellow(iFacKopID)
                If FR.dt.Rows.Count > 0 Then
                    repMedereizigers.DataSource = FR.dt
                    repMedereizigers.DataBind()
                End If

                Dim PT As New clsPartijen
                    PT.sPartij(iPartijIDBeheerder)
                    Dim sContact As String = PT.sPartijGegevens
                    sContact &= "<br />" & PT.sTelefoon
                    sContact &= "<br />" & PT.sEmail
                    Contact.Text = sContact.Replace(Environment.NewLine, "<br/>")
                    Dim P As New clsPage

                    aAccount.HRef = P.sPageUrlByGuid(sLanguage, "16180f45-9a77-4347-8d7f-52cdea726ed4")
                    aBestellingen.HRef = P.sPageUrlByGuid(sLanguage, "bd369768-2076-40d3-9ce1-c9f3d13a1887")

                    Select Case FACKOP.dr.Item("sStatus").ToLower()
                        Case "betaald"
                            Success.Visible = True
                        Case "geannuleerd"
                            Response.Redirect(P.sPageUrlByGuid(sLanguage, "deee4d8c-ff21-4bb9-b11d-4d1c0b43c57c") & "?status=geannuleerd")
                        Case "open"
                            Response.Redirect(P.sPageUrlByGuid(sLanguage, "deee4d8c-ff21-4bb9-b11d-4d1c0b43c57c") & "?status=open")
                        Case "verlopen"
                            Response.Redirect(P.sPageUrlByGuid(sLanguage, "deee4d8c-ff21-4bb9-b11d-4d1c0b43c57c") & "?status=verlopen")
                        Case "pending"
                            pending.Visible = True
                        Case "paidout"
                        Case "refunded"
                        Case "charged_back"
                    End Select
                End If
            End If
    End Sub

    'Public Sub showPayment()
    '    Dim MOLLIE As New clsMollie
    '    divPayment.Visible = True

    '    MOLLIE.ListMethods(rblBetaalmethode)
    '    rblBetaalmethode.Items(0).Selected = True

    '    MOLLIE.ListIssuers(ddlBank)
    '    ddlBank.Items(0).Selected = True
    'End Sub

    'Private Function BepaalVerzendkosten(Optional ByVal sSessieID As String = "", Optional ByVal iFacKopID As Long = 0, Optional ByVal iLandID As Long = 0) As String

    '    Dim nfi As NumberFormatInfo = New CultureInfo("nl-NL", False).NumberFormat
    '    nfi.NumberDecimalDigits = 2

    '    Dim FACRGL As New clsFacRgl
    '    Dim rVerzendkosten As Decimal

    '    Dim iArtikelVerzendID As Long = 0
    '    Dim ST As New clsSettings
    '    If ST.bVerzendmethode Then
    '        'Nog oplossen
    '        'iArtikelVerzendID = rblVerzendmethode.SelectedValue
    '    End If

    '    If sSessieID = "" Then
    '        sSessieID = Request.Cookies("SessieID").Value
    '    End If

    '    rVerzendkosten = FACRGL.RefreshVerzendkosten(0, sSessieID, iPartijIDBeheerder, iLandID, iArtikelVerzendID, rblBetaalmethode.SelectedValue, iFacKopID)

    '    'ltlVerzendkosten.Text = rVerzendkosten.ToString("N", nfi)
    '    Return rVerzendkosten.ToString()

    '    Return ""
    'End Function

    'Protected Sub btnOrder_Click(sender As Object, e As EventArgs) Handles btnOrder.Click
    '    'Dim V As New clsValidatie
    '    Dim FI As New clsFacItems
    '    FI.sFacItems(hidFacKopID.Value)
    '    Dim sSessieID As String = Request.Cookies("SessieID").Value

    '    Dim sBetaalmethode As String = rblBetaalmethode.SelectedValue
    '    If sBetaalmethode = "" Then
    '        ltlInfo.Text = Resources.Resource.SelecteerBetaalmethode
    '        Exit Sub
    '    End If

    '    Dim ST As New clsSettings
    '    ST.InitWebshopSettings(iPartijIDBeheerder)

    '    Dim AV As New clsArtikelVarianten
    '    If ST.bVoorraad Then
    '        If AV.CheckVoorraad(sSessieID, iPartijIDBeheerder) = False Then
    '            ltlInfo.Text = "During checkout, the following items are no longer in stock: <br />" & AV.sMelding
    '            Exit Sub
    '        End If
    '        AV.uVoorraadGereserveerd(sSessieID, iPartijIDBeheerder, True, "Klant besteld de artikelen en komt bij Mollie.")
    '    End If

    '    Dim FACRGL As New clsFacRgl
    '    FACRGL.sInfo(sSessieID, iPartijIDBeheerder)
    '    If FACRGL.iAantalRegels > 0 Then
    '    Else
    '        ltlInfo.Text = "No Items in your shopping cart."
    '        Exit Sub
    '    End If

    '    Dim FACKOP As New clsFacKop
    '    Dim BP As New BasePage
    '    FACKOP.dt = FACKOP.sFacKopByFacKopID(hidFacKopID.Value, BP.iPartijIDBeheerder)
    '    FACKOP.dr = FACKOP.dt.Rows(0)

    '    Dim ADR As New clsAdressen
    '    ADR.dt = ADR.sLeverAdresByPartijAndPersoonID(FACKOP.dr.Item("iPartijID"), FACKOP.dr.Item("iPersID"))
    '    ADR.dr = ADR.dt.Rows(0)

    '    Dim sTimestamp As String = Date.Now.Ticks.ToString()
    '    Dim iFacKopID As Long = FACKOP.iFacKop(FACKOP.dr.Item("sPartijGegevens"), FACKOP.dr.Item("sVerzendGegevens"), FACKOP.dr.Item("iFactuurBedrag"), FACKOP.dr.Item("iFactuurBedragExcl"), FACKOP.dr.Item("iBtwBedrag"), FACKOP.dr.Item("sOpmerking"), sSessieID, sTimestamp, FACKOP.dr.Item("iPersID"), 0, 0, 0, FACKOP.dr.Item("iPartijID"), "order", iPartijIDBeheerder, "open")

    '    FACRGL.dt = FACRGL.sFacRgls_Session_iFacKopIDNotNull(sSessieID, iPartijIDBeheerder)
    '    If FACRGL.dt.Rows.Count > 0 Then
    '        Dim guid As Guid = Guid.NewGuid
    '        sSessieID = guid.ToString()
    '        Response.Cookies("SessieID").Value = sSessieID

    '        For Each i As DataRow In FACRGL.dt.Rows
    '            FACRGL.iscFacRgl(iFacKopID, i.Item("sFactuur"), i.Item("iAantal"), i.Item("sOmschrijving"), i.Item("iBedrag"), i.Item("iBTWBedrag"), i.Item("iStuksPrijs"), i.Item("iBTWPerc"), i.Item("sArtikel"), i.Item("sOpmerking"), i.Item("sData"), i.Item("iItemsID"), i.Item("iArtikelID"), sSessieID, iPartijIDBeheerder, i.Item("iArtikelVariantID"), i.Item("sType"))
    '        Next
    '        BepaalVerzendkosten(sSessieID, iFacKopID, ADR.dr.Item("iLandID"))
    '        Dim LOG As New clsLog
    '        LOG.iLog("Bevestings", "Get Spoiled", ADR.dr.Item("iLandID"))
    '    Else
    '        FACRGL.uFacRgliFacKopIDBySession(hidFacKopID.Value, sSessieID)
    '    End If

    '    If FACKOP.dt.Rows.Count > 0 Then
    '        FACKOP.dr = FACKOP.dt.Rows(0)
    '        Dim MOLLIE As New clsMollie

    '        Dim sResponsePage As String = "~/bevestiging" 'P.sPageUrlByGuid(sLanguage, "f2257328-0d38-40dd-9dd0-176c79dd0512") ' "/order-information"

    '        sResponsePage = sResponsePage.Substring(1, sResponsePage.Length - 1)
    '        sResponsePage = sResponsePage & "/" & iFacKopID & "/" & RouteData.Values("timestamp").ToString() & "/" & FACKOP.dr.Item("iPartijID") & "/" & FACKOP.dr.Item("iPersID")
    '        sResponsePage = sResponsePage.TrimStart("/")

    '        Dim FACITEMS As New clsFacItems
    '        FACITEMS.dt = FACITEMS.sFacItemsVerzendkostenByFackKopID(hidFacKopID.Value)
    '        FACITEMS.dr = FACITEMS.dt.Rows(0)
    '        'FACITEMS.uFacItemssWaardeByiFacKopIDAndsType(iFacKopID, sSessieID, "session")
    '        FACITEMS.iFacItems(iFacKopID, "verzendkosten", FACITEMS.dr.Item("sWaarde"), "")
    '        FACITEMS.iFacItems(iFacKopID, "timestamp", sTimestamp, "")
    '        FACITEMS.iFacItems(iFacKopID, "session", sSessieID, "")



    '        Dim U As New clsUtility
    '        Dim sPaymentURL As String = MOLLIE.CreatePayment(FACKOP.dr.Item("iFactuurBedrag").ToString().Replace(",", "."), sLanguage, sResponsePage, U.Name(), CLng(iFacKopID), 0, 0, rblBetaalmethode.SelectedValue, ddlBank.SelectedValue, sSessieID)
    '        FACITEMS.iFacItems(iFacKopID, "sPaymentID", MOLLIE.sPaymentID, "")
    '        Response.Redirect(sPaymentURL)
    '    End If
    'End Sub
End Class