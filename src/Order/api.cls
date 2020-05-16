Class Order.Api Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/test" Method="GET" Call="Test"/>
    <Route Url="/create" Method="POST" Call="CreateOrder"/>
    <Route Url="/add" Method="POST" Call="AddDish"/>
    <Route Url="/close" Method="POST" Call="CloseOrder"/>
    <Route Url="/details" Method="GET" Call="DishList"/>
   </Routes>
}

ClassMethod Test() As %Status
{
    write "ok"
    return $$$OK
}

ClassMethod CreateOrder() As %Status
{
 
    set obj = ##class(Order.Orders).%New()

    set obj.Address = %request.Get("address")
    set obj.Status = "создан"

    set CafeId = %request.Get("cafeId")
    do obj.CafeSetObjectId(CafeId)
    
    set result = obj.%Save()

    if $$$ISERR(result) {
        write result
    }
    else {
        Write obj.%Id()
    }

    Return result
}

ClassMethod AddDish() As %Status
{
    set ID = %request.Get("id")
    set DishId = %request.Get("dishId")

    set result = ##class(Order.Utils).AddDish(ID, DishId)
    if $$$ISERR(result) {
        write result
    }
    else {
        write $$$OK
    }

    Return result
}

ClassMethod CloseOrder() As %Status
{
    set ID = %request.Get("id")
    set order = ##class(Order.Orders).%OpenId(ID)

    set order.Status = "закрыт"
    set result = order.%Save()

    if $$$ISERR(result) {
        write result
    }
    else {
        write $$$OK
    }
    Return result
}

ClassMethod DishList() As %Status
{
    set ID = %request.Get("id")
    try {
        set list = ##class(Order.Utils).GetDishList(ID)
        write list.%ToJSON()
        Return $$$OK
    } catch {
        Return $$$ERROR(500)
    }
}

}
