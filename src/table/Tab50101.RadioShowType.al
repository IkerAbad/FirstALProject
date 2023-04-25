/// <summary>
/// Table Radio Show Type (ID 50101).
/// Subsidiary Table
/// </summary>
table 50101 "Radio Show Type"
{
    LookupPageId = "Radio Show Type";
    DrillDownPageId = "Radio Show Type";

    fields
    {
        field(1; Code; Code[20]) { }
        field(2; Description; Text[50]) { }
    }
}