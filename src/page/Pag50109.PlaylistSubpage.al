page 50109 "Playlist Subpage"
{
    PageType = ListPart;
    SourceTable = "Playlist Line";
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                //field("Document No."; Rec."Document No.") { ApplicationArea = Basic; }
                //field("Line No."; Rec."Line No.") { ApplicationArea = Basic; }
                field(Type; Rec.Type) { ApplicationArea = Basic; }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    /*
                                        trigger OnValidate()
                                        begin
                                            case Type of
                                                Type::Resource:
                                                    begin
                                                        Res.Get("No.");
                                                        Description := Res.Name;
                                                    end;
                                                Type::Item:
                                                    begin
                                                        Item.Get("No.");
                                                        Description := item.Description;
                                                        "Data Format" := item."Data Format";
                                                        Duration := item.Duration;
                                                    end;
                                                Type::Show:
                                                    begin
                                                        RadioShow.Get("No.");
                                                        Description := RadioShow.Name;
                                                    end;
                                            end;
                                        end;
                    */
                }
                field("Data Format"; Rec."Data Format") { ApplicationArea = Basic; }
                field(Publisher; Rec.Publisher) { ApplicationArea = Basic; }
                field(Description; Rec.Description) { ApplicationArea = Basic; }
                field(Duration; Rec.Duration) { ApplicationArea = Basic; }
                field("Start Time"; Rec."Start Time") { ApplicationArea = Basic; }
                field("End Time"; Rec."End Time") { ApplicationArea = Basic; }
            }
        }
    }
}