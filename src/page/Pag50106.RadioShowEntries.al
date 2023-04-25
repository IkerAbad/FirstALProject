page 50106 "Radio Show Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Radio Show Entry";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("Radio Show No."; Rec."Radio Show No.") { ApplicationArea = All; }
                field(Type; Rec.Type) { ApplicationArea = All; }
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Data Format"; Rec."Data Format") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field(Date; Rec.Date) { ApplicationArea = All; }
                field(Time; Rec.Time) { ApplicationArea = All; }
                field(Duration; Rec.Duration) { ApplicationArea = All; }
                field("Fee Amount"; Rec."Fee Amount") { ApplicationArea = All; }
                field("ACSAP ID"; Rec."ACSAP ID") { ApplicationArea = All; }
                field("Publisher Code"; Rec."Publisher Code") { ApplicationArea = All; }
            }
        }
    }
}