page 50148 "Customer Copy"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Copy";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
                field("Name 2"; Rec."Name 2") { ApplicationArea = All; }
                field("Fecha alta"; Rec."Fecha alta") { ApplicationArea = All; }
                field("Fecha modificación"; Rec."Fecha modificación") { ApplicationArea = All; }
                field("Post Code"; Rec."Post Code") { ApplicationArea = All; }
                field(City; Rec.City) { ApplicationArea = All; }
            }
        }
    }
}