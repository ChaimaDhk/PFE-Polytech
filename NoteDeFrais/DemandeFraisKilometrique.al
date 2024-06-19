/// <summary>
/// Page DemandeFraisKilometrique (ID 50120).
/// </summary>
page 50133 DemandeFraisKilometrique
{
    ApplicationArea = All;
    Caption = 'Demande de Frais Kilometrique';
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
                field("Type  de véhicule"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the type field.';
                    Caption = 'Type  de véhicule';

                    trigger OnLookup(var Text: Text): Boolean

                    begin
                        vehicule.Reset();
                        if Page.RunModal(Page::"ListVehicule", vehicule) = Action::LookupOK then
                            rec."Type" := vehicule."Nom";
                    end;
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

                            Rec."TTC1" := Rec."Distance totale parcourue (KM)" * vehicule.Coef;
                        END;
                    end;
                }
                field("Distance totale parcourue (KM)"; Rec."Distance totale parcourue (KM)")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Distance totale parcourue (KM) field.';



                }
                field("TTC (Devise)"; Rec."TTC1")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the TTC (Devise) field.';
                    Caption = 'TTC (EUR)';

                }
                field("Date de Début"; Rec."Date de Début")
                {
                    ToolTip = 'Specifies the value of the Date de Début field.';
                }
                field(DatedeReprise; Rec."Date de Fin")
                {
                    ToolTip = 'Specifies the value of the Date de Fin field.';
                    Caption = 'Date de Fin';
                }
                field(Commentaire; Rec.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commentaire field.';
                    MultiLine = true;
                }
            }
        }
    }
    var
        vehicule: Record Vehicule;
}
