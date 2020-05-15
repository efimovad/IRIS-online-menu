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
    Return obj
}

ClassMethod GetCafeList() As %String
{
    set data = []
    &sql(
        DECLARE MyCursor CURSOR FOR
        SELECT ID, Name, Address, Phone, MinPrice
        INTO :ID, :Name, :Address, :Phone, :MinPrice
        FROM Cafe.Places
    )
    
    &sql(OPEN MyCursor)   
    FOR { 
        &sql(FETCH MyCursor)
        if (SQLCODE) quit
        set obj = {"id": (ID), "name": (Name), "address": (Address), "phone": (Phone), "minPrice": (MinPrice)}
        do data.%Push(obj)
   }
   &sql(CLOSE MyCursor)
   return data
   quit
}

}
