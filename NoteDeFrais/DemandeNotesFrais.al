/// <summary>
/// Page DemandeNotesFrais (ID 50102).
/// </summary>
page 50114 DemandeNotesFrais
{
    ApplicationArea = All;
    Caption = 'Demande Notes de Frais';
    PageType = Card;
    SourceTable = NotesDeFrais;

    // DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Note de frais';
                field(Mission; Rec.Mission)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                    Caption = 'Ordre de mission';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        mission: Record Mission;
                    begin
                        mission.RESET;
                        mission.SETRANGE("Statut", mission."Statut"::Validée);
                        if Page.RUNMODAL(Page::"MesOrdres", mission) = Action::LookupOK then
                            Rec."Mission" := mission.Titre;
                    end;
                }
                field(Titre; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                }
                field(DateDebut; Rec.DateDebut)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                    Caption = 'Date de début';
                }
                field(DateFin; Rec.DateFin)
                {
                    ToolTip = 'Specifies the value of the DateFin field.';
                    Caption = 'Date de Fin';
                }

                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
            group(Depenses)
            {
                Caption = 'Dépenses';

                field(TitreDepense; Rec."Titredepense")
                {
                    ToolTip = 'Sélectionnez la dépense.';
                    Caption = 'Titre de Dépense';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        depense.RESET;
                        if Page.RUNMODAL(Page::"MesDepense", depense) = Action::LookupOK then
                            Rec."Titredepense" := depense."Titre";
                    end;
                }
                field(TypeDepense; depense.TypeDepenses)
                {
                    Caption = 'Type de dépense';
                    Editable = false;
                }

                field(Pays; depense.Pays)
                {
                    Caption = 'Pays';
                    Editable = false;
                }

                field(TTCDevise; depense."TTC (devise)")
                {
                    ToolTip = 'Specifies the value of the TTC (devise) field.';
                    Caption = 'Montant';
                    Editable = false;
                }

                field(TVA; depense.TVA)
                {
                    ToolTip = 'Specifies the value of the TVA field.';
                    Editable = false;
                }

                field(DateDepense; depense.DateDepense)
                {
                    ToolTip = 'Specifies the value of the DateDepense field.';
                    Caption = 'Date de Dépense';
                    Editable = false;
                }

                field(MoyensDePaiement; depense."Moyens de paiement")
                {
                    ToolTip = 'Specifies the value of the Moyens de paiement field.';
                    Caption = 'Moyens de paiement';
                    Editable = false;
                }

                field(Devise; depense.Devise)
                {
                    Caption = 'Devise';
                    Editable = false;
                }

                field(Descriptiondep; depense.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    Caption = 'Description de dépense';
                    Editable = false;
                }

                field(Commentaire; depense.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commentaire field.';
                    Editable = false;
                }

                part("Attached Documents"; "Document Attachment Factbox")
                {
                    ApplicationArea = All;
                    SubPageLink = "Table ID" = const(Database::Item),
                  "No." = field("Doc No.");
                    Editable = false;
                }

                systempart(Control1900383207; Links)
                {
                    ApplicationArea = RecordLinks;
                }

                systempart(Control1905767507; Notes)
                {
                    ApplicationArea = Notes;
                }

            }
            group("Frais Kilométrique")
            {
                field(Titrefrais; Rec."Titrefrais")
                {
                    ToolTip = 'Sélectionnez la Frais kilométrique.';
                    Caption = 'Titre de Frais kilométrique';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        frais.RESET;
                        if Page.RUNMODAL(Page::"MesFraisKilometrique", frais) = Action::LookupOK then
                            Rec."Titrefrais" := frais."Titre";
                    end;
                }
                field("Départ"; frais."Départ")
                {
                    ToolTip = 'Specifies the value of the Départ field.';
                    Editable = false;
                }
                field("Arrivé"; frais."Arrivé")
                {
                    ToolTip = 'Specifies the value of the Arrivé field.';
                    Editable = false;
                }
                field("Type  de véhicule"; frais."Type")
                {
                    ToolTip = 'Specifies the value of the type field.';
                    Caption = 'Type  de véhicule';
                    Editable = false;
                }
                field("Distance parcourue (KM)"; frais."Distance parcourue (KM)")
                {
                    ToolTip = 'Specifies the value of the Distance parcourue (KM) field.';
                    Editable = false;
                }
                field("Nombre de trajets"; frais."Nombre de trajets")
                {
                    ToolTip = 'Specifies the value of the Nombre de trajets field.';
                    Editable = false;

                }
                field("Distance totale parcourue (KM)"; frais."Distance totale parcourue (KM)")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Distance totale parcourue (KM) field.';


                }
                field("TTC (Devise)"; frais."TTC1")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the TTC (Devise) field.';
                    Caption = 'TTC (EUR)';

                }
                field("Date de Début"; frais."Date de Début")
                {
                    ToolTip = 'Specifies the value of the Date de Début field.';
                    Editable = false;
                }
                field(DatedeReprise; frais."Date de Fin")
                {
                    ToolTip = 'Specifies the value of the Date de Fin field.';
                    Caption = 'Date de Fin';
                    Editable = false;
                }
                field(Commentaires; frais.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commentaire field.';
                    Caption = 'Commentaire de frais';
                    MultiLine = true;
                    Editable = false;
                }


            }

        }
    }

    actions
    {
        area(Navigation)
        {
            action("Imprimer")
            {
                ApplicationArea = All;
                Caption = 'Imprimer';
                Image = Print;
                RunObject = Report 50135; // Spécifiez ici le numéro de votre rapport d'impression
            }
        }
    }
    var
        mission: Record "Mission";
        depense: Record "Depense";
        frais: Record "FraisKilometrique";
        type: Record "TypeDépense";


}
