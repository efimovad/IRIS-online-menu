Class Order.DishList Extends %Persistent
{

Property Order As Order.Orders;

Property Item As Dish.Dishes;

Property Count As %Integer;

Storage Default
{
<Data name="DishListDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Item</Value>
</Value>
<Value name="3">
<Value>Count</Value>
</Value>
<Value name="4">
<Value>Order</Value>
</Value>
</Data>
<DataLocation>^Order.DishListD</DataLocation>
<DefaultData>DishListDefaultData</DefaultData>
<IdLocation>^Order.DishListD</IdLocation>
<IndexLocation>^Order.DishListI</IndexLocation>
<StreamLocation>^Order.DishListS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
