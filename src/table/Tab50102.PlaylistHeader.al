table 50102 "Playlist Header"
{

    fields
    {
        //  This is the ID number for this instance of a radio show; its contents are user-defined
        field(1; "No."; Code[20]) { }

        // This is selected from the Radio Show table
        field(2; "Radio Show No."; Code[20])
        {
            trigger OnValidate()
            var
                RadioShow: Record "Radio Show";
            begin
                if RadioShow.Get("Radio Show No.") then begin
                    "PSAs Required" := RadioShow."PSAs Required";
                    "Ads Required" := RadioShow."Ads Required";
                    "News Required" := RadioShow."News Required";
                    "Sports Required" := RadioShow."Sports Required";
                    "Weather Required" := RadioShow."Weather Required";
                end else begin
                    "PSAs Required" := false;
                    "Ads Required" := false;
                    "News Required" := false;
                    "Sports Required" := false;
                    "Weather Required" := false;
                end;
            end;
        }

        // This is displayed by means of a FlowField from the Radio Show table
        field(3; Description; Text[50]) { }

        // This is the show's scheduled broadcast date; it also serves as the posting date for any data analysis filtering
        field(4; "Broadcast Date"; Date) { }

        // This is the show's scheduled broadcast start time
        field(5; "Start Time"; Time)
        {
            trigger OnValidate()
            var
                RadioShow: Record "Radio Show";
            begin
                RadioShow.Get("Radio Show No.");
                "End Time" := "Start Time" + RadioShow."Run Time";
            end;
        }

        // This is the show's scheduled broadcast end time
        field(6; "End Time"; Time) { }

        // This is the show's scheduled broadcast length, displayed by means of a FlowField from the Radio Show table
        field(7; Duration; Duration) { }

        // These show whether PSAs and advertisements are required for broadcast during the show; they are copied from the Radio Show table, but are editable by the user
        field(8; "PSAs Required"; Boolean) { }
        field(9; "Ads Required"; Boolean) { }

        // This checks whether each of these program segments are required during the show; they are copied from the Radio Show table, but are editable by the user
        field(10; "News Required"; Boolean) { }
        field(11; "Sports Required"; Boolean) { }
        field(12; "Weather Required"; Boolean) { }
    }

    procedure NWSRequired(Category: Option ,News,Weather,Sports): Integer
    var
        PlaylistLine: Record "Playlist Line";
        RadioShow: Record "Radio Show";
        RadioShowType: Record "Radio Show Type";
        Cnt: Integer;
    begin
        PlaylistLine.SetRange("Document No.", "No.");
        PlaylistLine.SetRange(Type, PlaylistLine.Type::Show);
        if PlaylistLine.FindSet then
            repeat
                RadioShow.get(PlaylistLine."No.");
                RadioShowType.get(RadioShow."Radio Show Type");
                case Category of
                    Category::News:
                        if RadioShowType.Code = 'News' then
                            Cnt += 1;
                    Category::Weather:
                        if RadioShowType.Code = 'Weather' then
                            Cnt += 1;
                    Category::Sports:
                        if RadioShowType.Code = 'Sports' then
                            Cnt += 1;
                end;
            until PlaylistLine.Next = 0;
    end;
}