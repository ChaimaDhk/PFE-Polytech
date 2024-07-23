/// <summary>
/// Page DemandeOrdre (ID 50144).
/// </summary>
page 50144 DemandeOrdre
{
    ApplicationArea = All;
    Caption = 'Demande de ordre de mission';
    PageType = Card;
    SourceTable = Mission;
    UsageCategory = Administration;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Ajouter un ordre de mission';

                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                    Caption = 'Type *';
                    Editable = not IsReadOnly;
                    trigger OnValidate()
                    begin
                        UpdatePaysVisibility();
                    end;
                }
                field(Pays; Rec.Pays)
                {
                    ToolTip = 'Specifies the value of the Pays field.';
                    Editable = ShowPaysField and not IsReadOnly;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        countrie: Record "Country/Region";
                    begin
                        countrie.Reset();
                        if Page.RunModal(Page::"Countries/Regions", countrie) = Action::LookupOK then
                            Rec.Pays := countrie."Name";
                    end;
                }
                field("Titre"; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                    Caption = 'Titre *';
                    Editable = not IsReadOnly;
                }
                field(DateDebut; Rec.DateDebut)
                {
                    Caption = 'Date de début *';
                    Editable = not IsReadOnly;
                    ToolTip = 'Specifies the value of the DateDebut field.';
                }
                field(DateFin; Rec.DateFin)
                {
                    Caption = 'Date de fin *';
                    Editable = not IsReadOnly;
                    ToolTip = 'Specifies the value of the DateFin field.';
                }
                field("Description *"; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    Editable = not IsReadOnly;
                }
            }
        }
    }

    // Adding a variable to control the visibility of the Pays field
    var
        ShowPaysField: Boolean;

    trigger OnOpenPage();
    begin
        UpdatePaysVisibility();
    end;

    local procedure UpdatePaysVisibility()
    begin
        ShowPaysField := (Rec."Type" = Rec."Type"::"Mission à l'étranger");
    end;

    trigger OnAfterGetCurrRecord()
    begin
        IsReadOnly := (Rec."Statut" = Rec."Statut"::"Transmise") or
                      (Rec."Statut" = Rec."Statut"::"Validée");
        UpdatePaysVisibility(); // Ensure the visibility is updated when the current record changes
    end;

    local procedure ValidateDates()
    begin
        if (Rec.DateDebut <> 0D) and (Rec.DateFin <> 0D) then begin
            if Rec.DateDebut > Rec.DateFin then
                Message('La date de début doit être antérieure à la date de fin.');
        end;
    end;

    var
        IsReadOnly: Boolean;
}
