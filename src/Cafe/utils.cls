Class Cafe.Utils
{

ClassMethod SaveCafe(GoodsObj As Cafe.Places) As %Status
{
    set obj = ##class(Cafe.Places).%New()
    set obj.Name = GoodsObj.Name
    set obj.Address = GoodsObj.Address
    set obj.Phone = GoodsObj.Phone
    set obj.MinPrice = GoodsObj.MinPrice
    set result = obj.%Save()
    Return result
}

ClassMethod DeleteCafe(ID As %Integer) As %Status
{
    set result = ##class(Cafe.Places).%DeleteId(ID)
    Return result
}

ClassMethod GetCafe(ID As %Integer) As Cafe.Places
{
    set obj = ##class(Cafe.Places).%OpenId(ID)
    write "name="
    write obj.Name
    write "&address="
    write obj.Address
    write "&phone="
    write obj.Phone
    write "&minPrice="
    write obj.MinPrice
    Return obj
}

ClassMethod Write(Obj As Cafe.Places)
{
    write "name="
    write Obj.Name
    write "&address="
    write Obj.Address
    write "&phone="
    write Obj.Phone
    write "&minPrice="
    write Obj.MinPrice
}

}
