Class Cafe.Api Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/save" Method="POST" Call="SaveCafe"/>
    <Route Url="/delete" Method="DELETE" Call="DeleteCafe"/>
    <Route Url="/" Method="GET" Call="GetCafe"/>
    <Route Url="/list" Method="GET" Call="GetCafeList"/>
    <Route Url="/test" Method="GET" Call="Test"/>
   </Routes>
}

ClassMethod Test() As %Status
{
   write "this my is test"
   Return $$$OK
}

ClassMethod SaveCafe() As %Status
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

ClassMethod DeleteCafe() As %Status
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

ClassMethod GetCafe() As %Status
{
    set id = %request.Get("id")
    try {
        set cafe = ##class(Cafe.Utils).GetCafe(id)
        set obj = {}
        set obj."name" = cafe.Name
	    set obj."address" = cafe.Address
        set obj."phone" = cafe.Phone
        set obj."minPrice" = cafe.MinPrice
        set source = obj.%ToJSON()
	    write source
        Return $$$OK
    } Catch {
        Return $$$ERROR(404)
    }
}

ClassMethod GetCafeList() As %Status
{
    try {
        set list = ##class(Cafe.Utils).GetCafeList()
        write list.%ToJSON()
        Return $$$OK
    } catch {
        Return $$$ERROR(500)
    }
}

}
