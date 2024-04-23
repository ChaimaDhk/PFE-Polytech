/// <summary>
/// Codeunit Workflow Event Handling Ext (ID 50104).
/// </summary>
codeunit 50104 "Workflow Event Handl Ext"
{
    /// <summary>
    /// RunWorkflowOnSendSlipForApprovalCode.
    /// </summary>
    /// <returns>Return value of type Code[128].</returns>
    procedure RunWorkflowOnSendSlipForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendSlipForApproval'))
    end;

    /// <summary>
    /// RunWorkflowOnSendSlipForApproval.
    /// </summary>
    /// <param name="slip">VAR Record "Purchase Order".</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Payroll Mgmt. Ext", 'OnSendSlipForApproval', '', true, true)]
    local procedure RunWorkflowOnSendSlipForApproval(var slip: Record "Conges")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendSlipForApprovalCode, slip);
    end;

    /// <summary>
    /// RunWorkflowOnCancelSlipApprovalCode.
    /// </summary>
    /// <returns>Return value of type Code[128].</returns>
    procedure RunWorkflowOnCancelSlipApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelSlipApproval'));

    end;

    /// <summary>
    /// RunWorkflowOnCancelSlipApproval.
    /// </summary>
    /// <param name="Slip">VAR Record Slipm.</param>
    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Approval Payroll Mgmt. Ext", 'OnCancelSlipForApproval', '', true, true)]
    local procedure RunWorkflowOnCancelSlipApproval(var Slip: Record "Conges")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelSlipApprovalCode, Slip);
        /*if slip.Find() then begin
            slip.Status := "Sales Document Status"::Open;
            slip.Modify();
        end;*/
    end;


    trigger OnRun()
    begin


    end;


    /// <summary>
    /// OnAddWorkflowEventsToLibrary.
    /// </summary>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendSlipForApprovalCode, Database::"Conges", SlipSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelSlipApprovalCode, Database::"Conges", SlipApprovalRequestCancelEventDescTxt, 0, false);
    end;



    /// <summary>
    /// OnAddWorkflowEventPredecessorsToLibrary.
    /// </summary>
    /// <param name="EventFunctionName">Code[128].</param>
    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelSlipApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelSlipApprovalCode, RunWorkflowOnSendSlipForApprovalCode);
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendSlipForApprovalCode);

        end;
    end;






    var

        WorkflowManagement: Codeunit 1501;
        WorkflowEventHandling: Codeunit 1520;

        SlipSendForApprovalEventDescTxt: Label 'Approval of a Purchase Order document is requested';

        SlipApprovalRequestCancelEventDescTxt: Label 'Approval of Purchase Order document is canceled ';

}
