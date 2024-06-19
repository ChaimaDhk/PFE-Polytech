/// <summary>
/// Codeunit Calculsoldedeconge (ID 50140).
/// </summary>
codeunit 50140 Calculsoldedeconge
{
    TableNo = "Conges";

    /// <summary>
    /// CalculateTotalVacationBalance.
    /// </summary>
    /// <param name="EmployeeRec">Record Employee.</param>
    /// <returns>Return value of type Decimal.</returns>
    procedure CalculateTotalsolde(EmployeeRec: Record Employee): Decimal
    var
        SoldeConge: Decimal;
        DaysDifference: Integer;
        YearsDifference: Decimal;
        TotalSoldeConge: Decimal;
    begin
        TotalSoldeConge := 0;

        // Check if the employee status is active
        if EmployeeRec.Status = EmployeeRec.Status::Active then begin
            // Calculate the difference in days between today and the employment date
            DaysDifference := Today - EmployeeRec."Employment Date";

            // Calculate the difference in years
            YearsDifference := DaysDifference / 365;
            // Determine the vacation balance based on the years of service
            if YearsDifference < 2 then
                SoldeConge := 18
            else
                SoldeConge += 24;
            // Multiply by 12 to get annual vacation balance
            SoldeConge := YearsDifference * 12;
            // // Multiply by YearsDifference to account for years of service
            // SoldeConge := SoldeConge * YearsDifference;

            // Accumulate the total vacation balance
            TotalSoldeConge += SoldeConge;
        end;

        exit(TotalSoldeConge);
    end;
}
