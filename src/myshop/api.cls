Class Cafe.Api Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/cafe/save" Method="POST" Call="Save"/>
    <Route Url="/cafe/delete" Method="POST" Call="Delete"/>
    <Route Url="/cafe/get" Method="GET" Call="Get"/>


    <Route Url="/cafe/test" Method="GET" Call="Test"/>
   </Routes>
}

ClassMethod Test() As %Status
{
   write "this is test"
   Return $$$OK
}

ClassMethod Save() As %Status
{
   set obj = {}
   set obj.Name = %request.Get("name")
   set obj.Address = %request.Get("address")
   set obj.Phone = %request.Get("phone")
   set obj.MinPrice = %request.Get("minPrice")
   set result = ##class(Cafe.Utils).SaveCafe(obj)
   if $$$ISERR(result) {
       write result
   }
   else {
       write "ok"
   }
   Return result
}

ClassMethod Delete() As %Status
{
    set id = %request.Get("id")
    set result = ##class(Cafe.Utils).DeleteCafe(id)
    if $$$ISERR(result) {
       write result
    }
    else {
       write "ok"
    }
    Return result
}

ClassMethod Get()
{
    set id = %request.Get("id")
    do ##class(Cafe.Utils).GetCafe(id)
}

}
