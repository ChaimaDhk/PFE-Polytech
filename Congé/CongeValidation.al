codeunit 50102 CongeValidation

{
    Subtype = Normal;

    [EventSubscriber(ObjectType::Table, Database::Conges, 'OnBeforeInsertEvent', '', true, true)]
    local procedure OnBeforeInsertMission(var Rec: Record "Conges"; RunTrigger: Boolean)
    begin
        ValidateDates(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::Conges, 'OnBeforeModifyEvent', '', true, true)]
    local procedure OnBeforeModifyMission(var Rec: Record "Conges"; xRec: Record "Conges"; RunTrigger: Boolean)
    begin
        ValidateDates(Rec);
    end;

    local procedure ValidateDates(var Rec: Record "Conges")
    begin
        if (Rec.DatedeDebut <> 0D) and (Rec.DatedeReprise <> 0D) then begin
            if Rec.DatedeDebut > Rec.DatedeReprise then begin
                message('La date de début doit être antérieure à la date de fin.');
            end;
        end;
    end;
}


