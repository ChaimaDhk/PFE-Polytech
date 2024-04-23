/// <summary>
/// Page OrdreaValider (ID 50144).
/// </summary>
page 50149 OrdreaValider
{
    ApplicationArea = All;
    Caption = 'OrdreaValider';
    PageType = List;
    SourceTable = Mission;
    UsageCategory = Administration;
    SourceTableView = where(Statut = const(Transmise));
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
                }
                field(DateDebut; Rec.DateDebut)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                }
                field(DateFin; Rec.DateFin)
                {
                    ToolTip = 'Specifies the value of the DateFin field.';
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
