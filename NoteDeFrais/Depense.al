/// <summary>
/// TableExtension Depense (ID 50113) extends Record NotesDeFrais.
/// </summary>
table 50115 Depense
{
    fields
    {
        field(1; IdDepense; Integer)
        {
            Caption = 'IdDepense';
            AutoIncrement = true;
        }
        field(2; "Titre"; Text[100])
        {
            Caption = 'Titre';

        }

        field(3; DateDepense; Date)
        {
            Caption = 'DateDepense';
        }
        field(4; "TypeDepense"; Option)
        {
            Caption = 'TypeDepense';
            OptionMembers = "";
        }
        field(5; "Moyens de paiement"; Option)
        {
            Caption = 'Moyens de paiement';
            OptionMembers = "";
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
            Caption = 'TTC (devise)';
        }
        field(9; "TVA"; Text[100])
        {
            Caption = 'TVA';
        }
        field(10; "Refacturable"; Boolean)
        {
            Caption = 'Refacturable';
        }
        field(11; "Total Remboursable(devise)"; Text[100])
        {
            Caption = 'Total Remboursable(devise)';

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

    }

    keys
    {
        key(PK; IdDepense)
        {
            Clustered = true;
        }
    }
    trigger OnInsert();
    begin
        rec.Client := USERID;

    end;
}
