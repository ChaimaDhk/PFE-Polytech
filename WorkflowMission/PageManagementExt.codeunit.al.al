/// <summary>
/// Codeunit Page Management Ext (ID 50107).
/// </summary>
codeunit 50107 "Page Mission Management Ext2"
{
    trigger OnRun()
    var
    begin

    end;


    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Page Management", 'OnAfterGetPageID', '', true, true)]
    local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer)
    begin
        if PageID = 0 then
            PageID := GetConditionalCardPageID(RecordRef);

    end;

    local procedure GetConditionalCardPageID(RecordRef: RecordRef): Integer
    var
    begin
        case RecordRef.Number of
            Database::Mission:
                exit(Page::MesOrdres);
        end;


    end;
}