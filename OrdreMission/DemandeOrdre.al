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
                    trigger OnValidate()
                    begin
                        UpdatePaysVisibility();
                        CurrPage.Update();
                    end;
                }
                field(Pays; Rec.Pays)
                {
                    ToolTip = 'Specifies the value of the Pays field.';
                    Editable = ShowPaysField;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        countrie: Record "Country/Region";
                    begin
                        countrie.Reset();
                        if Page.RunModal(Page::"Countries/Regions", countrie) = Action::LookupOK then
                            Rec.Pays := countrie."Name";
                    end;
                }
                field(DateDebut; Rec.DateDebut)
                {
                    Caption = 'Date de début';
                    ToolTip = 'Specifies the value of the DateDebut field.';
                    trigger OnValidate()
                    begin
                        ValidateDates();
                    end;
                }
                field(DateFin; Rec.DateFin)
                {
                    Caption = 'Date de fin';
                    ToolTip = 'Specifies the value of the DateFin field.';
                    trigger OnValidate()
                    begin
                        ValidateDates();
                    end;
                }
                field(Titre; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }

                // New field for Pays

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

    local procedure ValidateDates()
    begin
        if (Rec.DateDebut <> 0D) and (Rec.DateFin <> 0D) then begin
            if Rec.DateDebut > Rec.DateFin then begin
                message('La date de début doit être antérieure à la date de fin.');
            end;
        end;
    end;
}
