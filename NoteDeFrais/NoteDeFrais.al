/// <summary>
/// Report ReportNotedeFrais (ID 50160).
/// </summary>
report 50160 ReportNotedeFrais
{
    ApplicationArea = All;
    Caption = 'NoteDeFrais';
    UsageCategory = Administration;
    RDLCLayout = 'NoteFrais.rdl';


    dataset
    {
        dataitem(NotesDeFrais; NotesDeFrais)
        {
            column(Id; IdNote) { }
            column(Titre; Titre) { }
            column(DateDebut; DateDebut) { }
            column(DateFin; DateFin) { }
            column(Description; Description) { }
            column(Status; Statut) { }
            column(TitreFrais; "TitreFrais") { }
            column(Titredep; "TitreDepense") { }
            column(Mission; Mission) { }
            column(Typedépense; "Titrefrais") { }
            column(Pays; Pays) { }
            column(TTC; "TTC1") { }
            column(TVA; "TVA") { }
            column(Datededépense; DateDepense) { }
            column(MoyendePaiement; "Moyens de paiement") { }
            column(DistanceTotaleparcourue; "Distance totale parcourue (KM)") { }
            column(Nombredetrajets; "Nombre de trajets") { }
            column(DistanceParcourue; "Distance parcourue (KM)") { }
            column(TypedeVehicule; "Type  de véhicule") { }
            column(Arrivée; Arrivé) { }
            column(Départ; "Départ") { }
            column(Devisee; "Devise") { }
            column(Montant; "Montant") { }
            column(TotalRemboursable; "Total Remboursable(devise)") { }

        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {

                field(IdNote; 'ID') { ApplicationArea = all; }
                field(Titre; 'Titre') { ApplicationArea = all; }
                field(DateDebut; 'Date de début') { ApplicationArea = all; }
                field(DateFin; 'Date de fin') { ApplicationArea = all; }
                field(Description; 'Description') { ApplicationArea = all; }
                field(Status; 'Status') { ApplicationArea = all; }
                field(TitreFrais; 'TitreFrais') { ApplicationArea = all; }
                field(Titredep; 'Titredep') { ApplicationArea = all; }
                field(Mission; 'Mission') { ApplicationArea = all; }
                field(Typedépense; 'Type dépense') { ApplicationArea = all; }
                // field(Pays; 'Pays') { ApplicationArea = all; }
                // field(TTC; 'TTC') { ApplicationArea = all; }
                // field(TVA; 'TVA') { ApplicationArea = all; }
                // field(Datededépense; 'Date de dépense') { ApplicationArea = all; }
                // field(MoyendePaiement; 'Moyen de Paiement') { ApplicationArea = all; }
                // field(DistanceTotaleparcourue; 'Distance Totale parcourue(KM)') { ApplicationArea = all; }
                // field(Nombredetrajets; 'Nombre de trajets') { ApplicationArea = all; }
                // field(DistanceParcourue; 'Distance Parcourue(KM)') { ApplicationArea = all; }
                // field(TypedeVehicule; 'Type de Vehicule') { ApplicationArea = all; }
                // field(Arrivée; 'Arrivée') { ApplicationArea = all; }
                // field(Départ; 'Départ') { ApplicationArea = all; }
                // field(Devisee; 'Devisee') { ApplicationArea = all; }
                // field(Montant; 'Montant') { ApplicationArea = all; }
                // field(Refacturable; 'Refacturable') { ApplicationArea = all; }
                // field(TotalRemboursable; 'Total Remboursable(TND)') { ApplicationArea = all; }

            }
        }
    }

}
