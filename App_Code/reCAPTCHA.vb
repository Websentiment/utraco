Imports System.IO
Imports System.Net
Imports Microsoft.VisualBasic
Imports Newtonsoft.Json

Public Class clsRecaptcha
    Dim sSecret As String
    Dim sUrl As String = "https://www.google.com/recaptcha/api/siteverify"

    Public Sub New()
        Dim U As New clsUtility
        Me.sSecret = U.Config("reCAPTCHASecret")
    End Sub

    Public Function validate(token As String) As reCAPTCHA.Response
        'Set Tls1.2 only to use on localhost
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
        Dim U As New clsUtility

        Dim url As String = sUrl
        Dim data As String = "" &
            "secret=" & Me.sSecret &
            "&response=" & token

        Dim req As WebRequest = WebRequest.Create(url)
        req.Method = "POST"
        req.ContentType = "application/x-www-form-urlencoded"

        Dim byteArray As Byte() = Encoding.UTF8.GetBytes(data)
        req.ContentLength = byteArray.Length

        Dim dataStream As Stream = req.GetRequestStream()
        dataStream.Write(byteArray, 0, byteArray.Length)
        dataStream.Close()

        Dim res As WebResponse = req.GetResponse()
        Dim resStream = res.GetResponseStream()
        Dim reader As New StreamReader(resStream)
        Dim response As String = reader.ReadToEnd()

        reader.Close()
        resStream.Close()
        res.Close()

        Return JsonConvert.DeserializeObject(Of reCAPTCHA.Response)(response)
    End Function
End Class

Namespace reCAPTCHA
    Public Class Response
        Public Property success As Boolean
        Public Property challenge_ts As DateTime
        Public Property hostname As String
    End Class
End Namespace

