/// <summary>
/// Table Congé (ID 50144).
/// </summary>
table 50144 "Conge"
{
    Caption = 'Conge';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Id Congé"; Integer)
        {
            Caption = 'Id Congé';
            AutoIncrement = true;
        }
        field(2; "TypeCongé"; Option)
        {
            Caption = 'Type de Congé';
            OptionMembers = "Autorisation de sortie","Congé Annuel","Congé de maladie","Autre";
        }
        field(3; Remplacant; Text[50])
        {
            Caption = 'Remplacant';
        }
        field(4; "Date de Début"; Date)
        {
            Caption = 'Date de Début';
        }
        field(5; "Date de Reprise"; Date)
        {
            Caption = 'Date de Reprise';

        }
        field(6; "Date de Début aprés-midi"; Boolean)
        {
            Caption = 'Date de Début aprés-midi';
        }
        field(7; "Date de Reprise aprés-midi"; Boolean)
        {
            Caption = 'Date de Reprise aprés-midi';
        }
        field(8; Commentaire; Text[100])
        {
            Caption = 'Commentaire';
        }
        field(9; "Nombre de Jours"; Decimal)
        {
            Caption = 'Nombre de Jours';
        }
        field(10; "Solde de Congé"; Decimal)
        {
            Caption = 'Solde de Congé';
        }
        field(11; "Statut"; Option)
        {
            Caption = 'Statut';
            OptionMembers = "Refusée","Transmise","Non Transmise","valider","Réfuser";
        }
    }
    keys
    {
        key(PK; "Id Congé")
        {
            Clustered = true;
        }
    }


}
