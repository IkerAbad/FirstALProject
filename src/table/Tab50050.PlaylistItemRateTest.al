table 50050 "Playlist Item Rate Test"
{
    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(2; Name; Text[50]) { }
        field(3; Description; Text[250]) { }
        field(4; Score; Option) { OptionMembers = "Very Good",Good,Medium,Bad; }
    }

    keys
    {
        key(PK; "No.") { }
    }
}