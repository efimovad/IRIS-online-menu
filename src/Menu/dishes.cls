Class Dish.Dishes Extends %Persistent
{

Property Name As %String;

Property Description As %String;

Property Price As %Integer;

Property Cafe As Cafe.Places;

Storage Default
{
<Data name="DishesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Description</Value>
</Value>
<Value name="4">
<Value>Price</Value>
</Value>
<Value name="5">
<Value>Cafe</Value>
</Value>
</Data>
<DataLocation>^Dish.DishesD</DataLocation>
<DefaultData>DishesDefaultData</DefaultData>
<IdLocation>^Dish.DishesD</IdLocation>
<IndexLocation>^Dish.DishesI</IndexLocation>
<StreamLocation>^Dish.DishesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
