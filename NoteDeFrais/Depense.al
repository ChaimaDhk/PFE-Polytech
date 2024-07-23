/// <summary>
/// TableExtension Depense (ID 50113) extends Record NotesDeFrais.
/// </summary>
table 50115 Depense
{
    fields
    {
        field(1; IdDepense; Integer)
        {
            Caption = 'Id Dépense';
            AutoIncrement = true;
        }
        field(2; "Titre"; Text[100])
        {
            Caption = 'Titre';

        }

        field(3; DateDepense; Date)
        {
            Caption = 'Date de Dépense';
        }
        field(4; "TypeDepense"; Option)
        {
            Caption = 'Type de Dépense';
            OptionMembers = "";
        }
        field(5; "Moyens de paiement"; Option)
        {
            Caption = 'Moyens de paiement';
            OptionMembers = "","Espéce","Carte boncaire";
        }
        field(6; Pays; Text[100])
        {
            Caption = 'Pays';
        }
        field(7; Devise; Text[100])
        {
            Caption = 'Devise';
        }
        field(8; "TTC (devise)"; Text[100])
        {
            Caption = 'TTC (EUR)';
        }
        field(19; "Montant"; Decimal)
        {
            Caption = 'Montant';
        }

        field(9; "TVA"; Text[100])
        {
            Caption = 'TVA';
        }
        field(20; "TVA1"; Decimal)
        {
            Caption = 'TVA';
        }
        field(10; "Refacturable"; Boolean)
        {
            Caption = 'Refacturable';
        }
        field(11; "Total Remboursable(devise)"; Text[100])
        {
            Caption = 'Total Remboursable(EUR)';

        }
        field(12; "Client"; Text[100])
        {
            Caption = 'Client';
        }
        field(13; "Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(14; "Documents attachés"; Text[100])
        {
            Caption = 'Documents attachés';
        }
        field(15; "Commentaire"; Text[1000])
        {
            Caption = 'Commentaire';
        }
        field(16; IdDepenses; code[20])
        {
            Caption = 'Id Depenses';

        }
        field(17; "Doc No."; code[20])
        {
            Caption = 'Doc No.';

        }
        field(18; "TypeDepenses"; text[100])
        {
            Caption = 'Type de Dépense';

        }

    }

    keys
    {
        key(PK; IdDepense)
        {
            Clustered = true;
        }
        key(PK2; IdDepenses)
        {

        }

    }


    trigger OnInsert()
    begin

        Rec.Client := USERID;
    end;
}
