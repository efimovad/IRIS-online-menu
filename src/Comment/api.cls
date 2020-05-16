Class Comment.Api Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/save" Method="POST" Call="SaveComment"/>
    <Route Url="/list" Method="GET" Call="GetCommentList"/>
    <Route Url="/test" Method="GET" Call="Test"/>
   </Routes>
}

ClassMethod Test() As %Status
{
   write "this my is test"
   Return $$$OK
}

ClassMethod SaveComment() As %Status
{
    set obj = ##class(Comment.Comments).%New()

    set obj.Text = %request.Get("text")
    set obj.Grade = %request.Get("grade")

    set CafeId = %request.Get("cafeId")
    do obj.CafeSetObjectId(CafeId)
    
    set result = obj.%Save()
    if $$$ISERR(result) {
        write result
    }
    else {
        write "ok"
    }
    Return result
}

ClassMethod GetCommentList() As %Status
{
    set CafeId = %request.Get("cafeId")
    try {
        set list = ##class(Comment.Utils).GetCommentList(CafeId)
        write list.%ToJSON()
        Return $$$OK
    } catch {
        Return $$$ERROR(500)
    }
}

}
