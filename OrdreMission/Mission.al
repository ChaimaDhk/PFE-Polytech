/// <summary>
/// Table OrdreMission (ID 50145).
/// </summary>
table 50146 Mission
{
    Caption = 'OrdreMission';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; IdOrdre; Integer)
        {
            Caption = 'Id Ordre';
            AutoIncrement = true;
        }
        field(2; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = "Mission à l'étranger","Mission local";

        }
        field(3; DateDebut; Date)
        {
            Caption = 'Date de Debut';
        }
        field(4; DateFin; Date)
        {
            Caption = 'Date de Fin';
        }
        field(5; Titre; Text[100])
        {
            Caption = 'Titre';
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; "Statut"; Option)
        {
            Caption = 'Statut';
            OptionMembers = "Ouvert","Transmise","Validée";
        }
        field(8; "Employé"; Text[100])
        {
            Caption = 'Employé';
        }
        field(9; "Pays"; Text[100])
        {
            Caption = 'Pays';
        }

        field(10; "Doc No."; code[20])
        {
            Caption = 'Doc No.';

        }

    }
    keys
    {
        key(PK; IdOrdre)
        {
            Clustered = true;
        }
    }
    trigger OnInsert();
    begin
        rec."Employé" := USERID;
    end;

}

