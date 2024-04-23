/// <summary>
/// Page MesDemandesCongé (ID 50116).
/// </summary>
page 50141 "MesDemandesCongé"
{
    ApplicationArea = All;
    Caption = 'Mes Demandes de Congé';
    PageType = List;
    SourceTable = Conges;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("IdCongé"; Rec."Id Congé")
                {
                    ToolTip = 'Specifies the value of the IdCongé field.';
                }
                field("Date de Début"; Rec."DatedeDebut")
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                }
                field("Date de Reprise"; Rec."DatedeReprise")
                {
                    ToolTip = 'Specifies the value of the dateReprise field.';
                }
                field("Nombre de Jours"; Rec."Nombre de Jours")
                {
                    ToolTip = 'Specifies the value of the NombreJours field.';
                }
                field(Remplacant; Rec.Remplacant)
                {
                    ToolTip = 'Specifies the value of the Remplacant field.';
                }
                field("TypeCongé"; Rec."TypeCongé")
                {
                    ToolTip = 'Specifies the value of the TypeCongé field.';
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
            action("Ajouter Congé")
            {
                ApplicationArea = All;
                Caption = 'Ajouter Congé';
                RunObject = Page "DemandeDeCongé";
            }
        }

    }
}
