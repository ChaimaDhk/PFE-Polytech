/// <summary>
/// Page DemandeNotesFrais (ID 50114).
/// </summary>
page 50114 DemandeNotesFrais
{
    ApplicationArea = All;
    Caption = 'Demande Notes de Frais';
    PageType = Card;
    SourceTable = NotesDeFrais;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Note de frais';
                field(Mission; Rec.Mission)
                {
                    Editable = not IsReadOnly;
                    ToolTip = 'Specifies the value of the Mission field.';
                    Caption = 'Ordre de mission *';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        mission: Record Mission;
                    begin
                        mission.RESET;
                        mission.SETRANGE("Statut", mission."Statut"::Validée);
                        if Page.RUNMODAL(Page::"MesOrdres", mission) = Action::LookupOK then begin
                            Rec."Mission" := mission.Titre;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if Rec.Mission = '' then
                            Error('Le champ "Ordre de mission" est obligatoire.');
                    end;
                }
                field(Titre; Rec.Titre)
                {
                    Editable = not IsReadOnly;
                    ToolTip = 'Specifies the value of the Titre field.';
                    Caption = 'Titre';

                    trigger OnValidate()
                    begin
                        if Rec.Titre = '' then
                            Error('Le champ "Titre" est obligatoire.');
                    end;
                }
                field(DateDebut; Rec.DateDebut)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                    Caption = 'Date de début *';
                    Editable = not IsReadOnly;

                    trigger OnValidate()
                    begin
                        if Rec.DateDebut = 0D then
                            Error('Le champ "Date de début" est obligatoire.');
                    end;
                }
                field(DateFin; Rec.DateFin)
                {
                    ToolTip = 'Specifies the value of the DateFin field.';
                    Caption = 'Date de Fin *';
                    Editable = not IsReadOnly;

                    trigger OnValidate()
                    begin
                        if Rec.DateFin = 0D then
                            Error('Le champ "Date de Fin" est obligatoire.');
                    end;
                }

                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    Editable = not IsReadOnly;
                }
            }
            group(Depenses)
            {
                Caption = 'Dépenses';

                field(TitreDepense; Rec."Titredepense")
                {
                    Editable = not IsReadOnly;
                    ToolTip = 'Sélectionnez la dépense.';
                    Caption = 'Titre de Dépense *';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        depense.RESET;
                        if Page.RUNMODAL(Page::"MesDepense", depense) = Action::LookupOK then begin
                            Rec."Titredepense" := depense."Titre";
                            Rec."Pays" := depense.Pays;
                            Rec."Montant" := depense."Montant";
                            Rec.TVA1 := depense.TVA1;
                            Rec.DateDepense := depense.DateDepense;
                            Rec."Moyens de paiement" := depense."Moyens de paiement";
                            Rec.Devise := depense.Devise;
                            Rec.Descriptiondep := depense.Description;
                            Rec.Commentairedep := depense.Commentaire;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if Rec."Titredepense" = '' then
                            Error('Le champ "Titre de Dépense" est obligatoire.');

                        depense.GET(Rec."Titredepense");


                    end;
                }

                field(Pays; Rec.Pays)
                {
                    Caption = 'Pays';
                    Editable = false;
                }

                field(TTCDevise; Rec."Montant")
                {
                    ToolTip = 'Specifies the value of the TTC (devise) field.';
                    Caption = 'Montant';
                    Editable = false;
                }

                field(TVA; Rec.TVA1)
                {
                    ToolTip = 'Specifies the value of the TVA field.';
                    Editable = false;
                }

                field(DateDepense; Rec.DateDepense)
                {
                    ToolTip = 'Specifies the value of the DateDepense field.';
                    Caption = 'Date de Dépense';
                    Editable = false;
                }

                field(MoyensDePaiement; Rec."Moyens de paiement")
                {
                    ToolTip = 'Specifies the value of the Moyens de paiement field.';
                    Caption = 'Moyens de paiement';
                    Editable = false;
                }

                field(Devise; Rec.Devise)
                {
                    Caption = 'Devise';
                    Editable = false;
                }

                field(Descriptiondep; Rec.Descriptiondep)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    Caption = 'Description de dépense';
                    Editable = false;
                }

                field(Commentaire; Rec.Commentairedep)
                {
                    ToolTip = 'Specifies the value of the Commentaire field.';
                    Editable = false;
                }
            }
            group("Frais Kilométrique")
            {
                field(Titrefrais; Rec."Titrefrais")
                {
                    Editable = not IsReadOnly;
                    ToolTip = 'Sélectionnez la Frais kilométrique.';
                    Caption = 'Titre de Frais kilométrique *';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        frais.RESET;
                        if Page.RUNMODAL(Page::"MesFraisKilometrique", frais) = Action::LookupOK then begin
                            Rec."Titrefrais" := frais."Titre";
                            Rec."Départ" := frais.Départ;
                            Rec."Arrivé" := frais.Arrivé;
                            Rec."Type" := frais."Type";
                            Rec."Distance parcourue (KM)" := frais."Distance parcourue (KM)";
                            Rec."Nombre de trajets" := frais."Nombre de trajets";
                            Rec."Distance totale parcourue (KM)" := frais."Distance totale parcourue (KM)";
                            Rec."TTC1" := frais.TTCdevise;
                            Rec."Date de Début" := frais."Date de Début";
                            Rec."Date de Fin" := frais."Date de Fin";
                            Rec.Commentaire := frais.Commentaire;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if Rec."Titrefrais" = '' then
                            Error('Le champ "Titre de Frais kilométrique" est obligatoire.');

                        frais.GET(Rec."Titrefrais");
                    end;
                }

                field("Départ"; Rec."Départ")
                {
                    ToolTip = 'Specifies the value of the Départ field.';
                    Editable = false;
                }
                field("Arrivé"; Rec."Arrivé")
                {
                    ToolTip = 'Specifies the value of the Arrivé field.';
                    Editable = false;
                }
                field("Type de véhicule"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                    Caption = 'Type de véhicule';
                    Editable = false;
                }
                field("Distance parcourue (KM)"; Rec."Distance parcourue (KM)")
                {
                    ToolTip = 'Specifies the value of the Distance parcourue (KM) field.';
                    Editable = false;
                }
                field("Nombre de trajets"; Rec."Nombre de trajets")
                {
                    ToolTip = 'Specifies the value of the Nombre de trajets field.';
                    Editable = false;
                    Visible = ShowFraisFields;
                }
                field("Distance totale parcourue (KM)"; Rec."Distance totale parcourue (KM)")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Distance totale parcourue (KM) field.';
                }
                field("TTC (Devise)"; Rec."TTC1")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the TTC (Devise) field.';
                    Caption = 'TTC (EUR)';
                }
                field("Date de Début"; Rec."Date de Début")
                {
                    ToolTip = 'Specifies the value of the Date de Début field.';
                    Editable = false;
                }
                field(DatedeReprise; Rec."Date de Fin")
                {
                    ToolTip = 'Specifies the value of the Date de Fin field.';
                    Caption = 'Date de Fin';
                    Editable = false;
                }
                field(Commentaires; Rec.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commentaire field.';
                    Caption = 'Commentaire de frais';
                    MultiLine = true;
                    Editable = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        UpdateDepenseFieldsVisibility();
        UpdateFraisFieldsVisibility();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        IsReadOnly := (Rec.Statut = Rec."Statut"::"Transmise") or
                      (Rec."Statut" = Rec."Statut"::"Validée");
    end;

    /// <summary>
    /// UpdateDepenseFieldsVisibility.
    /// </summary>
    procedure UpdateDepenseFieldsVisibility()
    begin
        ShowDepenseFields := (Rec."Titredepense" = '');
    end;

    /// <summary>
    /// UpdateFraisFieldsVisibility.
    /// </summary>
    procedure UpdateFraisFieldsVisibility()
    begin
        ShowFraisFields := (Rec."Titrefrais" = '');
    end;

    var
        IsReadOnly: Boolean;
        depense: Record Depense;
        frais: Record FraisKilometrique;
        ShowDepenseFields: Boolean;
        ShowFraisFields: Boolean;
}
