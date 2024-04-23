/// <summary>
/// Page DemandeOrdre (ID 50144).
/// </summary>
page 50144 DemandeOrdre
{
    ApplicationArea = All;
    Caption = 'DemandeOrdre';
    PageType = Card;
    SourceTable = Mission;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Ajouter un ordre de mission';

                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(DateDebut; Rec.DateDebut)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                }
                field(DateFin; Rec.DateFin)
                {
                    ToolTip = 'Specifies the value of the DateFin field.';
                }
                field(Titre; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
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
                    StatutRec: Record "Mission";
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