/// <summary>
/// Page PowerAPI (ID 50001).
/// </summary>
page 50001 PowerAPI
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Aiventu';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'powerAPI';
    DelayedInsert = true;
    EntityName = 'PowerApps';
    EntitySetName = 'PowerAppsSet';
    PageType = API;
    SourceTable = PowerApps;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(typeCong; Rec."TypeCongé")
                {
                    Caption = 'Type de Congé';
                }
                field(typeDeVHicule; Rec."Type  de véhicule")
                {
                    Caption = 'Type de véhicule';
                }
                field("type"; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(moyensDePaiement; Rec."Moyens de paiement")
                {
                    Caption = 'Moyens de paiement';
                }
                field(id; Rec.Id)
                {
                    Caption = 'Id';
                }
            }
        }
    }
}
