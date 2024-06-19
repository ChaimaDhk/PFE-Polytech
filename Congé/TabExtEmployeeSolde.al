/// <summary>
/// TableExtension EmployeeSolde (ID 50100) extends Record Employee.
/// </summary>
tableextension 50140 EmployeeSolde extends Employee

{
    fields
    {
        field(50140; "Solde de Congé"; Integer)
        {

            Caption = 'Solde de Congé';
            DataClassification = ToBeClassified;

        }
        field(50141; "Solde de Conge"; Decimal)
        {

            Caption = 'Solde de Congé';
            DataClassification = ToBeClassified;

        }
        field(50142; "Employé"; text[50])
        {

            Caption = 'Employé';
            DataClassification = ToBeClassified;

        }
    }
}


