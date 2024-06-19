/// <summary>
/// Codeunit Workflow Event Handling Ext (ID 50110).
/// </summary>
codeunit 50130 "Workflow Event Handling Ext4"
{
    /// <summary>
    /// RunWorkflowOnSendRequestForApprovalCode.
    /// </summary>
    /// <returns>Return value of type Code[128].</returns>
    procedure RunWorkflowOnSendRequestForApprovalCode4(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendRequestForApproval4'))
    end;

    /// <summary>
    /// RunWorkflowOnSendRequestForApproval.
    /// </summary>
    /// <param name="Request">VAR Record "Congé".</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Congé Mgmt. Ext4", 'OnSendRequestForApproval2', '', true, true)]
    local procedure RunWorkflowOnSendRequestForApproval4(var Request: Record "NotesDeFrais")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendRequestForApprovalCode4, Request);
    end;

    /// <summary>
    /// RunWorkflowOnCancelRequestApprovalCode.
    /// </summary>
    /// <returns>Return value of type Code[128].</returns>
    procedure RunWorkflowOnCancelRequestApprovalCode4(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelRequestApproval4'));

    end;

    /// <summary>
    /// RunWorkflowOnCancelRequestApproval.
    /// </summary>
    /// <param name="Request">VAR Record Request.</param>
    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Approval Congé Mgmt. Ext4", 'OnCancelRequestForApproval2', '', true, true)]
    local procedure RunWorkflowOnCancelRequestApproval(var Request: Record "NotesDeFrais")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelRequestApprovalCode4(), Request);
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
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendRequestForApprovalCode4, Database::NotesDeFrais, RequestSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelRequestApprovalCode4, Database::NotesDeFrais, RequestApprovalRequestCancelEventDescTxt, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelRequestApprovalCode4:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelRequestApprovalCode4, RunWorkflowOnSendRequestForApprovalCode4);
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode(), RunWorkflowOnSendRequestForApprovalCode4);

        end;
    end;

    var

        WorkflowManagement: Codeunit 1501;
        WorkflowEventHandling: Codeunit 1520;

        RequestSendForApprovalEventDescTxt: Label 'Approval of a Frais document is requested';

        RequestApprovalRequestCancelEventDescTxt: Label 'Approval of frais document is canceled ';

}