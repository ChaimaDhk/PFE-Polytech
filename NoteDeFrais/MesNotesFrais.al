/// <summary>
/// Page MesNotesFrais (ID 50101).
/// </summary>
page 50113 MesNotesFrais
{
    ApplicationArea = All;
    Caption = 'Mes Notes de Frais';
    PageType = List;
    SourceTable = NotesDeFrais;
    CardPageId = "DemandeNotesFrais";
    UsageCategory = Administration;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(IdNote; Rec.IdNote)
                {
                    ToolTip = 'Specifies the value of the IdNote field.';
                    Caption = 'Id de note de frais';
                    Editable = not IsReadOnly;
                }
                field(Titre; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                    Editable = not IsReadOnly;
                }
                field(Mission; Rec.Mission)
                {
                    ToolTip = 'Specifies the value of the IdNote field.';
                    Caption = 'Ordre de Mission';
                    Editable = not IsReadOnly;
                }
                field(DateDebut; Rec.DateDebut)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                    Caption = 'Date de début';
                    Editable = not IsReadOnly;
                }
                field(DateFin; Rec.DateFin)
                {
                    ToolTip = 'Specifies the value of the DateFin field.';
                    Caption = 'Date de fin';
                    Editable = not IsReadOnly;

                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    Editable = not IsReadOnly;

                }
                field(Statut; Rec.Statut)
                {
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
                action("Envoyer demande approbtion")
                {
                    ApplicationArea = all;
                    Caption = 'Envoyer demande approbation';
                    Image = SendApprovalRequest;
                    Promoted = true;

                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        StatutRec: Record NotesDeFrais;
                    begin
                        IF ApprovalsMgmtCut.CheckRequestApprovalsWorkflowEnable(Rec) THEN
                            ApprovalsMgmtCut.OnSendRequestForApproval2(Rec);



                    end;
                }
                action("Cancel Approval Request")
                {
                    Image = CancelApprovalRequest;
                    ApplicationArea = All;
                    Promoted = true;
                    Caption = 'Annuler demande approbation';
                    trigger OnAction()
                    var
                        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
                    begin
                        WorkflowWebhookManagement.FindAndCancel(Rec.RecordId);
                        ApprovalsMgmtCut.OnCancelRequestForApproval2(Rec); // Appel à la méthode du codeunit 50112

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
                    trigger OnAction();
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
                    if ((Rec.Statut <> Rec."Statut"::"Transmise") and (Rec."Statut" <> Rec."Statut"::"Validée")) then begin
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
        IsReadOnly := (Rec.Statut = Rec."Statut"::"Transmise") or
                     (Rec."Statut" = Rec."Statut"::"Validée");

    end;

    var
        ApprovalsMgmt: Codeunit 1535;
        ApprovalsMgmtCut: Codeunit 50132;
        WorkflowWebhookMgt: Codeunit 1543;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        IsReadOnly: Boolean;

}