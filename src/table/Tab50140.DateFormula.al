table 50140 "Date Formula"
{

    fields
    {
        field(1; "Primary Key"; Code[10]) { }
        field(2; "Reference for Date Calculation"; Date)
        {
            trigger OnValidate()
            begin
                DateFormMgt.CalculateNewDate;
            end;

        }
        field(3; "Date Formula to Test"; DateFormula)
        {
            trigger OnValidate()
            begin
                DateFormMgt.CalculateNewDate;
            end;
        }
        field(4; "Date Result"; Date) { }

    }

    // local procedure CalculateNewDate()
    // begin
    //     "Date Result" := CalcDate("Date Formula to Test", "Reference for Date Calculation");
    // end;
    var
        DateFormMgt: Codeunit "Date Formula Mgt.";

}