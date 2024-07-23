/// <summary>
/// Page PowerApps (ID 50200).
/// </summary>
page 50200 PowerApps
{
    ApplicationArea = All;
    Caption = 'PowerApps';
    PageType = List;
    SourceTable = PowerApps;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Id; Rec.Id)
                {
                    ToolTip = 'Specifies the value of the Id field.', Comment = '%';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("Type  de véhicule"; Rec."Type  de véhicule")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("TypeCongé"; Rec."TypeCongé")
                {
                    ToolTip = 'Specifies the value of the Type de Congé field.', Comment = '%';
                }
                field("Moyens de paiement"; Rec."Moyens de paiement")
                {
                    ToolTip = 'Specifies the value of the Moyens de paiement field.', Comment = '%';
                }
            }
        }
    }
}
