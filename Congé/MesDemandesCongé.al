/// <summary>
/// Page MesDemandesCongé (ID 50116).
/// </summary>
page 50141 "MesDemandesCongé"
{
    ApplicationArea = All;
    Caption = 'Mes Demandes de Congé';
    PageType = List;
    SourceTable = Conges;
    UsageCategory = Administration;
    CardPageId = "DemandeDeCongé";
    DeleteAllowed = false;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("IdCongé"; Rec."Id Congé")
                {
                    Caption = 'Id Congé';
                    ToolTip = 'Specifies the value of the IdCongé field.';
                    Editable = not IsReadOnly;
                }
                field("Date de Début"; Rec."DatedeDebut")
                {
                    Caption = 'Date de Début';
                    ToolTip = 'Specifies the value of the DateDebut field.';
                    Editable = not IsReadOnly;
                }
                field("Date de Reprise"; Rec."DatedeReprise")
                {
                    Caption = 'Date de Reprise';
                    ToolTip = 'Specifies the value of the dateReprise field.';
                    Editable = not IsReadOnly;
                }
                field("Nombre de Jours"; Rec."Nombre de Jours")
                {
                    Caption = 'Nombre de Jours';
                    ToolTip = 'Specifies the value of the NombreJours field.';
                    Editable = not IsReadOnly;
                }
                field(Remplacant; Rec.Remplacant)
                {
                    Caption = 'Remplacant';
                    ToolTip = 'Specifies the value of the Remplacant field.';
                    Editable = not IsReadOnly;
                }
                field("SoldeDeCongé"; Rec."Solde de Congé")
                {
                    Caption = 'Solde de Congé';
                    ToolTip = 'Specifies the value of the SoldeDeCongé field.';
                    Editable = not IsReadOnly;
                }
                field("TypeCongé"; Rec."TypeCongé")
                {
                    Caption = 'Type de Congé';
                    ToolTip = 'Specifies the value of the TypeCongé field.';
                    Editable = not IsReadOnly;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Caption = 'Statut';
                    ToolTip = 'Specifies the value of the Statut field.';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {

            group("SendApproval")
            {
                Caption = 'Envoyer demande approbation';
                Image = SendApprovalRequest;
                action("Envoyer demande approbation")
                {
                    ApplicationArea = all;
                    Caption = 'Envoyer demande approbation';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        StatutRec: Record "Conges";
                    begin
                        IF ApprovalsMgmtCut.CheckRequestApprovalsWorkflowEnable(Rec) THEN
                            ApprovalsMgmtCut.OnSendRequestForApproval(Rec);
                    end;
                }


                action("Cancel Approval Request")
                {
                    // Visible = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ApplicationArea = All;
                    Promoted = true;
                    Caption = 'Annuler demande approbation';
                    trigger OnAction()
                    var
                        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
                    begin
                        WorkflowWebhookManagement.FindAndCancel(Rec.RecordId);
                        ApprovalsMgmtCut.OnCancelRequestForApproval(Rec); // Appel à la méthode du codeunit 50112

                    end;

                }

                action(Approve)
                {
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    ApplicationArea = All;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    trigger OnAction()
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
            }
            action("Supprimer")
            {
                ApplicationArea = All;
                Image = Delete;
                Promoted = true;
                Caption = 'Supprimer';
                trigger OnAction()
                begin
                    // Vérifier le statut avant de supprimer
                    if ((Rec."Approval Status" <> Rec."Approval Status"::"Transmise") and (Rec."Approval Status" <> Rec."Approval Status"::"Validée")) then begin
                        Rec.DELETE;
                    end
                    else begin
                        Message('Vous ne pouvez pas supprimer un congé qui est déjà validé ou transmis.');
                    end;
                end;
            }
        }

    }

    trigger OnAfterGetCurrRecord()
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);

        IsReadOnly := (Rec."Approval Status" = Rec."Approval Status"::"Transmise") or
                      (Rec."Approval Status" = Rec."Approval Status"::"Validée");
    end;

    var
        ApprovalsMgmt: Codeunit 1535;
        ApprovalsMgmtCut: Codeunit 50112;
        WorkflowWebhookMgt: Codeunit 1543;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        IsReadOnly: Boolean;
}
