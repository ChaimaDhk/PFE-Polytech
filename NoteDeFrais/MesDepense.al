/// <summary>
/// Page MesDepense (ID 50102).
/// </summary>
page 50119 MesDepense
{
    ApplicationArea = All;
    Caption = 'Mes Dépenses';
    PageType = List;
    SourceTable = Depense;
    UsageCategory = Administration;
    CardPageId = DemandeDepense;


    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(Titre; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                }
                field(TypeDepense; Rec.TypeDepenses)
                {
                    ToolTip = 'Specifies the value of the TypeDepense field.';
                    Caption = 'Type de dépense';
                }
                field(DateDepense; Rec.DateDepense)
                {
                    ToolTip = 'Specifies the value of the DateDepense field.';
                    Caption = 'Date de dépense';
                    Editable = false;
                }
                field("TTC (devise)"; Rec."Montant")
                {
                    ToolTip = 'Specifies the value of the TTC (devise) field.';
                    Caption = 'Montant';
                }
                field(Commentaire; Rec.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commentaire field.';
                }
            }
        }



    }
}