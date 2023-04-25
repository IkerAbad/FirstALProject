page 50112 "Playlist Factbox"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Playlist Header";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("PSAs Required"; Rec."PSAs Required") { ApplicationArea = All; }
                //field("PSA Count"; Rec."PSA Count") { ApplicationArea = All; }
                field("Ads Required"; Rec."Ads Required") { ApplicationArea = All; }
                //field("Ads Count"; Rec."Ads Count") { ApplicationArea = All; }
                field("News Required"; Rec."News Required") { ApplicationArea = All; }
                field("Weather Required"; Rec."Weather Required") { ApplicationArea = All; }
                field("Sports Required"; Rec."Sports Required") { ApplicationArea = All; }
                field(NewsCount; Rec.NWSRequired(1)) { ApplicationArea = All; }
                field(WeatherCount; Rec.NWSRequired(2)) { ApplicationArea = All; }
                field(SportsCount; Rec.NWSRequired(3)) { ApplicationArea = All; }

            }
        }
    }
}