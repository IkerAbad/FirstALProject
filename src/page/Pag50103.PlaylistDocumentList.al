page 50103 "Playlist Document List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Playlist Header";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.") { ApplicationArea = Basic; }
                field(Description; Rec.Description) { ApplicationArea = Basic; }
                field("Radio Show No."; Rec."Radio Show No.")
                {
                    ApplicationArea = Basic;
                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Start Time"; Rec."Start Time") { ApplicationArea = Basic; }
                field("End Time"; Rec."End Time") { ApplicationArea = Basic; }
                field("Broadcast Date"; Rec."Broadcast Date") { ApplicationArea = Basic; }
                field(Duration; Rec.Duration) { ApplicationArea = Basic; }
            }
        }
    }
}