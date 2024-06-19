/// <summary>
/// Table TypeDépense (ID 50140).
/// </summary>
table 50140 "TypeDépense"
{
    Caption = 'Type Dépense';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; IdTypeDepense; Integer)
        {
            Caption = 'Id de Vehicule';
            AutoIncrement = true;
        }

        field(2; Nom; Text[100])
        {
            Caption = 'Nom';
        }

    }
    keys
    {
        key(PK; "IdTypeDepense")
        {
            Clustered = true;
        }
    }
}
