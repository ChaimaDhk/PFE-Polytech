/// <summary>
/// Table Vehicule (ID 50133).
/// </summary>
table 50133 Vehicule
{
    Caption = 'Vehicule';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; IdVehicule; Integer)
        {
            Caption = 'Id de Vehicule';
            AutoIncrement = true;
        }

        field(2; Nom; Text[100])
        {
            Caption = 'Nom';
        }
        field(3; Coef; Decimal)
        {
            Caption = 'Coef';
        }
        field(4; Type; Text[100])
        {
            Caption = 'Type';
        }
        field(5; Type1; option)
        {
            Caption = 'Type';
            OptionMembers = "Personnel","professionnel";
        }
    }
    keys
    {
        key(PK; "IdVehicule")
        {
            Clustered = true;
        }
    }
}
