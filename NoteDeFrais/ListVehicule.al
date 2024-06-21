/// <summary>
/// Page ListVehicule (ID 50110).
/// </summary>
page 50110 ListVehicule
{
    ApplicationArea = All;
    Caption = 'List des vehicules';
    PageType = List;
    SourceTable = Vehicule;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(IdVehicule; Rec.IdVehicule)
                {
                    ToolTip = 'Specifies the value of the id field.', Comment = '%';
                }
                field(Nom; Rec.Nom)
                {
                    Caption = 'Marque';
                    ToolTip = 'Specifies the value of the Nom field.', Comment = '%';
                }
                field(Type; Rec.Type1)
                {
                    ToolTip = 'Specifies the value of the type field.', Comment = '%';
                }
                field(Coef; Rec.Coef)
                {
                    ToolTip = 'Specifies the value of the coef field.', Comment = '%';
                }
            }
        }
    }
}
