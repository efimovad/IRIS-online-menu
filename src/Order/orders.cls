Class Order.Orders Extends %Persistent
{

Property Address As %String;

Property Dish As list Of Dish.Dishes;

Storage Default
{
<Data name="OrdersDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Address</Value>
</Value>
<Value name="3">
<Value>Dishes</Value>
</Value>
<Value name="4">
<Value>Prices</Value>
</Value>
<Value name="5">
<Value>Dish</Value>
</Value>
</Data>
<DataLocation>^Order.OrdersD</DataLocation>
<DefaultData>OrdersDefaultData</DefaultData>
<IdLocation>^Order.OrdersD</IdLocation>
<IndexLocation>^Order.OrdersI</IndexLocation>
<StreamLocation>^Order.OrdersS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
