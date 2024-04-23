/// <summary>
/// Codeunit WorkflowResponseHandlingExt (ID 50105).
/// </summary>
codeunit 50105 WorkflowRespHandlingExt
{

    trigger OnRun()
    begin


    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Slip: Record "Conges";
    begin
        Case RecRef.Number of
            DataBase::"Conges":
                begin
                    RecRef.SetTable(Slip);
                    Slip.Statut := Slip.Statut::"Validée";
                    Slip.Modify;
                    Handled := true;
                end;

        End;
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Slip: Record "Conges";
    begin
        Case RecRef.Number of
            DataBase::"Conges":
                begin
                    RecRef.SetTable(Slip);
                    Slip.Statut := Slip.Statut::Transmise;
                    //Slip.Status := Slip.Status::Validated;
                    Slip.Modify;
                    Handled := true;
                end;

        End;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var IsHandled: Boolean)
    var
        Slip: Record "Conges";
    begin
        Case RecRef.Number of
            DataBase::"Conges":
                begin
                    RecRef.SetTable(Slip);
                    Slip.Statut := Slip.Statut::Transmise;
                    Slip.Modify;
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
                WorkflowEventHandlingCust.RunWorkflowOnSendSlipForApprovalCode);
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                WorkflowEventHandlingCust.RunWorkflowOnSendSlipForApprovalCode);

            WorkflowResponseHandling.CancelAllApprovalRequestsCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                WorkflowEventHandlingCust.RunWorkflowOnCancelSlipApprovalCode);
            WorkflowResponseHandling.OpenDocumentCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                WorkflowEventHandlingCust.RunWorkflowOnCancelSlipApprovalCode);


        End;
    end;



}
