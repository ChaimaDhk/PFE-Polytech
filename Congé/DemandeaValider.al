/// <summary>
/// Page DemandeaValider (ID 50142).
/// </summary>
page 50142 DemandeaValider
{
    ApplicationArea = All;
    Caption = 'Demandes a Valider';
    PageType = List;
    SourceTable = Conges;
    UsageCategory = Administration;
    SourceTableView = where("Approval Status" = const(Transmise));
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("IdCongé"; Rec."Id Congé")
                {
                    ToolTip = 'Specifies the value of the IdCongé field.';
                    caption = 'Id de congé';
                }
                field(DatedeDebut; Rec.DatedeDebut)
                {
                    ToolTip = 'Specifies the value of the DatedeDebut field.';
                    caption = 'Date de Debut';
                }
                field(DatedeReprise; Rec.DatedeReprise)
                {
                    ToolTip = 'Specifies the value of the DatedeReprise field.';
                    caption = 'Date de Reprise';
                }
                field("Nombre de Jours"; Rec."Nombre de Jours")
                {
                    ToolTip = 'Specifies the value of the NombreJours field.';
                    caption = 'Nombre de Jours';
                }
                field("Employé"; Rec."Employé")
                {
                    ToolTip = 'Specifies the value of the NombreJours field.';
                    caption = 'Employé';
                }
                field(Remplacant; Rec.Remplacant)
                {
                    ToolTip = 'Specifies the value of the Remplacant field.';
                    caption = 'Remplaçant';
                }
                field("TypeCongé"; Rec."TypeCongé")
                {
                    ToolTip = 'Specifies the value of the TypeCongé field.';
                    caption = 'Type de congé';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ToolTip = 'Specifies the value of the Statut field.';

                    Editable = false;
                }

            }
        }
    }




}
