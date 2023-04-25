page 50050 "Playlist Item Rate Test"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Playlist Item Rate Test";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { ApplicationArea = Basic; Visible = false; }
                field(Name; Rec.Name) { ApplicationArea = Basic; }
                field(Description; Rec.Description) { MultiLine = true; ApplicationArea = Basic; }
                field(Score; Rec.Score) { ApplicationArea = Basic; }
            }

            // repeater(Group2)
            // {
            //     field("No.2"; Rec."No.") { ApplicationArea = Basic; Visible = false; }
            //     field(Name2; Rec.Name) { ApplicationArea = Basic; }
            //     field(Description2; Rec.Description) { MultiLine = true; ApplicationArea = Basic; }
            //     field(Score2; Rec.Score) { ApplicationArea = Basic; }
            // }

            // group(Group3)
            // {
            //     field("No.3"; Rec."No.") { ApplicationArea = Basic; Visible = false; }
            //     field(Name3; Rec.Name) { ApplicationArea = Basic; }
            //     field(Description3; Rec.Description) { MultiLine = true; ApplicationArea = Basic; }
            //     field(Score3; Rec.Score) { ApplicationArea = Basic; }
            // }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

}