/// <summary>
/// Codeunit Workflow Event Handling Ext (ID 50104).
/// </summary>
codeunit 50104 "Workflow Event Handling Ext"
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
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Congé Mgmt. Ext", 'OnSendRequestForApproval', '', true, true)]
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
    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Approval Congé Mgmt. Ext", 'OnCancelRequestForApproval', '', true, true)]
    local procedure RunWorkflowOnCancelRequestApproval(var Request: Record "Conges")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelRequestApprovalCode, Request);
        /*if Request.Find() then begin
            Request.Status := "Congé Status"::Transmis;
            Request.Modify();
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
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendRequestForApprovalCode, Database::Conges, RequestSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelRequestApprovalCode, Database::Conges, RequestApprovalRequestCancelEventDescTxt, 0, false);
    end;



    /// <summary>
    /// OnAddWorkflowEventPredecessorsToLibrary.
    /// </summary>
    /// <param name="EventFunctionName">Code[128].</param>
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