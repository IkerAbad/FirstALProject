report 50101 "Shows by Type"
{
    WordLayout = './Shows by Type.docx';
    ApplicationArea = Basic;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    dataset
    {
        dataitem("Radio Show Type"; "Radio Show Type")
        {
            column(UserComment; UserComment) { }
            column(Code_RadioShowType; Code) { IncludeCaption = true; }
            column(Description_RadioShowType; Description) { IncludeCaption = true; }

            dataitem("RadioShow"; "Radio Show")
            {
                DataItemLink = "Radio Show Type" = FIELD(Code);
#pragma warning disable AL0254
                DataItemTableView = SORTING("Radio Show Type");
#pragma warning restore AL0254
                //PrintOnlyIfDetail = true;
                column(No_RadioShow; "No.") { IncludeCaption = true; }
                column(Name_RadioShow; Name) { IncludeCaption = true; }
                column(RunTime_RadioShow; "Run Time") { IncludeCaption = true; }
                dataitem(PlaylistHeader; "Playlist Header")
                {
                    DataItemLink = "Radio Show No." = FIELD("No.");
#pragma warning disable AL0254
                    DataItemTableView = SORTING("No.");
#pragma warning restore AL0254
                    column(PostingDate_PlaylistHeader; "Broadcast Date") { IncludeCaption = true; }
                    column(StartTime_PlaylistHeader; "Start Time") { IncludeCaption = true; }
                }
            }

        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(UserComment; UserComment)
                    {
                        ApplicationArea = Basic;
                        Caption = 'User Comment';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        ReportTitle = 'Show Schedule by Type';
    }

    var
        UserComment: Text;
}
