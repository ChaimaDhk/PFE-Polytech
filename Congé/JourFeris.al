/// <summary>
/// Table JourFeriés (ID 50132).
/// </summary>
table 50132 "JourFeriés"
{
    Caption = 'JourFeriés';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; num; Integer)
        {
            AutoIncrement = true;
            Caption = 'num';
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(3; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(4; "Durée"; Integer)
        {
            Caption = 'Durée';
        }
    }
    keys
    {
        key(PK; num)
        {
            Clustered = true;
        }
    }
}

