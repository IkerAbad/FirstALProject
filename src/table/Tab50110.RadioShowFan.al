table 50110 "Radio Show Fan"
{
    // DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer) { AutoIncrement = true; }
        field(2; "Radio Show No."; Code[20]) { }
        field(3; Name; Text[50]) { }
        field(4; "E-Mail"; Text[250]) { }
        field(5; "Last Contacted"; Date) { }
        field(6; Address; Text[50]) { }
        field(7; "Address 2"; Text[50]) { }
        field(8; City; Text[50]) { }
        field(9; "Country/Region Code"; Code[10]) { }
        field(10; County; Text[30]) { }
        field(11; "Post Code"; Code[20])
        {
            trigger OnValidate()
            var
                PostCode: Record "Post Code";
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code",
                    (CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(12; Gender; Option) { OptionMembers = ,Male,Female; }
        field(13; "Birth Date"; Date) { }
    }

    /*
        keys
        {
            key(PK; "No.") { }
        }
    */
}