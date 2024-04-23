/// <summary>
/// PageExtension BusinessManagerRCExt (ID 50136) extends Record Business Manager Role Center.
/// </summary>
pageextension 50136 BusinessManagerRCExt extends "Order Processor Role Center"
{
    actions
    {
        addafter(Action76)
        {
            group("Congé")
            {
                Caption = 'Congé';
                action("Demande De Congé")
                {
                    ApplicationArea = All;
                    Caption = 'Demande De Congé';
                    RunObject = Page "MesDemandesCongé";
                }
                action("Demande De Congé à valider")
                {
                    ApplicationArea = All;
                    Caption = 'Demande De Congé à valider';
                    RunObject = Page "DemandeaValider";
                }
                action("Titre de congé")
                {
                    ApplicationArea = All;
                    Caption = 'Titre de congé';
                    RunObject = Page "TitreCongé";
                }
            }
        }
        addafter(Congé)
        {
            group("Note de frais")
            {
                Caption = 'Note de frais';
                action("Mes Ordres de Missions")
                {
                    ApplicationArea = All;
                    Caption = 'Mes Ordres de Missions';
                    RunObject = Page "MesOrdres";
                }
                action("Mes ordres de missions à valider")
                {
                    ApplicationArea = All;
                    Caption = 'Mes ordres de missions à valider';
                    RunObject = Page "OrdreaValider";
                }

            }
        }

    }
}
