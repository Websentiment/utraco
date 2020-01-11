
Partial Class _Default
    Inherits BasePage
    Public sLanguage, sQs, sParentPage As String
    Dim iTaalID As Long
    Dim OT As New clsOpeningstijden

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

            Dim iPageID As Long = 0
            If RouteData.DataTokens("iPageID") IsNot Nothing Then
                iPageID = RouteData.DataTokens("iPageID")
            End If
            Dim PI As New clsPageItems
            PI.sPI(Page, sLanguage, sQs, False, False, True, sParentPage)
            'BindMenu()
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
            sBreadcrumbs(ltlBreadCrumps)
            OT.dt = OT.sOpeningsTijden(iPartijIDBeheerder, "Algemeen")
            If OT.dt.Rows.Count > 0 Then
                repOpeningstijden.DataSource = OT.dt
                repOpeningstijden.DataBind()
            End If
        End If
    End Sub



    Dim bOpen As Boolean = False
    Private Sub repOpeningstijden_ItemDataBound2(sender As Object, e As RepeaterItemEventArgs) Handles repOpeningstijden.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem Or e.Item.ItemType = ListItemType.Item Then

            'hier wordt de betreffende literal opgehaald in de aspx pagina 
            Dim ltlDay As Literal = e.Item.FindControl("ltlDayOfWeek")
            Dim day As Integer = Date.Now.DayOfWeek
            Dim ltlTijd As Literal = e.Item.FindControl("ltlTijd")
            If DataBinder.Eval(e.Item.DataItem, "iDayOfWeek") = day Then
                'Row actief maken (dag van vandaag)
                Dim trDay As HtmlTableRow = e.Item.FindControl("trDay")
                trDay.Attributes.Add("class", "active")
                'Open of gesloten
                If DataBinder.Eval(e.Item.DataItem, "bOpen") = False Then
                    bOpen = False
                    ltlTijd.Text = "Gesloten"
                Else
                    ltlTijd.Text = CDate(DataBinder.Eval(e.Item.DataItem, "dtStart")).ToString("HH:mm") & " - " & CDate(DataBinder.Eval(e.Item.DataItem, "dtEnd")).ToString("HH:mm")
                    bOpen = True
                End If

            Else

                ltlTijd.Text = CDate(DataBinder.Eval(e.Item.DataItem, "dtStart")).ToString("HH:mm") & " - " & CDate(DataBinder.Eval(e.Item.DataItem, "dtEnd")).ToString("HH:mm")
            End If

            If DataBinder.Eval(e.Item.DataItem, "bOpen") = False Then

                ltlTijd.Text = "Gesloten"
            End If

            Select Case DataBinder.Eval(e.Item.DataItem, "iDayOfWeek")
                Case 0
                    ltlDay.Text = "Zondag"
                Case 1
                    ltlDay.Text = "Maandag"
                Case 2
                    ltlDay.Text = "Dinsdag"
                Case 3
                    ltlDay.Text = "Woensdag"
                Case 4
                    ltlDay.Text = "Donderdag"
                Case 5
                    ltlDay.Text = "Vrijdag"
                Case 6
                    ltlDay.Text = "Zaterdag"
                Case Else
            End Select
        End If
    End Sub
End Class