Class Menu.Dishes Extends %Persistent
{

Property Name As %String;

Property CafeID As %Integer;

Property Description As %String;

Property Price As %Integer;

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
<Value>CafeID</Value>
</Value>
<Value name="4">
<Value>Description</Value>
</Value>
<Value name="5">
<Value>Price</Value>
</Value>
</Data>
<DataLocation>^Menu.DishesD</DataLocation>
<DefaultData>DishesDefaultData</DefaultData>
<IdLocation>^Menu.DishesD</IdLocation>
<IndexLocation>^Menu.DishesI</IndexLocation>
<StreamLocation>^Menu.DishesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
