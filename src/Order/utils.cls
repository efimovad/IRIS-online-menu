Class Order.Utils
{

ClassMethod AddDish(ID As %Integer, DishID As %Integer) As %Status
{
   
    set order = ##class(Order.Orders).%OpenId(ID)

    if order.Status '= "создан" {
        Return $$$ERROR("заказ уже закрыт")
    }

    set id = ##class(Order.Utils).FindItemsInOrder(ID, DishID)
    
    if id '= -1 {
        set item = ##class(Order.DishList).%OpenId(id)
        set item.Count = item.Count + 1 
    } 
    else {
        set item = ##class(Order.DishList).%New()
        do item.OrderSetObjectId(ID)
        do item.ItemSetObjectId(DishID)
        set item.Count = 1
    }

    set result = item.%Save()
    return result
}

ClassMethod FindItemsInOrder(OrderID As %Integer, DishID As %Integer) As %Integer
{
    &sql(SELECT 
            ID, "Count", Item, Order
            INTO :id, :mycount, :item, :order
            FROM Order.DishList
            WHERE Order=:OrderID and Item=:DishID)
    IF SQLCODE=0 {
        Return id
    }
    ELSE {WRITE "SQLCODE=",SQLCODE,! }
    Return -1
}

ClassMethod GetDishList(Id As %Integer) As %String
{
    set data = []
    &sql(
        DECLARE MyCursor CURSOR FOR
        SELECT ID, "Count", Item->Name, Item->Price
        INTO :ID, :MyCount, :Name, :Price
        FROM Order.DishList
        WHERE Order = :Id
    )
    
    &sql(OPEN MyCursor)   
    FOR { 
        &sql(FETCH MyCursor)
        if (SQLCODE) quit
        set obj = {"id": (ID), "name": (Name), "price": (Price), "count": (MyCount)}
        do data.%Push(obj)
   }
   &sql(CLOSE MyCursor)
   return data
   quit
}

}
