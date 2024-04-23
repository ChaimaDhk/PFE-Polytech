/// <summary>
/// Page TitreCongé (ID 50136).
/// </summary>
page 50136 "TitreCongé"
{
    ApplicationArea = All;
    Caption = 'TitreCongé';
    PageType = List;
    SourceTable = Conges;
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

                field("Id Congé"; Rec."Id Congé")
                {
                    ToolTip = 'Specifies the value of the IdCongé field.';
                }
                field(DatedeDebut; Rec.DatedeDebut)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                }
                field(DatedeReprise; Rec.DatedeReprise)
                {
                    ToolTip = 'Specifies the value of the dateReprise field.';
                }
                field("Nombre de Jours"; Rec."Nombre de Jours")
                {
                    ToolTip = 'Specifies the value of the NombreJours field.';
                }
                field(Statut; Rec.Statut)
                {
                    ToolTip = 'Specifies the value of the Statut field.';
                }
            }
        }
    }
}
