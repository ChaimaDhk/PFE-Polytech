/// <summary>
/// Page TitreCongé (ID 50136).
/// </summary>
page 50136 "TitreCongé"
{
    ApplicationArea = All;
    Caption = 'Mes Titres de congé';
    PageType = List;
    SourceTable = Conges;
    UsageCategory = Administration;
    SourceTableView = where("Approval Status" = filter(Validée | Transmise));
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Id Congé"; Rec."Id Congé")
                {
                    ToolTip = 'Specifies the value of the IdCongé field.';
                }
                field(DatedeDebut; Rec.DatedeDebut)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                    Caption = 'Date de Début';
                }
                field(DatedeReprise; Rec.DatedeReprise)
                {
                    ToolTip = 'Specifies the value of the dateReprise field.';
                    Caption = 'Date de reprise';
                }
                field("Nombre de Jours"; Rec."Nombre de Jours")
                {
                    ToolTip = 'Specifies the value of the NombreJours field.';
                    Caption = 'Nombre de Jours';
                }
                field(Statut; Rec."Approval Status")
                {
                    ToolTip = 'Specifies the value of the Statut field.';
                }
            }
        }
    }
}
