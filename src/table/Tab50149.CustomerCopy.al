table 50149 "Customer Copy"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20]) { DataClassification = ToBeClassified; }
        field(2; Name; Text[20]) { DataClassification = ToBeClassified; }
        field(3; "Name 2"; Text[20]) { DataClassification = ToBeClassified; }
        field(4; "Fecha alta"; DateTime) { DataClassification = ToBeClassified; }
        field(5; "Fecha modificación"; DateTime) { DataClassification = ToBeClassified; }
        field(6; "Post Code"; Code[10]) { DataClassification = ToBeClassified; }
        field(7; City; Text[20]) { DataClassification = ToBeClassified; }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}