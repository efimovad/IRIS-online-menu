Class Comment.Utils
{

ClassMethod GetCommentList(CafeId As %Integer) As %String
{
    set data = []
    &sql(
        DECLARE MyCursor CURSOR FOR
        SELECT ID, Text, Grade
        INTO :ID, :Text, :Grade
        FROM Comment.Comments
        WHERE Cafe = :CafeId
    )
    
    &sql(OPEN MyCursor)   
    FOR { 
        &sql(FETCH MyCursor)
        if (SQLCODE) quit
        set obj = {"id": (ID), "text": (Text), "grade": (Grade)}
        do data.%Push(obj)
   }
   &sql(CLOSE MyCursor)
   return data
   quit
}

}
