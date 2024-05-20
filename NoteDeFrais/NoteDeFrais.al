/// <summary>
/// Report NoteDeFrais (ID 50135).
/// </summary>
report 50135 NoteDeFrais
{
    ApplicationArea = All;
    Caption = 'NoteDeFrais';
    UsageCategory = Administration;
    RDLCLayout = 'NoteFrais.rdl';


    dataset
    {
        dataitem(NotesDeFrais; NotesDeFrais)
        {
            column(IdNote; IdNote) { }
            column(Titre; Titre) { }
            column(DateDebut; DateDebut) { }
            column(DateFin; DateFin) { }
            column(Description; Description) { }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {

                field(IdNote; 'ID Note') { }
                field(Titre; 'Titre') { }
                field(DateDebut; 'Date de début') { }
                field(DateFin; 'Date de fin') { }
                field(Description; 'Description') { }

            }
        }
    }

}
