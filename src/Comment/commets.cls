Class Comment.Comments Extends %Persistent
{

Property Text As %String;

Property Grade As %Integer;

Property Cafe As Cafe.Places;

Storage Default
{
<Data name="CommentsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Text</Value>
</Value>
<Value name="3">
<Value>Grade</Value>
</Value>
<Value name="4">
<Value>Cafe</Value>
</Value>
</Data>
<DataLocation>^Comment.CommentsD</DataLocation>
<DefaultData>CommentsDefaultData</DefaultData>
<IdLocation>^Comment.CommentsD</IdLocation>
<IndexLocation>^Comment.CommentsI</IndexLocation>
<StreamLocation>^Comment.CommentsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
