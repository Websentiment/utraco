Imports System.Web.Services
Imports System.Data

Partial Class _Default
    Inherits BasePage
    Public sCode As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then

            Dim sQs As String = RouteData.Values("page").ToString()
            sCode = RouteData.Values("language").ToString().ToLower

            Dim PI As New clsPageItems
            PI.sPI(Me.Page, sCode, sQs, False, False, True)
            InitializeComponents()

        End If
    End Sub

    Public Sub InitializeComponents()
        Dim LI As New clsLijstItems
        Dim dt As DataTable = LI.sLIByType("Functionele Cookies", sTaalID(sCode))
        repCookies.DataSource = dt
        repCookies.DataBind()

        dt = LI.sLIByType("Analytische Cookies", sTaalID(sCode))
        repCookiesAn.DataSource = dt
        repCookiesAn.DataBind()
    End Sub



End Class