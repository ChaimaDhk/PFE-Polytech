/// <summary>
/// Codeunit Approval Mgmt. Ext (ID 50106).
/// </summary>
codeunit 50106 "Approval Payroll Mgmt. Ext"
{
    trigger OnRun()
    begin

    end;

    [IntegrationEvent(false, false)]
    /// <summary>
    /// OnSendSlipForApproval.
    /// </summary>
    /// <param name="Slip">VAR Record Slip.</param>
    procedure OnSendSlipForApproval(var Slip: Record "Conges")
    begin

    end;

    [IntegrationEvent(false, false)]
    /// <summary>
    /// OnCancelSlipForApproval.
    /// </summary>
    /// <param name="Slip">VAR Record Slip.</param>
    procedure OnCancelSlipForApproval(var Slip: Record "Conges")
    begin

    end;


    /// <summary>
    /// CheckSlipApprovalsWorkflowEnable.
    /// </summary>
    /// <param name="Slip">VAR Record Slip.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure CheckSlipApprovalsWorkflowEnable(var Slip: Record "Conges"): Boolean
    begin
        IF NOT IsSlipDocApprovalsWorkflowEnable(Slip) then
            Error(NoWorkflowEnbaledErr);
        exit(true);
    end;

    /// <summary>
    /// IsValidate.
    /// </summary>
    /// <param name="Slip">VAR Record "Purchase Order".</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure ValidateEnabled(var Slip: Record "Conges"): Boolean
    var
        flagValidate: Boolean;
    begin
        IF NOT IsSlipDocApprovalsWorkflowEnable(Slip) then
            flagValidate := false;
        If (Slip.Statut = Slip.Statut::Transmise) then
            flagValidate := true;
        exit(flagValidate);
    end;


    /// <summary>
    /// IsSlipDocApprovalsWorkflowEnable.
    /// </summary>
    /// <param name="Slip">VAR Record Slip.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure IsSlipDocApprovalsWorkflowEnable(var Slip: Record "Conges"): Boolean
    begin
        IF Slip.Statut <> Slip.Statut::"Validée" then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(Slip, WorkflowEventHandlingCust.RunWorkflowOnSendSlipForApprovalCode));
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
        Slip: Record "Conges";
    begin
        Case RecRef.Number of
            DataBase::"Conges":
                begin
                    RecRef.SetTable(Slip);
                end;
        End;
    end;


    var
        WorkflowManagement: Codeunit 1501;
        WorkflowEventHandlingCust: Codeunit 50104;

        NoWorkflowEnbaledErr: Label 'No approval workflow for this record type is enabled.';

}
