table 50100 "Radio Show"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            trigger OnValidate()
            begin

            end;

            trigger OnLookup()
            begin

            end;
        }
        field(2; "Radio Show Type"; Code[10]) { TableRelation = "Radio Show Type"; }
        field(3; "Name"; Text[50]) { }
        field(4; "Run Time"; Duration) { }
        field(5; "Host Code"; Code[20]) { }
        field(6; "Host Name"; Text[50]) { }
        field(7; "Average Listeners"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = average("Listenership Entry"."Listener Count"
            where("Radio Show No." = field("No."), Date = field("Date Filter")));
        }
        field(8; "Audience Share"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = average("Listenership Entry"."Audience Share"
            where("Radio Show No." = field("No."), Date = field("Date Filter")));
        }
        field(9; "Advertising Revenue"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Radio Show Entry"."Fee Amount"
            where(
                "Radio Show No." = field("No."),
                "Data Format" = filter(Advertisement)
            ));
        }
        field(10; "Royalty Cost"; Decimal) { }
        field(11; "Frecuency"; Option) { OptionMembers = Hourly,Daily,Weekly,Monthly; }
        field(12; "PSA Planned Quantity"; Integer) { }
        field(13; "PSAs Required"; Boolean) { }
        field(14; "PSA Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Playlist Line" where
                ("No." = field("No."), Type = const(Item), "Data Format" = const(PSA)));
            Editable = false;
        }
        field(15; "Ads Planned Quantity"; Integer) { }
        field(16; "Ads Required"; Boolean) { }
        field(17; "Ads Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Playlist Line" where
            ("No." = field("No."), Type = const(Item), "Data Format" = const(Advertisement)));
            Editable = false;
        }
        field(18; "News Required"; Boolean) { InitValue = true; }
        field(19; "News Duration"; Duration) { }
        field(20; "Sports Required"; Boolean) { InitValue = true; }
        field(21; "Sports Duration"; Duration) { }
        field(22; "Weather Required"; Boolean) { InitValue = true; }
        field(23; "Weather Duration"; Duration) { }
        field(24; "Date Filter"; Date) { FieldClass = FlowFilter; }
    }
    keys
    {
        key(PK; "No.") { }
        key(Name; "Name") { }
        key(HostName; "Host Name") { }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, "Host Name") { }
        fieldgroup(Brick; "No.", Name, "Audience Share") { }
    }
}