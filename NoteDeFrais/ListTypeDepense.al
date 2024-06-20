/// <summary>
/// Page ListTypeDépense (ID 50128).
/// </summary>
page 50128 "ListTypeDépense"
{
    ApplicationArea = All;
    Caption = 'ListTypeDépense';
    PageType = List;
    SourceTable = "TypeDépense";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(IdTypeDepense; Rec.IdTypeDepense)
                {
                    ToolTip = 'Specifies the value of the id field.', Comment = '%';
                }
                field(Nom; Rec.Nom)
                {
                    Caption = 'Marque';
                    ToolTip = 'Specifies the value of the Nom field.', Comment = '%';
                }
            }
        }
    }
}
