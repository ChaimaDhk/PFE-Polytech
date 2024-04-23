/// <summary>
/// Page MesOrdres (ID 50146).
/// </summary>
page 50146 MesOrdres
{
    ApplicationArea = All;
    Caption = 'MesOrdres';
    PageType = List;
    SourceTable = Mission;
    UsageCategory = Administration;
    InsertAllowed = false;
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
                }
                field(DateFin; Rec.DateFin)
                {
                    ToolTip = 'Specifies the value of the DateFin field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Statut"; Rec.Statut)
                {
                    ToolTip = 'Specifies the value of the Statut field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Ajouter un Ordre de mission")
            {
                ApplicationArea = All;
                Caption = 'Ajouter un Ordre de mission';
                RunObject = Page "DemandeOrdre";
            }
        }

    }
}
