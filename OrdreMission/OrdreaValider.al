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
                    Caption = 'Date de début';
                    Editable = false;
                }
                field(DateFin; Rec.DateFin)
                {
                    ToolTip = 'Specifies the value of the DateFin field.';
                    Caption = 'Date de fin';
                    Editable = false;
                }
                field("Employé"; Rec."Employé")
                {
                    ToolTip = 'Specifies the value of the Employé field.';

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


