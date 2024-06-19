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
            Caption = 'Id de Note';
            AutoIncrement = true;
        }
        field(2; DateDebut; Date)
        {
            Caption = 'Date deDebut';
        }
        field(3; DateFin; Date)
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
            OptionCaption = 'Ouvert,Transmise,Validée';



        }
        field(18; "Doc No."; code[20])
        {
            Caption = 'Doc No.';

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
