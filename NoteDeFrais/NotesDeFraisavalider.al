/// <summary>
/// Page NotesDeFraisavalider (ID 50135).
/// </summary>
page 50135 NotesDeFraisavalider
{
    ApplicationArea = All;
    Caption = 'Notes de frais valider';
    PageType = List;
    SourceTable = NotesDeFrais;
    UsageCategory = Administration;
    SourceTableView = where(Statut = const("Validée"));
    Editable = false;

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
                field(DateDebut; Rec.DateDebut)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                    Caption = 'Date de Debut';
                    Editable = false;
                }
                field(DateFin; Rec.DateFin)
                {
                    ToolTip = 'Specifies the value of the DateFin field.';
                    Caption = ' Date de fin';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Statut; Rec.Statut)
                {
                    ToolTip = 'Specifies the value of the Statut field.';
                }
            }
        }
    }

}



