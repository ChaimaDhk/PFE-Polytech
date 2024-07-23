/// <summary>
/// Page APIConge (ID 50114).
/// </summary>
page 50125 APIConge
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Aiventu';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'apiConge';
    DelayedInsert = true;
    EntityName = 'Conges';
    EntitySetName = 'CongesSet';
    PageType = API;
    SourceTable = Conges;
    SourceTableView = where("Approval Status" = filter(Ouvert));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(idCong; Rec."Id Congé")
                {
                    Caption = 'Id Congé';
                }
                field(approvalStatus; Rec."Approval Status")
                {
                    Caption = 'Approval Status';
                }
                field(commentaire; Rec.Commentaire)
                {
                    Caption = 'Commentaire';
                }
                field(dateDeDButAprSMidi; Rec."Date de Début aprés-midi")
                {
                    Caption = 'Date de Début aprés-midi';
                }
                field(dateDeRepriseAprSMidi; Rec."Date de Reprise aprés-midi")
                {
                    Caption = 'Date de Reprise aprés-midi';
                }
                field(datedeDebut; Rec.DatedeDebut)
                {
                    Caption = 'DatedeDebut';
                }
                field(datedeReprise; Rec.DatedeReprise)
                {
                    Caption = 'DatedeReprise';
                }
                field(employ; Rec."Employé")
                {
                    Caption = 'Employé';
                }
                field(noConge; Rec."No conge")
                {
                    Caption = 'No conge';
                }
                field(nombreDeJours; Rec."Nombre de Jours")
                {
                    Caption = 'Nombre de Jours';
                }
                field(remplacant; Rec.Remplacant)
                {
                    Caption = 'Remplacant';
                }
                field(soldeDeCong; Rec."Solde de Congé")
                {
                    Caption = 'Solde de Congé';
                }
                field(typeCong; Rec."TypeCongé")
                {
                    Caption = 'Type de Congé';
                    OptionCaption = '"Autorisation de sortie","Congé Annuel","Congé de maladie","Congé maternité/paternité","Congé parental","Congé de décès","Demi-journée de congé"';

                }
            }
        }
    }
}
