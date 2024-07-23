/// <summary>
/// Table PowerApps (ID 50200).
/// </summary>
table 50250 "PowerApps"
{
    Caption = 'PowerApps';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Id"; Integer)
        {
            Caption = 'Id';
            AutoIncrement = true;
        }
        field(2; "TypeCongé"; Option)
        {
            Caption = 'Type de Congé';
            OptionMembers = " ","Autorisation de sortie","Congé Annuel","Congé de maladie","Congé maternité/paternité","Congé parental","Congé de décès","Demi-journée de congé";
        }
        field(3; "Moyens de paiement"; Option)
        {
            Caption = 'Moyens de paiement';
            OptionMembers = "","Espéce","Carte boncaire";
        }
        field(4; "Type  de véhicule"; Option)
        {
            Caption = 'Type';
            OptionMembers = "","Personnel","Professionnel";

        }
        field(5; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = "","Mission à l'étranger","Mission local";

        }



    }
    keys
    {
        key(PK; "Id")
        {
            Clustered = true;
        }
    }


}
