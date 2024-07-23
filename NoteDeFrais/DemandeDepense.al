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

                field("Titre"; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                    Caption = 'Titre *';
                    trigger OnValidate()
                    begin
                        if Rec.Titre = '' then
                            Message('Le champ "Titre" est obligatoire.');
                    end;
                }
                field(TypeDepense; Rec.TypeDepenses)
                {
                    ToolTip = 'Specifies the value of the TypeDepense field.';
                    Caption = 'Type de dépense *';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        type.Reset();
                        if Page.RunModal(Page::"ListTypeDépense", type) = Action::LookupOK then
                            Rec."TypeDepenses" := type.Nom;
                    end;

                    trigger OnValidate()
                    begin
                        if Rec."TypeDepenses" = '' then
                            Message('Le champ "Type de dépense" est obligatoire.');
                    end;
                }
                field("Pays"; Rec.Pays)
                {
                    ToolTip = 'Specifies the value of the Pays field.';
                    Caption = 'Pays *';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        countrie: Record "Country/Region";
                    begin
                        countrie.Reset();
                        if Page.RunModal(Page::"Countries/Regions", countrie) = Action::LookupOK then
                            Rec.Pays := countrie."Name";
                    end;

                    trigger OnValidate()
                    begin
                        if Rec.Pays = '' then
                            Message('Le champ "Pays" est obligatoire.');
                    end;
                }
                field(TTCDevise; Rec."Montant")
                {
                    ToolTip = 'Specifies the value of the TTC (devise) field.';
                    Caption = 'Montant *';

                }
                field("TVA"; Rec.TVA1)
                {
                    ToolTip = 'Specifies the value of the TVA field.';
                    Caption = 'TVA *';

                }
                field(DateDepense; Rec.DateDepense)
                {
                    ToolTip = 'Specifies the value of the DateDepense field.';
                    Caption = 'Date de Dépense *';
                    trigger OnValidate()
                    begin
                        if Rec.DateDepense = 0D then
                            message('Le champ "Date de Dépense" est obligatoire.');
                    end;
                }
                field(MoyensDePaiement; Rec."Moyens de paiement")
                {
                    ToolTip = 'Specifies the value of the Moyens de paiement field.';
                    Caption = 'Moyens de paiement';

                }
                field("Devise"; Rec.Devise)
                {
                    ToolTip = 'Specifies the value of the Devise field.';
                    Caption = 'Devise *';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        currencies: Record "Currency";
                    begin
                        currencies.Reset();
                        if Page.RunModal(Page::"Currencies", currencies) = Action::LookupOK then
                            Rec.Devise := currencies."code";
                    end;

                    trigger OnValidate()
                    begin
                        if Rec.Devise = '' then
                            message('Le champ "Devise" est obligatoire.');
                    end;
                }
                field("Description"; Rec.Description)
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

    var
        type: Record "TypeDépense";
}
