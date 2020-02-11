﻿Partial Class _Products
    Inherits BasePage
    Dim P As New clsPage
    Dim LI As New clsLijstItems
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

            LI.dt = LI.sLIByTypeAndTaal("Productgroep", iTaalID, iPartijIDBeheerder, False)
            If LI.dt.Rows.Count > 0 Then
                repGroepen.DataSource = LI.dt
                repGroepen.DataBind()
            End If

            Dim IMG As New clsImages
            IMG.dt = IMG.sImageByPageAndTussTypeAndsSoort(sQs, "_pages", iTaalID, "ltlSrcMobiel")
            If IMG.dt.Rows.Count > 0 Then
                IMG.dr = IMG.dt.Rows(0)
                ltlSrcMobiel.Attributes.Add("srcset", IMG.dr.Item("sSmall").Replace("~/", sURL()))
            End If

            IMG.dt = IMG.sImageByPageAndTussTypeAndsSoort(sQs, "_pages", iTaalID, "ltlSrcTablet")
            If IMG.dt.Rows.Count > 0 Then
                IMG.dr = IMG.dt.Rows(0)
                ltlSrcTablet.Attributes.Add("srcset", IMG.dr.Item("sSmall").Replace("~/", sURL()))
            End If

            'sBreadcrumbs(ltlBreadCrumps)
        End If

    End Sub

    Private Sub repBlog_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles repGroepen.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem Or e.Item.ItemType = ListItemType.Item Then
            Dim iLijstItemID As Long = DataBinder.Eval(e.Item.DataItem, "iLijstItemID")
            Dim repProducten As Repeater = e.Item.FindControl("repProducten")



            LI.dt = LI.sLIByLijstItem(iLijstItemID, iTaalID, iPartijIDBeheerder, False)
            If LI.dt.Rows.Count > 0 Then
                repProducten.DataSource = LI.dt
                repProducten.DataBind()
            End If

            'Dim aLink As HtmlAnchor = e.Item.FindControl("aLink")
            'Dim aLink2 As HtmlAnchor = e.Item.FindControl("aLink2")
            'Dim sQueryString As String = DataBinder.Eval(e.Item.DataItem, "sQueryString")
            'Dim sAfbeelding As String = DataBinder.Eval(e.Item.DataItem, "sAfbeelding")
            'If Not IsDBNull(DataBinder.Eval(e.Item.DataItem, "sQueryString2")) Then
            '    Dim sQueryString2 As String = DataBinder.Eval(e.Item.DataItem, "sQueryString2")
            '    aLink.HRef = "/" & sLanguage.ToLower() & "/" & sQueryString2 & "/" & sQueryString & "/" & sAfbeelding
            '    aLink2.HRef = "/" & sLanguage.ToLower() & "/" & sQueryString2 & "/" & sQueryString & "/" & sAfbeelding
            'Else
            '    aLink.HRef = "/" & sLanguage.ToLower() & "/" & sQueryString & "/" & sAfbeelding
            '    aLink2.HRef = "/" & sLanguage.ToLower() & "/" & sQueryString & "/" & sAfbeelding
            'End If
            'Dim IMG As New clsImages

            ''IMG.dt = IMG.sImageByIDAndSoort(iLijstItemID, "Thumb", DataBinder.Eval(e.Item.DataItem, "sType"))
            ''If IMG.dt.Rows.Count > 0 Then
            ''    IMG.dr = IMG.dt.Rows(0)
            ''    Dim Thumb As HtmlImage = e.Item.FindControl("imgThumb")
            ''    Thumb.Src = IMG.dr.Item("sSmall").Replace("~/", sURL())
            ''    Thumb.Alt = IMG.dr.Item("sData")
            ''Else
            ''    e.Item.Visible = False
            ''End If
        End If
    End Sub


End Class