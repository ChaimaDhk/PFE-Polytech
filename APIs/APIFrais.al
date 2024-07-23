/// <summary>
/// Page APIFrais (ID 50131).
/// </summary>
page 50204 APIFrais
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Aiventu';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'apiFrais';
    DelayedInsert = true;
    EntityName = 'FraisKilometrique';
    EntitySetName = 'FraisKilometriqueSet';
    PageType = API;
    SourceTable = FraisKilometrique;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(arriv; Rec."Arrivé")
                {
                    Caption = 'Arrivé';
                }
                field(commentaire; Rec.Commentaire)
                {
                    Caption = 'Commentaire';
                }
                field(dateDeDBut; Rec."Date de Début")
                {
                    Caption = 'Date de Début';
                }
                field(dateDeFin; Rec."Date de Fin")
                {
                    Caption = 'Date de Fin';
                }
                field(distanceParcourueKM; Rec."Distance parcourue (KM)")
                {
                    Caption = 'Distance parcourue (KM)';
                }
                field(distanceTotaleParcourueKM; Rec."Distance totale parcourue (KM)")
                {
                    Caption = 'Distance totale parcourue (KM)';
                }
                field(dPart; Rec."Départ")
                {
                    Caption = 'Départ';
                }
                field(idFrais; Rec.IdFrais)
                {
                    Caption = 'Id Depense';
                }
                field(nombreDeTrajets; Rec."Nombre de trajets")
                {
                    Caption = 'Nombre de trajets';
                }
                field(ttc; Rec.TTC)
                {
                    Caption = 'TTC';
                }
                field(ttc1; Rec.TTC1)
                {
                    Caption = 'TTC1';
                }
                field(titre; Rec.Titre)
                {
                    Caption = 'Titre';
                }
                field("type"; Rec."Type")
                {
                    Caption = 'Type  de véhicule';
                }
                field(typeDeVHicule; Rec."Type  de véhicule")
                {
                    Caption = 'Type';
                }
            }
        }
    }
}
