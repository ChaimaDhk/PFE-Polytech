/// <summary>
/// Page MesFraisKilometrique (ID 50101).
/// </summary>
page 50134 MesFraisKilometrique
{
    ApplicationArea = All;
    Caption = 'MesFraisKilometrique';
    PageType = List;
    SourceTable = FraisKilometrique;
    UsageCategory = Administration;
    CardPageId = DemandeFraisKilometrique;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Titre; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                }
                field("Date de Début"; Rec."Date de Début")
                {
                    ToolTip = 'Specifies the value of the Date de Début field.';
                    Editable = false;
                }
                field("Date de Fin"; Rec."Date de Fin")
                {
                    ToolTip = 'Specifies the value of the Date de Fin field.';
                    Editable = false;
                }
                field(TTC; Rec.TTC)
                {
                    ToolTip = 'Specifies the value of the TTC (Devise) field.';
                }
                field("Distance totale parcourue (KM)"; Rec."Distance totale parcourue (KM)")
                {
                    ToolTip = 'Specifies the value of the Distance totale parcourue (KM) field.';
                }
                field("Type  de véhicule"; Rec."Type  de véhicule")
                {
                    ToolTip = 'Specifies the value of the Type de véhicule field.';
                }
                field(Commentaire; Rec.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commentaire field.';
                }
            }
        }
    }
}
