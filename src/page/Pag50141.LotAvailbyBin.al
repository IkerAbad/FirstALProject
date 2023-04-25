page 50141 "Lot Avail. by Bin"
{
    PageType = List;
    SourceTable = "Warehouse Entry";
    SourceTableTemporary = true;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = Basic; Visible = false; }
                field("Item No."; Rec."Item No.") { ApplicationArea = Basic; }
                field("Location Code"; Rec."Location Code") { ApplicationArea = Basic; }
                field("Bin Code"; Rec."Bin Code") { ApplicationArea = Basic; }
                field("Serial No."; Rec."Serial No.") { ApplicationArea = Basic; }
                field(Quantity; Rec.Quantity) { ApplicationArea = Basic; }
            }
        }
    }

    trigger OnOpenPage()
    var
        LotAvail: Query "Lot Avail. by Bin";
    begin
        LotAvail.Open;
        while LotAvail.Read do begin
            Rec.Init;
            Rec."Entry No." := Rec."Entry No." + 1;
            Rec."Item No." := LotAvail.Item_No;
            Rec."Location Code" := LotAvail.Location_Code;
            Rec."Bin Code" := LotAvail.Bin_Code;
            Rec.Quantity := LotAvail.Sum_Quantity;
            Rec.Insert;
        end;
    end;
}

