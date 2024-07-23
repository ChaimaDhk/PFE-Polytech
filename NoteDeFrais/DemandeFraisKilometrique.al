/// <summary>
/// Page Ajouter Frais Kilométrique (ID 50173).
/// </summary>
page 50173 DemandeFraisKilometrique
{
    ApplicationArea = All;
    Caption = 'Ajouter Frais Kilométrique';
    PageType = Card;
    SourceTable = fraiskilometrique;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(TitreFrais; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.', Comment = '%';
                }
                field("Départ"; Rec."Départ")
                {
                    ToolTip = 'Specifies the value of the Départ field.', Comment = '%';
                }
                field("Arrivée"; Rec."Arrivé")
                {
                    ToolTip = 'Specifies the value of the Arrivée field.', Comment = '%';
                }
                field("Type de véhicule"; Rec."Type")
                {
                    trigger OnLookup(var Text: Text): Boolean

                    begin
                        vehicule.Reset();
                        if Page.RunModal(Page::"ListVehicule", vehicule) = Action::LookupOK then
                            rec."Type" := vehicule.Nom;
                    end;
                    // ToolTip = 'Specifies the value of the Type de Vehicule field.', Comment = '%';
                }
                field("Distance Parcourue(KM)"; Rec."Distance Parcourue (KM)")
                {
                    ToolTip = 'Specifies the value of the Distance Parcourue(KM) field.', Comment = '%';
                }
                field("Nombre de trajets"; Rec."Nombre de trajets")
                {
                    trigger OnValidate()

                    begin
                        BEGIN
                            Rec."Distance Totale parcourue (KM)" := Rec."Distance Parcourue (KM)" * Rec."Nombre de trajets";

                            Rec."TTCdevise" := Rec."Distance Totale parcourue (KM)" * vehicule.Coef;
                        END;
                    end;
                    //ToolTip = 'Specifies the value of the Nombre de trajets field.', Comment = '%';
                }
                field("Distance Totale parcourue(KM)"; Rec."Distance Totale parcourue (KM)")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Distance Totale parcourue(KM) field.', Comment = '%';
                }
                field("TTC"; Rec."TTCdevise")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the TTC(EUR) field.', Comment = '%';
                }
                field("Date De Début"; Rec."Date De Début")
                {
                    ToolTip = 'Specifies the value of the Date De Début field.', Comment = '%';
                }
                field("Date De Fin"; Rec."Date De Fin")
                {
                    ToolTip = 'Specifies the value of the Date De Fin field.', Comment = '%';
                }
                field(Commentaire; Rec.Commentaire)
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Commentaire field.', Comment = '%';
                }

            }
        }
    }
    var
        vehicule: Record vehicule;
}
