Class Dish.Utils
{

ClassMethod SaveDish(Obj As Dish.Dishes) As %Status
{
    set obj = ##class(Dish.Dishes).%New()
    set obj.Name = Obj.Name
    set obj.Description = Obj.Description
    set obj.CafeID = Obj.CafeID
    set obj.Price = Obj.Price
    set result = obj.%Save()
    Return result
}

ClassMethod DeleteDish(ID As %Integer) As %Status
{
    set result = ##class(Dish.Dishes).%DeleteId(ID)
    Return result
}

ClassMethod GetDish(ID As %Integer) As Dish.Dishes
{
    set obj = ##class(Dish.Dishes).%OpenId(ID)
    Return obj
}

ClassMethod GetDishList(CafeId As %Integer) As %String
{
    set data = []
    &sql(
        DECLARE MyCursor CURSOR FOR
        SELECT ID, CafeID, Description, Name, Price
        INTO :ID, :CafeID, :Description, :Name, :Price
        FROM Cafe.Dishes
        WHERE CafeID = CafeId
    )
    
    &sql(OPEN MyCursor)   
    FOR { 
        &sql(FETCH MyCursor)
        if (SQLCODE) quit
        set obj = {"id": (ID), "cafeID": (CafeID), "name": (Name), "description": (Description), "price": (Price)}
        do data.%Push(obj)
   }
   &sql(CLOSE MyCursor)
   return data
   quit
}

}
