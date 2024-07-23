/// <summary>
/// Page APIMission (ID 50126).
/// </summary>
page 50260 APIMissionVal
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Aiventu';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'apiMissionval';
    DelayedInsert = true;
    EntityName = 'Missionval';
    EntitySetName = 'MissionSetVal';
    PageType = API;
    SourceTable = Mission;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(employ; Rec."Employé")
                {
                    Caption = 'Employé';
                }
                field(idOrdre; Rec.IdOrdre)
                {
                    Caption = 'Id Ordre';
                }
                field(dateDebut; Rec.DateDebut)
                {
                    Caption = 'Date de Debut';
                }
                field(dateFin; Rec.DateFin)
                {
                    Caption = 'Date de Fin';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(pays; Rec.Pays)
                {
                    Caption = 'Pays';
                }
                field(statut; Rec.Statut)
                {
                    Caption = 'Statut';
                }
                field(titre; Rec.Titre)
                {
                    Caption = 'Titre';
                }
                field("type"; Rec."Type")
                {
                    Caption = 'Type';
                }
            }
        }
    }
}
