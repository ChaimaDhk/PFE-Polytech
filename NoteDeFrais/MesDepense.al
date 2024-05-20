/// <summary>
/// Page MesDepense (ID 50102).
/// </summary>
page 50119 MesDepense
{
    ApplicationArea = All;
    Caption = 'Mes Depenses';
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
                field(TypeDepense; Rec.TypeDepense)
                {
                    ToolTip = 'Specifies the value of the TypeDepense field.';
                }
                field(DateDepense; Rec.DateDepense)
                {
                    ToolTip = 'Specifies the value of the DateDepense field.';
                    Editable = false;
                }
                field("TTC (devise)"; Rec."TTC (devise)")
                {
                    ToolTip = 'Specifies the value of the TTC (devise) field.';
                }
                field(Commentaire; Rec.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commentaire field.';
                }
            }
        }
    }
}
