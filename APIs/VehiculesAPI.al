/// <summary>
/// Page VéhiculesAPI (ID 50134).
/// </summary>
page 50250 "VéhiculesAPI"
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Aiventu';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'vHiculesAPI';
    DelayedInsert = true;
    EntityName = 'Vehicule';
    EntitySetName = 'VehiculeSet';
    PageType = API;
    SourceTable = Vehicule;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(coef; Rec.Coef)
                {
                    Caption = 'Coef';
                }
                field(idVehicule; Rec.IdVehicule)
                {
                    Caption = 'Id de Vehicule';
                }
                field(nom; Rec.Nom)
                {
                    Caption = 'Nom';
                }
                field("type"; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(type1; Rec.Type1)
                {
                    Caption = 'Type';
                }
            }
        }
    }
}
