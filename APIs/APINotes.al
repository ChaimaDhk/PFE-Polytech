/// <summary>
/// Page APINotes (ID 50127).
/// </summary>
page 50127 APINotes
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Aiventu';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'apiNotes';
    DelayedInsert = true;
    EntityName = 'NotesDeFrais';
    EntitySetName = 'NotesDeFraisSet';
    PageType = API;
    SourceTable = NotesDeFrais;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(dateDebut; Rec.DateDebut)
                {
                    Caption = 'Date deDebut';
                }
                field(dateFin; Rec.DateFin)
                {
                    Caption = 'Date de Fin';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(idNote; Rec.IdNote)
                {
                    Caption = 'Id de Note';
                }
                field(mission; Rec.Mission)
                {
                    Caption = 'Ordre de Mission';
                }
                field(statut; Rec.Statut)
                {
                    Caption = 'Statut';
                }
                field(titre; Rec.Titre)
                {
                    Caption = 'Titre';
                }
                field(titreDepense; Rec.TitreDepense)
                {
                    Caption = 'Titre de Dépense';
                }
                field(titrefrais; Rec.Titrefrais)
                {
                    Caption = 'Titre de Frais kilométrique';
                }
            }
        }
    }
}
