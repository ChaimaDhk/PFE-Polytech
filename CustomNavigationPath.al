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
                action("Mes demandes de Congé")
                {
                    ApplicationArea = All;
                    Caption = 'Mes demandes de Congé';
                    RunObject = Page "MesDemandesCongé";
                }
                action("Mes titres de congé")
                {
                    ApplicationArea = All;
                    Caption = 'Mes titres de congé';
                    RunObject = Page "TitreCongé";
                }
                action("Demande De Congé à valider")
                {
                    ApplicationArea = All;
                    Caption = 'Demandes de Congé valider';
                    RunObject = Page "DemandeaValider";
                }

            }
        }
        addafter(Congé)
        {
            group("Traitements")
            {
                group("Ordres de mission")
                {
                    action("Mes Ordres de Missions")
                    {
                        ApplicationArea = All;
                        Caption = 'Mes Ordres de Missions';
                        RunObject = Page "MesOrdres";
                    }
                    action("Mes ordres de missions valider")
                    {
                        ApplicationArea = All;
                        Caption = 'Mes ordres de missions valider';
                        RunObject = Page "OrdreaValider";
                    }
                }
                group("Notes de frais")
                {
                    action(" Mes Notes de frais")
                    {
                        ApplicationArea = All;
                        Caption = 'Mes notes de frais';
                        RunObject = Page "MesNotesFrais";
                    }
                    action(" Mes Depénses")
                    {
                        ApplicationArea = All;
                        Caption = 'Mes Depénses';
                        RunObject = Page "MesDepense";
                    }
                    action("Mes Frais Kilométriques")
                    {
                        ApplicationArea = All;
                        Caption = 'Mes Frais Kilométriques';
                        RunObject = Page MesFraisKilometrique;
                    }
                    action("Notes de frais à valider")
                    {
                        ApplicationArea = All;
                        Caption = 'Mes notes de frais à valider';
                        RunObject = Page NotesDeFraisavalider;
                    }
                }
            }
        }
        addafter(Items)
        {
            action("Calcule Solde De Congé")
            {
                ApplicationArea = All;
                Caption = 'Calcule Solde De Congé';
                Tooltip = 'Calcule le solde de congé basé sur les données actuelles de l’employé.';


            }
        }

    }
}
