Class Order.Api Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/create" Method="POST" Call="CreateOrder"/>
</Routes>
}

ClassMethod CreateOrder() As %Status
{
   set obj = ##class(Order.Orders).%New()

   set obj.Address = %request.Get("address")
  
   set CafeId = %request.Get("cafeId")
   do obj.CafeSetObjectId(CafeId)
   
   set obj.Dishes = []

   set obj.Status = "создан"

   set result = obj.%Save()

   if $$$ISERR(result) {
       write result
   }
   else {
       write "ok"
   }
   Return result
}

}