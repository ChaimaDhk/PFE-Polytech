/// <summary>
/// Page DemandeDeCongé (ID 50109).
/// </summary>
page 50140 "DemandeDeCongé"
{
    ApplicationArea = All;
    Caption = 'Demande De Congé';
    PageType = Card;
    SourceTable = "Conges";
    UsageCategory = Administration;

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
                    Caption = 'Type de congé';

                }
                field(Remplacant; Rec.Remplacant)
                {
                    Caption = 'Remplacant';
                    ToolTip = 'Specifies the value of the Remplacant field.';

                    trigger OnLookup(var Text: Text): Boolean

                    begin
                        emp.Reset();
                        if Page.RunModal(Page::"Employee List", emp) = Action::LookupOK then
                            rec.Remplacant := emp."First Name" + ' ' + emp."Last Name";
                    end;
                }
                field("Date de Début"; Rec."DatedeDebut")
                {
                    ToolTip = 'Specifies the value of the Date de Début field.';
                    Caption = 'Date de Début';

                }
                field("Date de Début aprés-midi"; Rec."Date de Début aprés-midi")
                {
                    ToolTip = 'Specifies the value of the Date de Début field.';
                    trigger OnValidate()
                    begin

                        if Rec."TypeCongé" <> Rec."TypeCongé"::"Autorisation de Sortie" then begin
                            rec."Date de Début aprés-midi" := false;
                            Message('Cette option est uniquement disponible pour les autorisations de sortie.');
                        end;
                        if rec."Date de Début aprés-midi" then begin
                            rec."Date de Reprise aprés-midi" := false;


                        end;
                    end;
                }

                field("Date de Reprise"; Rec."DatedeReprise")
                {
                    Caption = 'Date de Reprise';
                    ToolTip = 'Specifies the value of the date de Reprise field.';
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




                        // Get the start and end dates from the selected record
                        startDate := Rec."DatedeDebut";
                        endDate := Rec."DatedeReprise";
                        if Rec."TypeCongé" = Rec."TypeCongé"::"Autorisation de Sortie" then begin

                            rec.DatedeReprise := rec.DatedeDebut;
                            Message('Date de début de congé doit étre égale a la date de reprise');
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
                    ToolTip = 'Specifies the value of the date de Reprise field.';
                    trigger OnValidate()
                    begin

                        if Rec."TypeCongé" <> Rec."TypeCongé"::"Autorisation de Sortie" then begin
                            message('Cette option est uniquement disponible pour les autorisations de sortie.');
                            rec."Date de Reprise aprés-midi" := false;
                        end;
                        if rec."Date de Reprise aprés-midi" then begin
                            rec."Date de Début aprés-midi" := false;    // Si "Date de Reprise" est égale à "Date de Début du Congé"

                        end;
                    end;




                }
                field("Nombre de Jours"; Rec."Nombre de Jours")
                {
                    ToolTip = 'Specifies the value of the Nombre de Jours field.';
                    Editable = false;

                }
                field("Solde de Congé"; Rec."Solde de Congé")
                {
                    ToolTip = 'Specifies the value of the Solde de Congé field.';
                    Editable = false;

                }

                field(Commentaire; Rec.Commentaire)
                {
                    ToolTip = 'Specifies the value of the Commantaire field.';
                    MultiLine = true;
                }
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
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

    var
        emp: Record Employee;

}
