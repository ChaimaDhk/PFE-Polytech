/// <summary>
/// PageExtension EmployeeSolde (ID 50101) extends Record Employee Card.
/// </summary>
pageextension 50101 EmployeeSolde extends "Employee Card"

{
    layout
    {
        addafter("Employment Date") // Assuming this field exists on the Employee Card page
        {
            field("Solde de Congé"; Rec."Solde de Conge")
            {
                ApplicationArea = All;
                Caption = 'Solde de Congé';
            }
        }
        addafter("Privacy Blocked") // Assuming this field exists on the Employee Card page
        {
            field("Employé"; Rec."Employé")
            {
                ApplicationArea = All;
                Caption = 'Employé';
                trigger OnLookup(var Text: Text): Boolean

                begin
                    emp.Reset();
                    if Page.RunModal(Page::"users", emp) = Action::LookupOK then
                        rec.Employé := emp."User Name";
                end;
            }
        }
    }


    var
        emp: Record User;
}

