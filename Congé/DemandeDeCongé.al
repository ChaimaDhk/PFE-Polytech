/// <summary>
/// Page DemandeDeCongé (ID 50140).
/// </summary>
page 50140 "DemandeDeCongé"
{
    ApplicationArea = All;
    Caption = 'Demande de Congé';
    PageType = Card;
    SourceTable = "Conges";
    UsageCategory = Administration;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Ajout de Congé';

                field("Type de Congé"; Rec."TypeCongé")
                {
                    ToolTip = 'Specifies the value of the Type de Congé field.';
                    Caption = 'Type de congé *';
                    Editable = not IsReadOnly;

                }
                field(Remplacant; Rec.Remplacant)
                {
                    Caption = 'Remplacant';
                    ToolTip = 'Specifies the value of the Remplacant field.';
                    Editable = not IsReadOnly;
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        emp.Reset();
                        if Page.RunModal(Page::"Employee List", emp) = Action::LookupOK then
                            Rec.Remplacant := emp."First Name" + ' ' + emp."Last Name";
                    end;

                }
                field("Date de Début"; Rec."DatedeDebut")
                {
                    ToolTip = 'Specifies the value of the Date de Début field.';
                    Caption = 'Date de Début *';
                    Editable = not IsReadOnly;
                    trigger OnValidate()
                    begin
                        if Rec."DatedeDebut" = 0D then
                            Message('Le champ "Date de Début" est obligatoire.');
                    end;
                }
                field("Date de Début aprés-midi"; Rec."Date de Début aprés-midi")
                {
                    ToolTip = 'Specifies the value of the Date de Début aprés-midi field.';
                    Editable = not IsReadOnly and (Rec."TypeCongé" = Rec."TypeCongé"::"Autorisation de sortie");
                    trigger OnValidate()
                    begin
                        if Rec."TypeCongé" <> Rec."TypeCongé"::"Autorisation de sortie" then begin
                            Rec."Date de Début aprés-midi" := false;
                            Message('Cette option est uniquement disponible pour les autorisations de sortie.');
                        end;
                        if Rec."Date de Début aprés-midi" then begin
                            Rec."Date de Reprise aprés-midi" := false;
                        end;
                        if Rec."Date de Début aprés-midi" = false then
                            Message('Le champ "Date de Début aprés-midi" est obligatoire pour les autorisations de sortie.');
                    end;
                }
                field("Date de Reprise"; Rec."DatedeReprise")
                {
                    Caption = 'Date de Reprise *';
                    ToolTip = 'Specifies the value of the Date de Reprise field.';
                    Editable = not IsReadOnly;
                    trigger OnValidate()
                    var
                        Calculduree: Codeunit Calculduree;
                        businessDays: Integer;
                        startDate: Date;
                        endDate: Date;
                        calcCodeunit: Codeunit "Calculduree";
                        Calculsolde: Codeunit Calculsoldedeconge;
                        utilisateur: Record User;
                        employe: Record Employee;
                        soldeconge: Decimal;
                    begin
                        if Rec."DatedeReprise" = 0D then
                            Message('Le champ "Date de Reprise" est obligatoire.');

                        // Get the start and end dates from the selected record
                        startDate := Rec."DatedeDebut";
                        endDate := Rec."DatedeReprise";
                        if Rec."TypeCongé" = Rec."TypeCongé"::"Autorisation de sortie" then begin
                            Rec.DatedeReprise := Rec.DatedeDebut;

                        end;
                        // Call the CalculateBusinessDays procedure to get the number of business days
                        businessDays := calcCodeunit.CalculateBusinessDays(startDate, endDate);
                        Rec."Nombre de Jours" := businessDays - 1;
                        if Rec."DatedeReprise" = Rec."DatedeDebut" then
                            Rec."Nombre de Jours" := 0.5;

                        // Set filter to find the employee record based on the current user's fullname
                        employe.SETFILTER(employe."Employé", USERID);
                        IF employe.FINDFIRST THEN BEGIN
                            // Calculate the new leave balance
                            Rec."Solde de Congé" := employe."Solde de Conge";
                            soldeconge := employe."Solde de Conge" - Rec."Nombre de Jours";
                            employe."Solde de Conge" := soldeconge;
                            // Update the employee record
                            employe.MODIFY(TRUE);
                            Rec."Solde de Congé" := employe."Solde de Conge";
                        END ELSE
                            Message('Employé non trouvé.');
                    end;
                }
                field("Date de Reprise aprés-midi"; Rec."Date de Reprise aprés-midi")
                {
                    ToolTip = 'Specifies the value of the Date de Reprise aprés-midi field.';
                    Editable = not IsReadOnly and (Rec."TypeCongé" = Rec."TypeCongé"::"Autorisation de sortie");
                    trigger OnValidate()
                    begin
                        if Rec."TypeCongé" <> Rec."TypeCongé"::"Autorisation de sortie" then begin
                            Message('Cette option est uniquement disponible pour les autorisations de sortie.');
                            Rec."Date de Reprise aprés-midi" := false;
                        end;
                        if Rec."Date de Reprise aprés-midi" then begin
                            Rec."Date de Début aprés-midi" := false;
                        end;
                        if Rec."Date de Reprise aprés-midi" = false then
                            Message('Le champ "Date de Reprise aprés-midi" est obligatoire pour les autorisations de sortie.');
                    end;
                }
                field("Nombre de Jours "; Rec."Nombre de Jours")
                {
                    ToolTip = 'Specifies the value of the Nombre de Jours field.';
                    Editable = false;
                }
                field("Solde de Congé "; Rec."Solde de Congé")
                {
                    ToolTip = 'Specifies the value of the Solde de Congé field.';
                    Editable = false;
                }
                field(Commentaire; Rec.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commentaire field.';
                    MultiLine = true;
                    Editable = not IsReadOnly;

                }
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Editable = not IsReadOnly;
                SubPageLink = "Table ID" = const(Database::Item),
                              "No." = field("Doc No.");
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
                RunObject = Report 50161; // Spécifiez ici le numéro de votre rapport d'impression
            }
        }
    }



    var
        emp: Record Employee;
        IsReadOnly: Boolean;

    trigger OnAfterGetCurrRecord()
    begin
        IsReadOnly := (Rec."Approval Status" = Rec."Approval Status"::"Transmise") or
                      (Rec."Approval Status" = Rec."Approval Status"::"Validée");
    end;
}