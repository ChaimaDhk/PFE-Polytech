/// <summary>
/// Page APIDepense (ID 50130).
/// </summary>
page 50130 APIDepense
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Aiventu';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'apiDepense';
    DelayedInsert = true;
    EntityName = 'Depense';
    EntitySetName = 'DepenseSet';
    PageType = API;
    SourceTable = Depense;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(client; Rec.Client)
                {
                    Caption = 'Client';
                }
                field(commentaire; Rec.Commentaire)
                {
                    Caption = 'Commentaire';
                }
                field(dateDepense; Rec.DateDepense)
                {
                    Caption = 'Date de Dépense';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(devise; Rec.Devise)
                {
                    Caption = 'Devise';
                }
                field(documentsAttachS; Rec."Documents attachés")
                {
                    Caption = 'Documents attachés';
                }
                field(idDepense; Rec.IdDepense)
                {
                    Caption = 'Id Dépense';
                }
                field(idDepenses; Rec.IdDepenses)
                {
                    Caption = 'Id Depenses';
                }
                field(moyensDePaiement; Rec."Moyens de paiement")
                {
                    Caption = 'Moyens de paiement';
                }
                field(pays; Rec.Pays)
                {
                    Caption = 'Pays';
                }
                field(refacturable; Rec.Refacturable)
                {
                    Caption = 'Refacturable';
                }
                field(ttcDevise; Rec."TTC (devise)")
                {
                    Caption = 'TTC (EUR)';
                }
                field(tva; Rec.TVA)
                {
                    Caption = 'TVA';
                }
                field(titre; Rec.Titre)
                {
                    Caption = 'Titre';
                }
                field(totalRemboursableDevise; Rec."Total Remboursable(devise)")
                {
                    Caption = 'Total Remboursable(EUR)';
                }
                field(typeDepense; Rec.TypeDepense)
                {
                    Caption = 'Type de Dépense';
                }
                field(typeDepenses; Rec.TypeDepenses)
                {
                    Caption = 'Type de Dépense';
                }
            }
        }
    }
}
