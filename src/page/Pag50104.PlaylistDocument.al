page 50104 "Playlist Document"
{
    PageType = Document;
    ApplicationArea = Basic;
    UsageCategory = Documents;
    SourceTable = "Playlist Header";

    layout
    {
        area(Content)
        {
            group(Group)
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
            part(lines; "Playlist Subpage")
            {
                SubPageLink = "Document No." = FIELD("No.");
                SubPageView = SORTING("Document No.", "Line No.");
            }
        }
        area(Factboxes)
        {
            part(factbox; "Playlist Factbox")
            {
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }
}