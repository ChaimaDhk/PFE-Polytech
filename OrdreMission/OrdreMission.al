/// <summary>
/// Table OrdreMission (ID 50145).
/// </summary>
table 50145 OrdreMission
{
    Caption = 'Ordre de Mission';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; IdOrdre; Integer)
        {
            Caption = 'IdOrdre';

        }
        field(2; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = "Mission à létranger","Mission local";
        }
        field(3; DateDebut; Date)
        {
            Caption = 'Date de Début';

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
            OptionMembers = "Brouillon","Transmise";
        }
        field(8; "Employé"; Text[100])
        {
            Caption = 'Employé';
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

