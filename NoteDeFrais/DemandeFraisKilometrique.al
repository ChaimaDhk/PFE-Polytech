/// <summary>
/// Page DemandeFraisKilometrique (ID 50120).
/// </summary>
page 50133 DemandeFraisKilometrique
{
    ApplicationArea = All;
    Caption = 'DemandeFraisKilometrique';
    PageType = Card;
    SourceTable = FraisKilometrique;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Titre; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                }
                field("Départ"; Rec."Départ")
                {
                    ToolTip = 'Specifies the value of the Départ field.';
                }
                field("Arrivé"; Rec."Arrivé")
                {
                    ToolTip = 'Specifies the value of the Arrivé field.';
                }
                field("Type  de véhicule"; Rec."Type  de véhicule")
                {
                    ToolTip = 'Specifies the value of the Type de véhicule field.';
                }
                field("Distance parcourue (KM)"; Rec."Distance parcourue (KM)")
                {
                    ToolTip = 'Specifies the value of the Distance parcourue (KM) field.';
                }
                field("Nombre de trajets"; Rec."Nombre de trajets")
                {
                    ToolTip = 'Specifies the value of the Nombre de trajets field.';
                    trigger OnValidate()
                    begin
                        BEGIN
                            Rec."Distance totale parcourue (KM)" := Rec."Distance parcourue (KM)" * Rec."Nombre de trajets";
                        END;
                    end;
                }
                field("Distance totale parcourue (KM)"; Rec."Distance totale parcourue (KM)")
                {
                    ToolTip = 'Specifies the value of the Distance totale parcourue (KM) field.';

                }
                field("TTC (Devise)"; Rec."TTC")
                {
                    ToolTip = 'Specifies the value of the TTC (Devise) field.';
                }
                field("Date de Début"; Rec."Date de Début")
                {
                    ToolTip = 'Specifies the value of the Date de Début field.';
                }
                field(DatedeReprise; Rec."Date de Fin")
                {
                    ToolTip = 'Specifies the value of the Date de Fin field.';
                }
                field(Commentaire; Rec.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commentaire field.';
                }
            }
        }
    }
}
