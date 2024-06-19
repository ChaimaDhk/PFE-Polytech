/// <summary>
/// Page DemandeNotesFrais (ID 50102).
/// </summary>
page 50114 DemandeNotesFrais
{
    ApplicationArea = All;
    Caption = 'Demande Notes de Frais';
    PageType = Card;
    SourceTable = NotesDeFrais;

    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(DateDebut; Rec.DateDebut)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                    Caption = 'Date de début';
                }
                field(DateFin; Rec.DateFin)
                {
                    ToolTip = 'Specifies the value of the DateFin field.';
                    Caption = 'Date de Fin';
                }
                field(Titre; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {

            action("Imprimer")
            {
                ApplicationArea = All;
                Caption = 'Imprimer';
                Image = Print;
                RunObject = Report 50135; // Spécifiez ici le numéro de votre rapport d'impression
            }
        }
    }
}
