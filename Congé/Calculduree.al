
/// <summary>
/// Codeunit Calculduree (ID 50138).
/// </summary>
codeunit 50138 Calculduree
{
    TableNo = "Conges";
    /// <summary>
    /// CalculateBusinessDays.
    /// </summary>
    /// <param name="startDate">Date.</param>
    /// <param name="endDate">Date.</param>
    /// <returns>Return value of type Integer.</returns>
    procedure CalculateBusinessDays(startDate: Date; endDate: Date): Integer
    var
        numberOfDays: Integer;
        currentDate: Date;
        holidayTable: Record "JourFeriés";
        businessDays: Integer;
        dayOfWeek: Integer;

    begin
        numberOfDays := 0;
        currentDate := startDate;

        while currentDate <= endDate do begin
            dayOfWeek := Date2DMY(currentDate, 1);
            //      test := System.Date2DMY(endDate, test);
            //   if (dayOfWeek <> 6) and (dayOfWeek <> 7) then begin // (dayOfWeek <> endDate) and
            IF ((Date2DMY(currentDate, 1) <> 6) and (Date2DMY(currentDate, 1) <> 7)) THEN begin
                numberOfDays += 1;
            end;
            currentDate := currentDate + 1;
        end;
        exit(numberOfDays);

        holidayTable.SETRANGE("Date", startDate, endDate);
        IF holidayTable.FINDSET THEN BEGIN
            REPEAT
                businessDays := businessDays - 1;
            UNTIL holidayTable.NEXT <= 0;
        END;

    end;

}