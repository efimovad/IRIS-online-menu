Class Dish.Utils
{

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
        SELECT ID, Cafe, Description, Name, Price, Cafe->Name
        INTO :ID, :CafeID, :Description, :Name, :Price, :Cafename
        FROM Dish.Dishes
        WHERE Cafe = :CafeId
    )
    
    &sql(OPEN MyCursor)   
    FOR { 
        &sql(FETCH MyCursor)
        if (SQLCODE) quit
        set obj = {"id": (ID), "cafeID": (CafeID), "name": (Name), "description": (Description), "price": (Price), "cafename": (Cafename)}
        do data.%Push(obj)
   }
   &sql(CLOSE MyCursor)
   return data
   quit
}

}
