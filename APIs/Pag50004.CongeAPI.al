/// <summary>
/// Page CongeAPI (ID 50004).
/// </summary>
page 50004 CongeAPI
{
    APIGroup = 'apiGroup';
    APIPublisher = 'publisherName';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'congeAPI';
    DelayedInsert = true;
    EntityName = 'CongeName';
    EntitySetName = 'CongeSetName';
    PageType = API;
    SourceTable = Conges;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(approvalStatus; Rec."Approval Status")
                {
                    Caption = 'Approval Status';
                }
            }
        }
    }
}
