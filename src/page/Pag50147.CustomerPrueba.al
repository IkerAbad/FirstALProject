page 50147 "Customer Prueba"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
                field("Balance (LCY)"; Rec."Balance (LCY)") { ApplicationArea = All; }
                //field("Balance Due"; Rec."Balance Due") { ApplicationArea = All; }
                //field("Balance Due (LCY)"; Rec."Balance Due (LCY)") { ApplicationArea = All; }

            }
        }
    }
}