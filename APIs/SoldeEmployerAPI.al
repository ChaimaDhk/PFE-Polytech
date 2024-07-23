/// <summary>
/// Page SoldeEmployerAPI (ID 50002).
/// </summary>
page 50002 SoldeEmployerAPI
{
    APIGroup = 'Aiventu';
    APIPublisher = 'publisherName';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'soldeEmployerAPI';
    DelayedInsert = true;
    EntityName = 'SoldeEmploye';
    EntitySetName = 'SoldeEmployeSet';
    PageType = API;
    SourceTable = Employee;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(soldeDeCong; Rec."Solde de Conge")
                {
                    Caption = 'Solde de Congé';

                }
            }
        }
    }


}
