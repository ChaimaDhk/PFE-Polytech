/// <summary>
/// Page OrdreaValider (ID 50144).
/// </summary>
page 50149 OrdreaValider
{
    ApplicationArea = All;
    Caption = 'Les Ordre de mission Valider';
    PageType = List;
    SourceTable = Mission;
    UsageCategory = Administration;
    SourceTableView = where(Statut = const("Validée"));
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Titre; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                    Editable = false;
                }
                field(DateDebut; Rec.DateDebut)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                    Caption = 'Date de début';
                    Editable = false;
                }
                field(DateFin; Rec.DateFin)
                {
                    ToolTip = 'Specifies the value of the DateFin field.';
                    Caption = 'Date de fin';
                    Editable = false;
                }

                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    Editable = false;
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


