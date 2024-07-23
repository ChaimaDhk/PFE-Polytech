/// <summary>
/// Codeunit Workflow Response Handling Ext (ID 50111).
/// </summary>
codeunit 50111 WorkflowRespHandlingExt1
{

    trigger OnRun()
    begin


    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Request: Record "Conges";
    begin
        Case RecRef.Number of
            DataBase::Conges:
                begin
                    RecRef.SetTable(Request);
                    Request."Approval Status" := Request."Approval Status"::Ouvert;
                    Request.Modify;
                    Handled := true;
                end;

        End;
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Request: Record "Conges";
    begin
        Case RecRef.Number of
            DataBase::Conges:
                begin
                    RecRef.SetTable(Request);
                    Request."Approval Status" := Request."Approval Status"::"Validée";
                    Request.Modify;
                    Handled := true;
                end;

        End;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var IsHandled: Boolean)
    var
        Request: Record "Conges";
    begin
        Case RecRef.Number of
            DataBase::Conges:
                begin
                    RecRef.SetTable(Request);
                    Request."Approval Status" := Request."Approval Status"::"Transmise";
                    Request.Modify;
                    IsHandled := true;
                end;

        End;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit 1521;
        WorkflowEventHandlingCust: Codeunit 50110;
    begin
        Case ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                WorkflowEventHandlingCust.RunWorkflowOnSendRequestForApprovalCode);
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                WorkflowEventHandlingCust.RunWorkflowOnSendRequestForApprovalCode);

            WorkflowResponseHandling.CancelAllApprovalRequestsCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                WorkflowEventHandlingCust.RunWorkflowOnCancelRequestApprovalCode);
            WorkflowResponseHandling.OpenDocumentCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                WorkflowEventHandlingCust.RunWorkflowOnCancelRequestApprovalCode);


        End;
    end;

}