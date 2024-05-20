/// <summary>
/// Page DemandeDepense (ID 50112).
/// </summary>
page 50112 DemandeDepense
{
    ApplicationArea = All;
    Caption = 'Demande De pense';
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
                }
                field(Pays; Rec.Pays)
                {
                    ToolTip = 'Specifies the value of the Pays field.';
                }
                field("TTC (devise)"; Rec."TTC (devise)")
                {
                    ToolTip = 'Specifies the value of the TTC (devise) field.';
                }
                field(TVA; Rec.TVA)
                {
                    ToolTip = 'Specifies the value of the TVA field.';
                }
                field(Refacturable; Rec.Refacturable)
                {
                    ToolTip = 'Specifies the value of the Refacturable field.';
                }
                field(DateDepense; Rec.DateDepense)
                {
                    ToolTip = 'Specifies the value of the DateDepense field.';
                }
                field("Moyens de paiement"; Rec."Moyens de paiement")
                {
                    ToolTip = 'Specifies the value of the Moyens de paiement field.';
                }
                field(Devise; Rec.Devise)
                {
                    ToolTip = 'Specifies the value of the Devise field.';
                }
                field("Total Remboursable(devise)"; Rec."Total Remboursable(devise)")
                {
                    ToolTip = 'Specifies the value of the Total Remboursable(devise) field.';

                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }

                field("Documents attachés"; Rec."Documents attachés")
                {
                    ToolTip = 'Specifies the value of the Documents attachés field.';
                }
                field(Commentaire; Rec.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commentaire field.';
                }
            }
        }
    }
}
