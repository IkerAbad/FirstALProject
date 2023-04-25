table 50103 "Playlist Line"
{

    fields
    {
        // This is the automatically assigned link to the No. field in the parent Playlist record (the automatic assignment is based on the page, Playlist Subpage properties, which we'll take care of when working on the Playlist pages)
        field(1; "Document No."; Code[20]) { }

        // This is an automatically assigned number (based on page properties), and the rightmost field in the Playlist Line primary key
        field(2; "Line No."; Integer) { }

        // This is a user-selected Option that defines whether this entry is a Resource, such as an announcer; a Show, such as a news show; or an Item, such as a recording to play on the air
        field(3; Type; Option) { OptionMembers = ,Resource,Show,Item; }

        // This is the ID number of the selected entry in its parent table
        field(4; "No."; Code[20])
        {
            TableRelation = IF (Type = const(Resource)) Resource."No."
            ELSE
            IF (Type = const(Show)) "Radio Show"."No."
            ELSE
            IF (Type = const(Item)) Item."No.";
        }

        // This is information from the Item table for a show or recording
        field(5; "Data Format"; Option) { OptionMembers = ,Vinyl,CD,MP3,PSA,Advertisement; }

        // 
        field(6; "Publisher"; Code[10]) { }

        // This is assigned from the parent table, but can be edited by the user
        field(7; "Description"; Text[50]) { }

        //This is information about a show or recording that indicates the length and its position within the schedule of this Radio Show
        field(8; Duration; Duration) { Editable = false; }
        field(9; "Start Time"; Time)
        {
            trigger OnValidate()
            begin
                if Duration <> 0 then
                    "End Time" := "Start Time" + Duration;
            end;
        }
        field(10; "End Time"; Time)
        {
            trigger OnValidate()
            begin
                if "Start Time" <> 0T then
                    Duration := "End Time" - "Start Time";
            end;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.") { Clustered = true; }
    }
}