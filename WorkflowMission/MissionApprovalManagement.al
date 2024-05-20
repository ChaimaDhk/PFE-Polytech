/// <summary>
/// Codeunit Approval Mgmt. Ext (ID 50106).
/// </summary>
codeunit 50106 "Approval Mission Mgmt. Ext"
{
    trigger OnRun()
    begin

    end;

    [IntegrationEvent(false, false)]
    /// <summary>
    /// OnSendRequestForApproval.
    /// </summary>
    /// <param name="Request">VAR Record Request.</param>
    procedure OnSendRequestForApproval1(var Request: Record "Mission")
    begin

    end;

    [IntegrationEvent(false, false)]
    /// <summary>
    /// OnCancelRequestForApproval.
    /// </summary>
    /// <param name="Request">VAR Record Request.</param>
    procedure OnCancelRequestForApproval1(var Request: Record "Mission")
    begin

    end;


    /// <summary>
    /// CheckRequestApprovalsWorkflowEnable.
    /// </summary>
    /// <param name="Request">VAR Record Request.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure CheckRequestApprovalsWorkflowEnable(var Request: Record "Mission"): Boolean
    begin
        IF NOT IsRequestApprovalsWorkflowEnable(Request) then
            Error(NoWorkflowEnabledErr);
        exit(true);
    end;

    /// <summary>
    /// IsValidate.
    /// </summary>
    /// <param name="Request">VAR Record "Congé".</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure ValidateEnabled(var Request: Record "Mission"): Boolean
    var
        flagValidate: Boolean;
    begin
        IF NOT IsRequestApprovalsWorkflowEnable(Request) then
            flagValidate := false;
        If (Request.Statut = Request.Statut::Transmise) then
            flagValidate := true;
        exit(flagValidate);
    end;


    /// <summary>
    /// IsRequestApprovalsWorkflowEnable.
    /// </summary>
    /// <param name="Request">VAR Record Request.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure IsRequestApprovalsWorkflowEnable(var Request: Record "Mission"): Boolean
    begin
        IF Request.Statut <> Request.Statut::Transmise then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(Request, WorkflowEventHandlingCust.RunWorkflowOnSendRequestForApprovalCode1));
    end;


    /// <summary>
    /// OnPopulateApprovalEntryArgument.
    /// </summary>
    /// <param name="RecRef">VAR RecordRef.</param>
    /// <param name="ApprovalEntryArgument">VAR Record "Approval Entry".</param>
    /// <param name="WorkflowStepInstance">Record "Workflow Step Instance".</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        Request: Record "Mission";
    begin
        Case RecRef.Number of
            DataBase::Mission:
                begin
                    RecRef.SetTable(Request);
                    ApprovalEntryArgument."Document No." := Request."Doc No.";
                end;
        End;
    end;


    var
        WorkflowManagement: Codeunit 1501;
        WorkflowEventHandlingCust: Codeunit 50104;

        NoWorkflowEnabledErr: Label 'No approval workflow for this record type is enabled.';

}