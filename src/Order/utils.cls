Class Order.Utils
{

ClassMethod CreateDish(Obj As Order.Orders) As %Status
{
    set obj = ##class(Order.Orders).%New()
    set obj.Address = Obj.Address
    set obj.Dishes = []
    set obj.Prices = []
    set result = obj.%Save()
    Return result
}

}
