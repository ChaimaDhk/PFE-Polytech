/// <summary>
/// Codeunit Workflow Event Handling Ext (ID 50104).
/// </summary>
codeunit 50110 "Workflow Event Handling Ext1"
{
    /// <summary>
    /// RunWorkflowOnSendRequestForApprovalCode.
    /// </summary>
    /// <returns>Return value of type Code[128].</returns>
    procedure RunWorkflowOnSendRequestForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendRequestForApproval'))
    end;

    /// <summary>
    /// RunWorkflowOnSendRequestForApproval.
    /// </summary>
    /// <param name="Request">VAR Record "Congé".</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Congé Mgmt. Ext1", 'OnSendRequestForApproval', '', true, true)]
    local procedure RunWorkflowOnSendRequestForApproval(var Request: Record "Conges")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendRequestForApprovalCode, Request);
    end;

    /// <summary>
    /// RunWorkflowOnCancelRequestApprovalCode.
    /// </summary>
    /// <returns>Return value of type Code[128].</returns>
    procedure RunWorkflowOnCancelRequestApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelRequestApproval'));

    end;

    /// <summary>
    /// RunWorkflowOnCancelRequestApproval.
    /// </summary>
    /// <param name="Request">VAR Record Request.</param>
    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Approval Congé Mgmt. Ext1", 'OnCancelRequestForApproval', '', true, true)]
    local procedure RunWorkflowOnCancelRequestApproval(var Request: Record "Conges")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelRequestApprovalCode, Request);
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
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendRequestForApprovalCode, Database::Conges, RequestSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelRequestApprovalCode, Database::Conges, RequestApprovalRequestCancelEventDescTxt, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelRequestApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelRequestApprovalCode, RunWorkflowOnSendRequestForApprovalCode);
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode(), RunWorkflowOnSendRequestForApprovalCode);

        end;
    end;

    var

        WorkflowManagement: Codeunit 1501;
        WorkflowEventHandling: Codeunit 1520;

        RequestSendForApprovalEventDescTxt: Label 'Approval of a Congé document is requested';

        RequestApprovalRequestCancelEventDescTxt: Label 'Approval of Congé document is canceled ';

}