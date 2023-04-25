page 50107 "Listenership Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Listenership Entry";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("Ratings Source Entry No."; Rec."Ratings Source Entry No.") { ApplicationArea = All; }
                field(Date; Rec.Date) { ApplicationArea = All; }
                field("Start Time"; Rec."Start Time") { ApplicationArea = All; }
                field("End Time"; Rec."End Time") { ApplicationArea = All; }
                field("Radio Show No."; Rec."Radio Show No.") { ApplicationArea = All; }
                field("Listener Count"; Rec."Listener Count") { ApplicationArea = All; }
                field("Audience Share"; Rec."Audience Share") { ApplicationArea = All; }
                field("Age Demographic"; Rec."Age Demographic") { ApplicationArea = All; }
            }
        }
    }
}