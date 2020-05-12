Class Meny.Utils
{

ClassMethod SaveDish(Obj As Menu.Dishes) As %Status
{
    set obj = ##class(Menu.Dishes).%New()
    set obj.Name = Obj.Name
    set obj.Description = Obj.Description
    set obj.CafeID = Obj.CafeID
    set obj.Price = Obj.Price
    set result = obj.%Save()
    Return result
}

ClassMethod DeleteDish(ID As %Integer) As %Status
{
    set result = ##class(Menu.Dishes).%DeleteId(ID)
    Return result
}

ClassMethod GetCafe(ID As %Integer) As Menu.Dishes
{
    set obj = ##class(Menu.Dishes).%OpenId(ID)
    #; write "name="
    #; write obj.Name
    #; write "&address="
    #; write obj.Address
    #; write "&phone="
    #; write obj.Phone
    #; write "&minPrice="
    #; write obj.MinPrice
    Return obj
}

ClassMethod Write(Obj As Menu.Dishes)
{
    write "name="
    write Obj.Name
    write "&description="
    write Obj.Description
    write "&cafeId="
    write Obj.CafeID
    write "&price="
    write Obj.Price
}

}
