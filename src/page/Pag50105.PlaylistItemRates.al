page 50105 "Playlist Item Rates"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Playlist Item Rate";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Source Type"; Rec."Source Type") { ApplicationArea = All; }
                field("Source No."; Rec."Source No.") { ApplicationArea = All; }
                field("Item No."; Rec."Item No.") { ApplicationArea = All; }
                field("Start Time"; Rec."Start Time") { ApplicationArea = All; }
                field("End Time"; Rec."End Time") { ApplicationArea = All; }
                field("Rate Amount"; Rec."Rate Amount") { ApplicationArea = All; }
                field("Publisher Code"; Rec."Publisher Code") { ApplicationArea = All; }
            }
        }
    }
}