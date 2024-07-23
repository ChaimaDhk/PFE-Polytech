/// <summary>
/// Page JoursFeriesAPI (ID 50132).
/// </summary>
page 50132 JoursFeriesAPI
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Aiventu';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'joursFeriesAPI';
    DelayedInsert = true;
    EntityName = 'JourFeries';
    EntitySetName = 'JourFeriesSet';
    PageType = API;
    SourceTable = "JourFeriés";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("date"; Rec."Date")
                {
                    Caption = 'Date';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(durE; Rec."Durée")
                {
                    Caption = 'Durée';
                }
                field(num; Rec.num)
                {
                    Caption = 'num';
                }
            }
        }
    }
}
