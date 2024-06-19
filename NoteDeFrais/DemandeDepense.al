/// <summary>
/// Page DemandeDepense (ID 50112).
/// </summary>
page 50112 DemandeDepense
{
    ApplicationArea = All;
    Caption = 'Demande Dépense';
    PageType = Card;
    SourceTable = Depense;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Titre; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                }
                field(TypeDepense; Rec.TypeDepense)
                {
                    ToolTip = 'Specifies the value of the TypeDepense field.';
                    Caption = 'Type de dépense';
                }
                field(Pays; Rec.Pays)
                {
                    ToolTip = 'Specifies the value of the Pays field.';
                }
                field(TTCDevise; Rec."TTC (devise)")
                {
                    ToolTip = 'Specifies the value of the TTC (devise) field.';
                    Caption = 'Montant';

                }
                field(TVA; Rec.TVA)
                {
                    ToolTip = 'Specifies the value of the TVA field.';
                }

                field(DateDepense; Rec.DateDepense)
                {
                    ToolTip = 'Specifies the value of the DateDepense field.';
                    Caption = 'Date de Dépense';
                }
                field(MoyensDePaiement; Rec."Moyens de paiement")
                {
                    ToolTip = 'Specifies the value of the Moyens de paiement field.';
                    Caption = 'Moyens de paiement';
                }
                field(Devise; Rec.Devise)
                {
                    ToolTip = 'Specifies the value of the Devise field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        currencies: Record "Currency";
                    begin
                        currencies.Reset();
                        if Page.RunModal(Page::"Currencies", currencies) = Action::LookupOK then
                            Rec.Devise := currencies."code";
                    end;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Commentaire; Rec.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commentaire field.';
                }
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::Item),
                              "No." = field("Doc No.");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }

    }

}