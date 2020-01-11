Imports System.Net
Imports System.IO
Imports System.Web.Script.Serialization

Partial Class MollieResponsePayment
    Inherits System.Web.UI.Page

    Dim LOG As New clsLog
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Page.IsPostBack = False Then
            Dim sPaymentID As String = Request.Form("id")
            If sPaymentID = Nothing Then
                sPaymentID = Request.QueryString("id")
            End If

            Dim AV As New clsArtikelVarianten
            Dim MOLLIE As New clsMollie
            Dim FACKOP As New clsFacKop
            Dim PT As New clsPartijen
            Dim FACITEMS As New clsFacItems
            Dim BP As New BasePage
            Dim FACRGL As New clsFacRgl
            Dim ST As New clsSettings
            Dim U As New clsUtility
            ST.InitWebshopSettings(BP.iPartijIDBeheerder)

            MOLLIE.GetPayment(sPaymentID)
            FACITEMS.iFacItems(MOLLIE.iFacKopID, "Mollie", MOLLIE.sContent, "")

            Dim sUserID As String = ""
            FACKOP.dt = FACKOP.sFacKopByFacKopID(MOLLIE.iFacKopID, BP.iPartijIDBeheerder)
            If FACKOP.dt.Rows.Count > 0 Then
                FACKOP.dr = FACKOP.dt.Rows(0)
            Else
                LOG.iLog(U.Name.ToString & " - response", "sFacKopByFacKopID", "Response benaderd vanuit andere website.")
                Exit Sub
            End If
            Select Case MOLLIE.sStatus.ToLower()
                Case "paid"
                    Try
                        If FACKOP.dr.Item("sStatus").ToLower() = "betaald" Then
                            FACITEMS.iFacItems(MOLLIE.iFacKopID, "Al betaald", "", "")
                            Exit Sub
                        End If
                    Catch ex As Exception

                    End Try
                    Dim sType As String = "factuur"
                    Dim sFactuurnummer As String = ST.scSettingByTypeAndGroup("webshop", sType & "teller", BP.iPartijIDBeheerder)
                    ST.uSettingByTypeAndGroup(CInt(sFactuurnummer) + 1, sType & "teller", "webshop", BP.iPartijIDBeheerder)
                    Dim iBetaalTermijn As Integer = ST.scSettingByTypeAndGroup("webshop", sType & "termijn", BP.iPartijIDBeheerder)


                    FACITEMS.iFacItems(MOLLIE.iFacKopID, "status", MOLLIE.sStatus, "")
                    FACITEMS.iFacItems(MOLLIE.iFacKopID, "PaymentID", sPaymentID, "")

                    FACKOP.uStatusType("factuur", "betaald", sPaymentID, MOLLIE.iFacKopID)
                    FACKOP.uFactuurByID(MOLLIE.iFacKopID, sFactuurnummer, "")

                    FACRGL.uFacRglBySession(MOLLIE.iFacKopID, sFactuurnummer, sPaymentID, MOLLIE.sSession) 'sessie verwijderen

                    LOG.iLog(U.Name.ToString & " - Mollieresponse", "start", "2")
                    If ST.bMyParcel Then
                        Try
                            Dim MYPARCEL As New clsMyParcel
                            Dim Z As New clsZendingen
                            Z.dt = Z.sZendingByFacKopID(MOLLIE.iFacKopID)
                            If Z.dt.Rows.Count > 0 Then
                                Z.dr = Z.dt.Rows(0)
                                MYPARCEL.AddShipment(Z.dr.Item("sCountryCode"), Z.dr.Item("sCity"), Z.dr.Item("sStreet"), Z.dr.Item("sNumber"), Z.dr.Item("sAddition").ToString().ToLower(), Z.dr.Item("sPostalcode"), Z.dr.Item("sPerson"), Z.dr.Item("sPhone"), Z.dr.Item("sEmail"))
                            End If
                        Catch ex As Exception
                            LOG.iLog(U.Name.ToString & " - response", "addshipment", ex.Message())
                        End Try
                    End If

                    LOG.iLog(U.Name.ToString & " - Mollieresponse", "start", "3")
                    If ST.bFactuurPDF Then
                        LOG.iLog(U.Name.ToString & " - Mollieresponse", "start", "4" & MOLLIE.iFacKopID & "" & sFactuurnummer)
                        Dim PDF As New clsPDF
                        PDF.sFooterUrl = BP.sURL() & "Rapporten/factuur_footer.aspx?id=" & MOLLIE.iFacKopID
                        LOG.iLog(U.Name.ToString & " - MOLLIE", PDF.sFooterUrl, "")
                        PDF.sPDF(Me.Page, "/Rapporten/Factuur.aspx?id=" & MOLLIE.iFacKopID, MOLLIE.iFacKopID & "_" & sFactuurnummer, "", False, True, "opslaan")
                        FACKOP.uFactuurByID(MOLLIE.iFacKopID, sFactuurnummer, "~/facturen/" & MOLLIE.iFacKopID.ToString() & "_" & sFactuurnummer & ".pdf")

                    End If

                    LOG.iLog(U.Name.ToString & " - Mollieresponse", "Start Exact", "5")

                    If ST.bExact Then
                        Dim request As WebRequest = WebRequest.Create("https://exact.websentiment.nl/Exact/ExactDataKoppeling.aspx?type=verkooporder&id=" & MOLLIE.iFacKopID & "&iPartijIDBeheerder=" & BP.iPartijIDBeheerder)
                        Dim response As WebResponse = request.GetResponse()
                        response.Close()
                    End If

                    LOG.iLog(U.Name.ToString & " - Mollieresponse", "start Mailing", "6")

                    Dim M As New clsMail
                    M.MailOrder(MOLLIE.iFacKopID, MOLLIE.sLanguage, ST.bFactuurPDF)

                    If ST.bVoorraad Then
                        LOG.iLog(U.Name.ToString & " - Mollieresponse", "Start voorraad", "7. Voorraad")
                        AV.uVoorraadBeschikbaarByFacKopID(MOLLIE.iFacKopID, False, BP.iPartijIDBeheerder, FACKOP.dr("sFactuur") & " - Bestelling is betaald.")
                        AV.uVoorraadGereserveerdByFacKopID(MOLLIE.iFacKopID, False, BP.iPartijIDBeheerder, FACKOP.dr("sFactuur") & " - Bestelling is betaald.")
                    End If

                    'Eventueel kortingscode verwijderen
                    Dim KT As New clsKortingCodes
                    KT.dt = KT.sKortingsCodesByFacKop(BP.iPartijIDBeheerder, MOLLIE.iFacKopID)
                    For Each KT.dr In KT.dt.Rows
                        Dim iAantal As Long = KT.dr.Item("iAantalKeer") - 1
                        If iAantal > 0 Then
                            KT.uStatus(KT.dr.Item("iKortingsCodeID"), "actief", iAantal)
                        Else
                            KT.uStatus(KT.dr.Item("iKortingsCodeID"), "inactief", iAantal)
                        End If
                    Next

                Case "cancelled"
                    FACKOP.uStatusType("order", "geannuleerd", sPaymentID, MOLLIE.iFacKopID)
                    If ST.bVoorraad Then
                        AV.uVoorraadGereserveerdByFacKopID(MOLLIE.iFacKopID, False, BP.iPartijIDBeheerder, FACKOP.dr("sFactuur") & " - Bestelling is geannuleerd.")
                    End If
                Case "open"
                    FACKOP.uStatusType("order", "open", sPaymentID, MOLLIE.iFacKopID)
                Case "failed"
                    FACKOP.uStatusType("order", "geannuleerd", sPaymentID, MOLLIE.iFacKopID)
                    If ST.bVoorraad Then
                        AV.uVoorraadGereserveerdByFacKopID(MOLLIE.iFacKopID, False, BP.iPartijIDBeheerder, FACKOP.dr("sFactuur") & " - Bestelling is mislukt.")
                    End If
                Case "expired"
                    FACKOP.uStatusType("order", "verlopen", sPaymentID, MOLLIE.iFacKopID)

                    If ST.bVoorraad Then
                        AV.uVoorraadGereserveerdByFacKopID(MOLLIE.iFacKopID, False, BP.iPartijIDBeheerder, FACKOP.dr("sFactuur") & " - Bestelling is verlopen.")
                    End If
                    'Als deze na 15 min Expired. 
                    'Kan in de tussentijd al iets gekocht zijn. 
                    'Bestelling hier cancellen?

                    FACITEMS.iFacItems(MOLLIE.iFacKopID, "expired - " & FACKOP.dr.Item("sStatus"), "Hier moet eigenlijk voorraad aangepast worden.", DateTime.Now.ToString())
                Case "pending"
                    FACITEMS.iFacItems(MOLLIE.iFacKopID, "pending", "", DateTime.Now.ToString())
                Case "paidout"

                Case "refunded"
                    FACITEMS.iFacItems(MOLLIE.iFacKopID, "refunded", "", DateTime.Now.ToString())
                Case "charged_back"
                    FACITEMS.iFacItems(MOLLIE.iFacKopID, "charged_back", "", DateTime.Now.ToString())
            End Select
        End If
    End Sub
End Class
