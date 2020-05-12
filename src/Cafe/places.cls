Class Cafe.Places Extends %Persistent
{

Property Name As %String;

Property Address As %String;

Property Phone As %String;

Property MinPrice As %Integer;

Storage Default
{
<Data name="PlacesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Address</Value>
</Value>
<Value name="4">
<Value>Phone</Value>
</Value>
<Value name="5">
<Value>MinPrice</Value>
</Value>
</Data>
<DataLocation>^Cafe.PlacesD</DataLocation>
<DefaultData>PlacesDefaultData</DefaultData>
<IdLocation>^Cafe.PlacesD</IdLocation>
<IndexLocation>^Cafe.PlacesI</IndexLocation>
<StreamLocation>^Cafe.PlacesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
