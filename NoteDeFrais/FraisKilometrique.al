/// <summary>
/// Table FraisKilometrique (ID 50101).
/// </summary>
table 50116 FraisKilometrique
{
    Caption = 'Frais Kilometrique';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; IdFrais; Integer)
        {
            Caption = 'Id Depense';
            AutoIncrement = true;
        }
        field(2; "Titre"; Text[100])
        {
            Caption = 'Titre';

        }
        field(3; "Départ"; Text[100])
        {
            Caption = 'Départ';

        }
        field(4; "Arrivé"; Text[100])
        {
            Caption = 'Arrivé';

        }
        field(5; "Type  de véhicule"; Option)
        {
            Caption = 'Type';
            OptionMembers = "Personnel","Professionnel";

        }
        field(6; "Distance parcourue (KM)"; Decimal)
        {
            Caption = 'Distance parcourue (KM)';

        }
        field(7; "Nombre de trajets"; Integer)
        {
            Caption = 'Nombre de trajets';

        }
        field(8; "Date de Début"; Date)
        {
            Caption = 'Date de Début';
        }
        field(9; "Date de Fin"; Date)
        {
            Caption = 'Date de Fin';
        }
        field(10; "Distance totale parcourue (KM)"; Decimal)
        {
            Caption = 'Distance totale parcourue (KM)';

        }
        field(11; "TTC"; Text[100])
        {
            Caption = 'TTC';

        }
        field(12; "Commentaire"; Text[1000])
        {
            Caption = 'Commentaire';

        }
        field(13; "Type"; Text[100])
        {
            Caption = 'Type  de véhicule';

        }
        field(14; "TTC1"; Decimal)
        {
            Caption = 'TTC1';

        }
    }
    keys
    {
        key(PK; "IdFrais")
        {
            Clustered = true;
        }
    }
}
