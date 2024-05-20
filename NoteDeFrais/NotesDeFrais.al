/// <summary>
/// Table NotesDeFrais (ID 50112).
/// </summary>
table 50112 NotesDeFrais
{
    Caption = 'NotesDeFrais';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; IdNote; Integer)
        {
            Caption = 'IdNote';
            AutoIncrement = true;
        }
        field(2; DateDebut; Date)
        {
            Caption = 'DateDebut';
        }
        field(3; DateFin; Date)
        {
            Caption = 'DateFin';
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
            OptionMembers = "Transmise","Validée","Annulée";



        }
    }
    keys
    {
        key(PK; IdNote)
        {
            Clustered = true;
        }
    }
}
