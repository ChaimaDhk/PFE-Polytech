/// <summary>
/// Codeunit Workflow Response Handling Ext (ID 50105).
/// </summary>
codeunit 50105 WorkflowRespHandlingExt2
{

    trigger OnRun()
    begin


    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Request: Record "Mission";
    begin
        Case RecRef.Number of
            DataBase::Mission:
                begin
                    RecRef.SetTable(Request);
                    Request.Statut := Request.Statut::Ouvert;
                    Request.Modify;
                    Handled := true;
                end;

        End;
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Request: Record "Mission";
    begin
        Case RecRef.Number of
            DataBase::Mission:
                begin
                    RecRef.SetTable(Request);
                    Request.Statut := Request.Statut::"Validée";
                    Request.Modify;
                    Handled := true;
                end;

        End;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var IsHandled: Boolean)
    var
        Request: Record "Mission";
    begin
        Case RecRef.Number of
            DataBase::Mission:
                begin
                    RecRef.SetTable(Request);
                    Request.Statut := Request.Statut::"Transmise";
                    Request.Modify;
                    IsHandled := true;
                end;

        End;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit 1521;
        WorkflowEventHandlingCust: Codeunit 50104;
    begin
        Case ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                WorkflowEventHandlingCust.RunWorkflowOnSendRequestForApprovalCode1);
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                WorkflowEventHandlingCust.RunWorkflowOnSendRequestForApprovalCode1);

            WorkflowResponseHandling.CancelAllApprovalRequestsCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                WorkflowEventHandlingCust.RunWorkflowOnCancelRequestApprovalCode1);
            WorkflowResponseHandling.OpenDocumentCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                WorkflowEventHandlingCust.RunWorkflowOnCancelRequestApprovalCode1);


        End;
    end;

}