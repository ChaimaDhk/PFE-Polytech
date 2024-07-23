/// <summary>
/// PageExtension SoldeEmployeExt (ID 50102) extends Record Employe.
/// </summary>
pageextension 50102 SoldeEmployeExt extends "Employee List"
{

    layout
    {
        addafter("Comment") // Assuming this field exists on the Employee Card page
        {
            field("Solde de congé"; Rec."Solde de Conge")
            {
                ApplicationArea = All;
                Caption = 'Solde de Congé';
                Editable = false;
            }
        }

    }
    actions
    {
        addlast(Processing)
        {
            action("CalculateVacationBalance")
            {
                ApplicationArea = All;
                Caption = 'Calculer soldes de congé';
                Tooltip = 'Calculate the vacation balance based on the current employee data.';
                trigger OnAction()

                var
                    VacationBalanceCodeunit: Codeunit Calculsoldedeconge;
                    TotalVacationBalance: Decimal;
                    EmployeeRec: Record "Employee";

                begin
                    if EmployeeRec.FindSet() then begin
                        repeat
                            // Call the CalculateTotalsolde procedure for the current employee
                            TotalVacationBalance := VacationBalanceCodeunit.CalculateTotalsolde(EmployeeRec);

                            // Update the field "Solde de Congé" on the employee record
                            EmployeeRec."Solde de Conge" := TotalVacationBalance;
                            EmployeeRec.Modify(true);
                        until EmployeeRec.Next() = 0;
                    end;
                end;
            }
        }
    }

}
