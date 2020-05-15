Class Dish.Api Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/" Method="POST" Call="SaveDish"/>
    <Route Url="/" Method="DELETE" Call="DeleteDish"/>
    <Route Url="/" Method="GET" Call="GetDish"/>
    <Route Url="/list" Method="GET" Call="GetDishList"/>
   </Routes>
}

ClassMethod SaveDish() As %Status
{
   set obj = ##class(Dish.Dishes).%New()
   set obj.Name = %request.Get("name")
   set obj.Description = %request.Get("description")
   
   set CafeId = %request.Get("cafeId")
   set obj.CafeSetObjectId(CafeId)

   set obj.Price = %request.Get("price")
   set result = ##class(Dish.Utils).SaveDish(obj)
   if $$$ISERR(result) {
       write result
   }
   else {
       write "ok"
   }
   Return result
}

ClassMethod DeleteDish() As %Status
{
    set id = %request.Get("id")
    set result = ##class(Dish.Utils).DeleteDish(id)
    if $$$ISERR(result) {
       write result
    }
    else {
       write "ok"
    }
    Return result
}

ClassMethod GetDish() As %Status
{
    set id = %request.Get("id")
    try {
        set dish = ##class(Dish.Utils).GetDish(id)
        set obj = {}
        set obj."name" = dish.Name
	    set obj."description" = dish.Description
        set obj."price" = dish.Price
        set obj."cafeId" = dish.CafeID
        set source = obj.%ToJSON()
	    write source
        Return $$$OK
    } Catch {
        Return $$$ERROR(404)
    }
}

ClassMethod GetDishList() As %Status
{
    set id = %request.Get("id")
    try {
        set list = ##class(Dish.Utils).GetDishList(id)
        write list.%ToJSON()
        Return $$$OK
    } catch {
        Return $$$ERROR(500)
    }
}

}
