page 50111 "Radio Show Fans"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Radio Show Fan";

    layout
    {
        area(Content)
        {
            repeater(group1)
            {
                field(Name; Rec.Name) { ApplicationArea = All; }
                field("E-Mail"; Rec."E-Mail") { ApplicationArea = All; }
                field("Last Contacted"; Rec."Last Contacted") { ApplicationArea = All; }
                field(Address; Rec.Address) { ApplicationArea = All; }
                field("Post Code"; Rec."Post Code") { ApplicationArea = All; }
                field(City; Rec.City) { ApplicationArea = All; }
                field("Country/Region Code"; Rec."Country/Region Code") { ApplicationArea = All; }
            }
        }
    }
}