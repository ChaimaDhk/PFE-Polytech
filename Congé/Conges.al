/// <summary>
/// Table Congé (ID 50149).
/// </summary>
table 50149 "Conges"
{
    Caption = 'Conges';
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
            OptionMembers = "Autorisation de sortie","Congé Annuel","Congé de maladie";
        }
        field(3; Remplacant; Text[50])
        {
            Caption = 'Remplacant';
        }
        field(4; "DatedeDebut"; Date)
        {
            Caption = 'DatedeDebut';
        }
        field(5; "DatedeReprise"; Date)
        {
            Caption = 'DatedeReprise';
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
            OptionMembers = "Open","Pending Approval","Released";
        }
        field(16; "Approval Status"; Option)
        {
            Caption = 'Approval Status';
            OptionMembers = "Ouvert","Transmise","Validée";
            OptionCaption = 'Ouvert,Transmise,Validée';
        }
        field(12; "Employé"; Text[100])
        {
            Caption = 'Employé';
        }
        field(13; "No conge"; code[20])
        {
            Caption = 'No conge';
            TableRelation = "No. Series";
        }
        field(15; "Doc No."; code[20])
        {
            Caption = 'Doc No.';

        }

    }
    keys
    {
        key(PK; "Id Congé")
        {
            Clustered = true;
        }
    }
    trigger OnInsert();
    begin
        rec."Employé" := USERID;
    end;

}
