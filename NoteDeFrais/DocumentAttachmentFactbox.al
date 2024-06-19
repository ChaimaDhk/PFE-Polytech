/// <summary>
/// Page DocumentAttachmentFactbox (ID 50118).
/// </summary>
page 50118 DocumentAttachmentFactbox
{
    PageType = ListPart;
    SourceTable = "Document Attachment"; // Assurez-vous que vous avez une table pour les documents attachés
    ApplicationArea = All;
    Caption = 'Document Attachments';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Name"; Rec."File Name")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    var
    // Ajoutez les variables nécessaires ici si vous en avez besoin.
}