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
        field(6; "Post Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            // Trigger OnValidate
        }
        field(7; City; Text[20])
        {
            DataClassification = ToBeClassified;

            //TableRelation = IF ("" = CONST('')) "Post Code".City ELSE
            //IF ("Country/Region Code" = FILTER(<> '')) "Post Code".Code WHERE("" = FIELD(""));
            //This property is currently not supported

            /*
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                OnBeforeLookupCity(Rec, PostCode);

                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");

                OnAfterLookupCity(Rec, PostCode);
            end;

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidateCity(Rec, PostCode, CurrFieldNo, IsHandled);
                if not IsHandled then
                    PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);

                OnAfterValidateCity(Rec, xRec);
            end;
            */
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Fecha alta" := CurrentDateTime;
    end;

    trigger OnModify()
    begin

        "Fecha modificación" := CurrentDateTime;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}