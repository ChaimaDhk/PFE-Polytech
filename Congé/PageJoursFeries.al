/// <summary>
/// Page JoursFeries (ID 50120).
/// </summary>
page 50129 JoursFeries
{
    ApplicationArea = All;
    Caption = 'JoursFeries';
    PageType = List;
    SourceTable = "JourFeriés";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
