/// <summary>
/// Page DemandeDeCongé (ID 50109).
/// </summary>
page 50140 "DemandeDeCongé"
{
    ApplicationArea = All;
    Caption = 'Demande De Congé';
    PageType = Card;
    SourceTable = "Conges";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Ajout Congé';

                field("Type de Congé"; Rec."TypeCongé")
                {
                    ToolTip = 'Specifies the value of the TypeCongé field.';
                }
                field(Remplacant; Rec.Remplacant)
                {
                    ToolTip = 'Specifies the value of the Remplacant field.';
                }
                field("Date de Début"; Rec."DatedeDebut")
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';

                }
                field("Date de Début aprés-midi"; Rec."Date de Début aprés-midi")
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                }
                field(Commentaire; Rec.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commantaire field.';
                }
                field("Date de Reprise"; Rec."DatedeReprise")
                {
                    ToolTip = 'Specifies the value of the dateReprise field.';
                    trigger OnValidate()
                    begin
                        BEGIN
                            Rec."Nombre de Jours" := Rec."DatedeReprise" - Rec."DatedeDebut" + 1;
                        END;
                    end;
                }
                field("Date de Reprise aprés-midi"; Rec."Date de Reprise aprés-midi")
                {
                    ToolTip = 'Specifies the value of the dateReprise field.';
                }
                field("Nombre de Jours"; Rec."Nombre de Jours")
                {
                    ToolTip = 'Specifies the value of the NombreJours field.';
                }
                field("Solde de Congé"; Rec."Solde de Congé")
                {
                    ToolTip = 'Specifies the value of the SoldeCongé field.';
                }



            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Soumettre)
            {
                ApplicationArea = All;
                Caption = 'Soumettre';

                trigger OnAction()
                var
                    StatutRec: Record "Conge";
                begin

                    IF Rec."Statut" = StatutRec.Statut::Transmise THEN BEGIN
                        MESSAGE('Cette demande a déjà été transmise.');
                    END
                    ELSE BEGIN

                        Rec."Statut" := Rec."Statut"::Transmise;
                        Rec.MODIFY;

                        MESSAGE('Demande transmise avec succès à l''approbateur.');
                    END;
                end;
                //email !!!!!!!!!!
            }
        }
    }


}
