/// <summary>
/// Page TypeDépenseAPI (ID 50135).
/// </summary>
page 50251 "TypeDépenseAPI"
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Aiventu';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'typeDPenseAPI';
    DelayedInsert = true;
    EntityName = 'TypeDepense';
    EntitySetName = 'TypeDepenseSet';
    PageType = API;
    SourceTable = "TypeDépense";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(idTypeDepense; Rec.IdTypeDepense)
                {
                    Caption = 'Id de depense';
                }
                field(nom; Rec.Nom)
                {
                    Caption = 'Nom';
                }
            }
        }
    }
}
