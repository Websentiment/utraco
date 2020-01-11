
Partial Class _Default
    Inherits BasePage
    Dim LI As New clsLijstItems
    Dim IMG As New clsImages
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

            LI.dt = LI.sLIByTypeAndTaal("Merken", iTaalID, iPartijIDBeheerder, False)
            If LI.dt.Rows.Count > 0 Then
                repMerken.DataSource = LI.dt
                repMerken.DataBind()
            End If

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

    Private Sub repMerken_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles repMerken.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem Or e.Item.ItemType = ListItemType.Item Then
            Dim iLijstItemID As Long = DataBinder.Eval(e.Item.DataItem, "iLijstItemID")
            IMG.dt = IMG.sImageByTussTypeAndID("Merken", iLijstItemID)

            If IMG.dt.Rows.Count > 0 Then
                For Each IMG.dr In IMG.dt.Rows
                    Select Case IMG.dr.Item("sSoort").ToString().ToLower()
                        Case "thumb"
                            Dim Thumb As HtmlImage = e.Item.FindControl("merkImg")
                            Thumb.Attributes.Add("src", IMG.dr.Item("sSmall").Replace("~/", sURL()))
                            Thumb.Alt = IMG.dr.Item("sData")
                    End Select
                Next
            Else
                e.Item.FindControl("merkItem").Visible = False
            End If

        End If
    End Sub

End Class
