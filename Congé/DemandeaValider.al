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
                field(DatedeDebut; Rec.DatedeDebut)
                {
                    ToolTip = 'Specifies the value of the DatedeDebut field.';
                }
                field(DatedeReprise; Rec.DatedeReprise)
                {
                    ToolTip = 'Specifies the value of the DatedeReprise field.';
                }
                field("Nombre de Jours"; Rec."Nombre de Jours")
                {
                    ToolTip = 'Specifies the value of the NombreJours field.';
                }
                field("Employé"; Rec."Employé")
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
                field(Statut; Rec.Statut)
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
            action(Valider)
            {
                ApplicationArea = All;
                Caption = 'Valider';
                trigger OnAction()
                var
                    StatutRec: Record "Conges";
                begin
                    BEGIN
                        Rec."Statut" := Rec."Statut"::Validée;
                        Rec.MODIFY;
                        MESSAGE('La demande est validée avec succès');
                        //email  !!!!!!
                    END;
                end;
            }

            action(Réfuser)
            {
                ApplicationArea = All;
                Caption = 'Réfuser';
                trigger OnAction()
                var
                    StatutRec: Record "Conges";
                begin
                    BEGIN
                        Rec."Statut" := Rec."Statut"::Réfusée;
                        Rec.MODIFY;
                        MESSAGE('La demande est réfusée ');
                        //email  !!!!!!
                    END;
                end;
            }
        }
    }



}
