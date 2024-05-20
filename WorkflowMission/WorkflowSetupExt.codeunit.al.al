/// <summary>
/// Codeunit Workflow Setup Ext (ID 50101).
/// </summary>
codeunit 50101 "Workflow Mission Setup Ext"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', true, true)]
    local procedure OnAddWorkflowCategoriesToLibrary()
    begin
        WorkflowSetup.InsertWorkflowCategory(RequestWorkflowCategoryTxt, RequestWorkflowCategoryDescTxt);
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAfterInsertApprovalsTableRelations', '', true, true)]
    local procedure OnAfterInsertApprovalsTableRelations()
    var
        ApprovalEntry: Record 454;
    begin
        WorkflowSetup.InsertTableRelation(Database::Mission, 0, Database::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
    local procedure OnInsertWorkflowTemplates()
    begin
        InsertRequestApprovalWorkflowTemplate();
    end;



    local procedure InsertRequestApprovalWorkflowTemplate()
    var
        Workflow: Record 1501;
    begin
        WorkflowSetup.InsertWorkflowTemplate(Workflow, RequestApprovalWorkflowCodeTxt, RequestApprovalWorkfowDescTxt, RequestWorkflowCategoryTxt);
        InsertRequestApprovalWorkflowDetails(Workflow);
        WorkflowSetup.MarkWorkflowAsTemplate(Workflow);
    end;

    local procedure InsertRequestApprovalWorkflowDetails(var Workflow: Record 1501)
    var
        workflowStepArgument: record 1523;
        BlankDateFormula: DateFormula;
        workflowEventHandlingCust: Codeunit 50104;
        workflowResponseHandling: Codeunit 1521;
        Request: Record "Mission";
    begin
        // deprecated methode : to be removed in the future
        // WorkflowSetup.PopulateWorkflowStepArgument(workflowStepArgument,
        // workflowStepArgument."Approver Type"::Approver, workflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);

        WorkflowSetup.InitWorkflowStepArgument(workflowStepArgument,
               workflowStepArgument."Approver Type"::Approver, workflowStepArgument."Approver Limit Type"::"Direct Approver",
                0, '', BlankDateFormula, true);

        WorkflowSetup.InsertDocApprovalWorkflowSteps(
            Workflow,
            BuildRequestTypeConditions(Request.Statut::Transmise),
            workflowEventHandlingCust.RunWorkflowOnSendRequestForApprovalCode1,
            BuildRequestTypeConditions(Request.Statut::"Validée"),
            workflowEventHandlingCust.RunWorkflowOnCancelRequestApprovalCode1,
            workflowStepArgument,
            true
        );
    end;


    local procedure BuildRequestTypeConditions(Status: Integer): Text
    var
        Request: Record "Mission";
    begin
        Request.SetRange(Statut, Status);
        exit(StrSubstNo(RequestTypeCondTxt, WorkflowSetup.Encode(Request.GetView(false))));
    end;



    var
        WorkflowSetup: Codeunit 1502;
        RequestWorkflowCategoryTxt: Label 'DVM';

        RequestWorkflowCategoryDescTxt: Label 'Demande de mission';

        RequestApprovalWorkflowCodeTxt: Label 'DCWM';

        RequestApprovalWorkfowDescTxt: Label 'Mission Approval Workflow';

        RequestTypeCondTxt: Label '<?xml version = “1.0” encoding=”utf-8” standalone=”yes”?><ReportParameters><DataItems><DataItem name=”Request”>%1</DataItem></DataItems></ReportParameters>';

}