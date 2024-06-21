
/// <summary>
/// Codeunit MissionValidation (ID 50145).
/// </summary>
codeunit 50145 "MissionValidation"
{
    Subtype = Normal;

    [EventSubscriber(ObjectType::Table, Database::Mission, 'OnBeforeInsertEvent', '', true, true)]
    local procedure OnBeforeInsertMission(var Rec: Record "Mission"; RunTrigger: Boolean)
    begin
        ValidateDates(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::Mission, 'OnBeforeModifyEvent', '', true, true)]
    local procedure OnBeforeModifyMission(var Rec: Record "Mission"; xRec: Record "Mission"; RunTrigger: Boolean)
    begin
        ValidateDates(Rec);
    end;

    local procedure ValidateDates(var Rec: Record "Mission")
    begin
        if (Rec.DateDebut <> 0D) and (Rec.DateFin <> 0D) then begin
            if Rec.DateDebut > Rec.DateFin then begin
                Error('La date de début doit être antérieure à la date de fin.');
            end;
        end;
    end;
}
