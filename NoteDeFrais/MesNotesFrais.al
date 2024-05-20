/// <summary>
/// Page MesNotesFrais (ID 50101).
/// </summary>
page 50113 MesNotesFrais
{
    ApplicationArea = All;
    Caption = 'Mes Notes de Frais';
    PageType = List;
    SourceTable = NotesDeFrais;
    CardPageId = "DemandeNotesFrais";
    ModifyAllowed = false;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(IdNote; Rec.IdNote)
                {
                    ToolTip = 'Specifies the value of the IdNote field.';
                }
                field(DateDebut; Rec.DateDebut)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                    Editable = false;
                }
                field(DateFin; Rec.DateFin)
                {
                    ToolTip = 'Specifies the value of the DateFin field.';
                    Editable = false;
                }
                field(Titre; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Statut; Rec.Statut)
                {
                    ToolTip = 'Specifies the value of the Statut field.';
                    Editable = false;
                }
            }
        }
    }

}