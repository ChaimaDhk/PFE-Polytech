/// <summary>
/// Page MesOrdres (ID 50146).
/// </summary>
page 50146 MesOrdres
{
    ApplicationArea = All;
    Caption = 'Mes Ordres';
    PageType = List;
    SourceTable = Mission;
    UsageCategory = Administration;
    CardPageId = "DemandeOrdre";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Titre; Rec.Titre)
                {
                    ToolTip = 'Specifies the value of the Titre field.';
                }
                field(DateDebut; Rec.DateDebut)
                {
                    ToolTip = 'Specifies the value of the DateDebut field.';
                    Caption = 'Date de début';
                    Editable = false;
                }
                field(DateFin; Rec.DateFin)
                {
                    ToolTip = 'Specifies the value of the DateFin field.';
                    Caption = 'Date de fin';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Statut"; Rec.Statut)
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

                action("Envoyer demande approbtion")
                {
                    ApplicationArea = all;
                    Caption = 'Envoyer demande approbation';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        StatutRec: Record "Mission";
                    begin
                        IF ApprovalsMgmtCut.CheckRequestApprovalsWorkflowEnable(Rec) THEN
                            ApprovalsMgmtCut.OnSendRequestForApproval1(Rec);


                    end;
                }
                action("Cancel Approval Request")
                {
                    Visible = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    trigger OnAction()
                    begin
                        ApprovalsMgmtCut.OnCancelRequestForApproval1(Rec);

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

        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);

    end;

    var
        ApprovalsMgmt: Codeunit 1535;
        ApprovalsMgmtCut: Codeunit 50106;
        WorkflowWebhookMgt: Codeunit 1543;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
}
