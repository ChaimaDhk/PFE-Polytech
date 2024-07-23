/// <summary>
/// Table NotesDeFrais (ID 50140).
/// </summary>
table 50200 NotesDeFrais
{
    Caption = 'Notes de frais';
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
        field(8; Mission; Text[100])
        {
            Caption = 'Ordre de Mission';
        }
        field(9; TitreDepense; Text[100])
        {
            Caption = 'Titre de Dépense';
        }
        field(10; Titrefrais; Text[100])
        {
            Caption = 'Titre de Frais kilométrique';
        }
        field(21; "Doc No."; code[20])
        {
            Caption = 'Doc No.';

        }
        field(11; DateDepense; Date)
        {
            Caption = 'Date de Dépense';
        }
        field(20; "TypeDepense"; Option)
        {
            Caption = 'Type de Dépense';
            OptionMembers = "";
        }
        field(12; "Moyens de paiement"; Option)
        {
            Caption = 'Moyens de paiement';
            OptionMembers = "","Espéce","Carte boncaire";
        }
        field(14; Pays; Text[100])
        {
            Caption = 'Pays';
        }
        field(13; Devise; Text[100])
        {
            Caption = 'Devise';
        }
        field(15; "TTC (devise)"; Text[100])
        {
            Caption = 'TTC (EUR)';
        }
        field(32; "Montant"; Decimal)
        {
            Caption = 'Montant';
        }

        field(16; "TVA"; Text[100])
        {
            Caption = 'TVA';
        }
        field(33; "TVA1"; Decimal)
        {
            Caption = 'TVA';
        }

        field(17; "Total Remboursable(devise)"; Text[100])
        {
            Caption = 'Total Remboursable(EUR)';

        }

        field(18; "Descriptiondep"; Text[100])
        {
            Caption = 'Descriptiondep';
        }

        field(19; "Commentairedep"; Text[1000])
        {
            Caption = 'Commentairedep';
        }

        field(22; "Départ"; Text[100])
        {
            Caption = 'Départ';

        }
        field(4; "Arrivé"; Text[100])
        {
            Caption = 'Arrivé';

        }
        field(23; "Type  de véhicule"; Option)
        {
            Caption = 'Type';
            OptionMembers = "Personnel","Professionnel";

        }
        field(24; "Distance parcourue (KM)"; Decimal)
        {
            Caption = 'Distance parcourue (KM)';

        }
        field(25; "Nombre de trajets"; Integer)
        {
            Caption = 'Nombre de trajets';

        }
        field(26; "Date de Début"; Date)
        {
            Caption = 'Date de Début';
        }
        field(27; "Date de Fin"; Date)
        {
            Caption = 'Date de Fin';
        }
        field(28; "Distance totale parcourue (KM)"; Decimal)
        {
            Caption = 'Distance totale parcourue (KM)';

        }
        field(29; "Commentaire"; Text[1000])
        {
            Caption = 'Commentaire';

        }
        field(30; "Type"; Text[100])
        {
            Caption = 'Type  de véhicule';

        }
        field(31; "TTC1"; Decimal)
        {
            Caption = 'TTC1';

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
