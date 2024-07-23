/// <summary>
/// Report ReportCongé (ID 50161).
/// </summary>
report 50161 "ReportCongé"
{
    ApplicationArea = All;
    Caption = 'ReportCongé';
    UsageCategory = Administration;
    RDLCLayout = 'test.rdl';


    dataset
    {
        dataitem(TableConge; "Conges")
        {
            column(Num_demande; "Id Congé")
            {
            }
            column(TypeConge; "TypeCongé")
            {
            }
            column(SoldedeConge; "Solde de Congé")
            {
            }
            column(DatedeDbutduCong; "DatedeDebut")
            {
            }
            column(DatedeReprise; "DatedeReprise")
            {
            }
            column(NombresdeJour; "Nombre de Jours")
            {
            }
            column(Remplaant; "Remplacant")
            {
            }
            column(Status; "Approval Status")
            {
            }
            column(Commentaire; Commentaire)
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                field(Num_demande; 'Num_demande') { ApplicationArea = all; }
                field(TypeConge; 'TypeConge') { ApplicationArea = all; }
                field(DatedeDbutduCong; 'Date de Début du Congé') { ApplicationArea = all; }
                field(DateFin; 'Date de Reprise') { ApplicationArea = all; }
                field(Commentaire; 'Commentaire') { ApplicationArea = all; }

            }
        }

    }
}
