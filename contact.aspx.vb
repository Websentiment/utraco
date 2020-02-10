
Partial Class _Contact
    Inherits BasePage
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

        End If
    End Sub

    Public Sub btnSubmit1_Click(sender As Object, e As EventArgs) Handles btnSubmit1.Click
        If Page.RouteData.Values("language") IsNot Nothing Then
            sLanguage = Page.RouteData.Values("language").ToString().ToUpper
        Else
            sLanguage = sDefaultLanguage.ToUpper
        End If


        iTaalID = sTaalID(sLanguage)
        Dim LI As New clsLijstItems
        LI.dt = LI.sLijstItemByTitleAndType("Contact", iTaalID, "Mailing")
        If LI.dt.Rows.Count > 0 Then
            LI.dr = LI.dt.Rows(0)
            Dim sBericht As String = LI.dr.Item("sDescription")
            Dim email As String = LI.dr.Item("sItem1")
            sBericht = sBericht.Replace("[name]", txtName.Text)
            sBericht = sBericht.Replace("[email]", txtEmail.Text)
            sBericht = sBericht.Replace("[phone]", txtPhone.Text)
            sBericht = sBericht.Replace("[contactway]", ddlSoort.SelectedItem.Text)
            sBericht = sBericht.Replace("[message]", txtMessage.Value.Replace(Environment.NewLine, "<br />"))


            Dim sType As String = LI.dr.Item("sTitle")
            Dim sVan As String = LI.dr.Item("sItem1").replace("[email]", email)
            Dim sNaar As String = LI.dr.Item("sColor").replace("[email]", email)
            Dim sCC As String = LI.dr.Item("sItem4").replace("[email]", email)
            Dim sBCC As String = LI.dr.Item("sItem5").replace("[email]", email)
            Dim sOnderwerp As String = LI.dr.Item("sSubTitle").replace("[email]", email)
            Dim sBijlagen As String = ""
            Dim sInfo As String = txtName.Text

            Dim M As New clsMail
            Dim sTemplate As String = M.sHtml("~/EmailTemplates/mail.aspx")
            sTemplate = sTemplate.Replace("[subject]", sOnderwerp)
            sTemplate = sTemplate.Replace("[body]", sBericht)

            Dim iMailID As Long = M.iscMail(0, iPartijIDBeheerder, "versturen", sType, "", sVan, sNaar, sCC, sBCC, sOnderwerp, sTemplate, sBijlagen, "", sInfo, Now)

            LI.dt = LI.sLijstItemByTitleAndType("Contact bevestiging", iTaalID, "Mailing")
            If LI.dt.Rows.Count > 0 Then
                LI.dr = LI.dt.Rows(0)
                sBericht = LI.dr.Item("sDescription")
                email = LI.dr.Item("sItem1")
                sBericht = sBericht.Replace("[name]", txtName.Text)
                sBericht = sBericht.Replace("[email]", txtEmail.Text)
                sBericht = sBericht.Replace("[phone]", txtPhone.Text)
                sBericht = sBericht.Replace("[contactway]", ddlSoort.SelectedItem.Text)
                sBericht = sBericht.Replace("[message]", txtMessage.Value.Replace(Environment.NewLine, "<br />"))

                sType = LI.dr.Item("sTitle")
                sVan = LI.dr.Item("sItem1").replace("[email]", email)
                sNaar = txtEmail.Text
                sCC = LI.dr.Item("sItem4").replace("[email]", email)
                sBCC = LI.dr.Item("sItem5").replace("[email]", email)
                sOnderwerp = LI.dr.Item("sSubTitle").replace("[email]", email)
                sBijlagen = ""

                Dim U As New clsUtility
                sInfo = "Utraco Holland"

                Dim sTemplate1 As String = M.sHtml("~/EmailTemplates/mail.aspx")
                sTemplate1 = sTemplate1.Replace("[subject]", sOnderwerp)
                sTemplate1 = sTemplate1.Replace("[body]", sBericht)

                iMailID = M.iscMail(0, iPartijIDBeheerder, "versturen", sType, "", sVan, sNaar, sCC, sBCC, sOnderwerp, sTemplate1, sBijlagen, "", sInfo, Now)

                Dim P As New clsPage
                Response.Redirect(P.sPageUrlByGuid(sLanguage, "a7e87160-9d02-49f9-bf33-f73e736d0be1"))
            Else

            End If
        End If
    End Sub

End Class