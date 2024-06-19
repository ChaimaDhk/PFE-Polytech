/// <summary>
/// Codeunit Workflow Response Handling Ext (ID 50111).
/// </summary>
codeunit 50136 WorkflowRespHandlingExt4
{

    trigger OnRun()
    begin


    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Request2: Record "NotesDeFrais";
    begin
        Case RecRef.Number of
            DataBase::NotesDeFrais:
                begin
                    RecRef.SetTable(Request2);
                    Request2."Statut" := Request2."Statut"::Ouvert;
                    Request2.Modify;
                    Handled := true;
                end;

        End;
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Request2: Record "NotesDeFrais";
    begin
        Case RecRef.Number of
            DataBase::NotesDeFrais:
                begin
                    RecRef.SetTable(Request2);
                    Request2."Statut" := Request2."Statut"::Transmise;
                    Request2.Modify;
                    Handled := true;
                end;

        End;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var IsHandled: Boolean)
    var
        Request2: Record "NotesDeFrais";
    begin
        Case RecRef.Number of
            DataBase::NotesDeFrais:
                begin
                    RecRef.SetTable(Request2);
                    Request2."statut" := Request2."Statut"::"Transmise";
                    Request2.Modify;
                    IsHandled := true;
                end;

        End;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit 1521;
        WorkflowEventHandlingCust: Codeunit 50130;
    begin
        Case ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                WorkflowEventHandlingCust.RunWorkflowOnSendRequestForApprovalCode4);
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                WorkflowEventHandlingCust.RunWorkflowOnSendRequestForApprovalCode4);

            WorkflowResponseHandling.CancelAllApprovalRequestsCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                WorkflowEventHandlingCust.RunWorkflowOnCancelRequestApprovalCode4);
            WorkflowResponseHandling.OpenDocumentCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                WorkflowEventHandlingCust.RunWorkflowOnCancelRequestApprovalCode4);


        End;
    end;

}