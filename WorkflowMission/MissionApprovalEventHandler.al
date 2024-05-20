/// <summary>
/// Codeunit Workflow Event Handling Ext (ID 50104).
/// </summary>
codeunit 50104 "Workflow Event Handling Ext"
{
    /// <summary>
    /// RunWorkflowOnSendRequestForApprovalCode1.
    /// </summary>
    /// <returns>Return value of type Code[128].</returns>
    procedure RunWorkflowOnSendRequestForApprovalCode1(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendRequestForApproval1'))
    end;

    /// <summary>
    /// RunWorkflowOnSendRequestForApproval.
    /// </summary>
    /// <param name="Request">VAR Record "Mission".</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mission Mgmt. Ext", 'OnSendRequestForApproval1', '', true, true)]
    local procedure RunWorkflowOnSendRequestForApproval1(var Request: Record Mission)
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendRequestForApprovalCode1, Request);
    end;

    /// <summary>
    /// RunWorkflowOnCancelRequestApprovalCode.
    /// </summary>
    /// <returns>Return value of type Code[128].</returns>
    procedure RunWorkflowOnCancelRequestApprovalCode1(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelRequestApproval1'));

    end;

    /// <summary>
    /// RunWorkflowOnCancelRequestApproval.
    /// </summary>
    /// <param name="Request">VAR Record Request.</param>
    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Approval Mission Mgmt. Ext", 'OnCancelRequestForApproval1', '', true, true)]
    local procedure RunWorkflowOnCancelRequestApproval1(var Request: Record "Mission")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelRequestApprovalCode1, Request);
        // if Request.Find() then begin
        //     Request.Statut := Request.Statut::Transmise;
        //     Request.Modify();
        // end;
    end;


    trigger OnRun()
    begin


    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendRequestForApprovalCode1, Database::Mission, RequestSendForApprovalEventDescTxt1, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelRequestApprovalCode1, Database::Mission, RequestApprovalRequestCancelEventDescTxt1, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelRequestApprovalCode1:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelRequestApprovalCode1, RunWorkflowOnSendRequestForApprovalCode1);
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode(), RunWorkflowOnSendRequestForApprovalCode1);

        end;
    end;






    var

        WorkflowManagement: Codeunit 1501;
        WorkflowEventHandling: Codeunit 1520;

        RequestSendForApprovalEventDescTxt1: Label 'Approval of a Mission document is requested';

        RequestApprovalRequestCancelEventDescTxt1: Label 'Approval of Mission document is canceled';

}