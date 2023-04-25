page 50110 "Radio Show Fan Factbox"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Radio Show Fan";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; Rec.Name) { ApplicationArea = Basic; }
                field("E-Mail"; Rec."E-Mail") { ApplicationArea = Basic; }
                field("Last Contacted"; Rec."Last Contacted") { ApplicationArea = Basic; }
            }
        }
    }
}