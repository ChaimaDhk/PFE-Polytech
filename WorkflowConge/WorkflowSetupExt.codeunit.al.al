/// <summary>
/// Codeunit Workflow Setup Ext (ID 50114).
/// </summary>
codeunit 50114 "Workflow Congé Setup Ext1"
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
        WorkflowSetup.InsertTableRelation(Database::Conges, 0, Database::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));
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
        workflowEventHandlingCust: Codeunit 50110;
        workflowResponseHandling: Codeunit 1521;
        Request: Record "Conges";
    begin
        // deprecated methode : to be removed in the future
        // WorkflowSetup.PopulateWorkflowStepArgument(workflowStepArgument,
        // workflowStepArgument."Approver Type"::Approver, workflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);

        WorkflowSetup.InitWorkflowStepArgument(workflowStepArgument,
               workflowStepArgument."Approver Type"::Approver, workflowStepArgument."Approver Limit Type"::"Direct Approver",
                0, '', BlankDateFormula, true);

        WorkflowSetup.InsertDocApprovalWorkflowSteps(
            Workflow,
            BuildRequestTypeConditions(Request."Approval Status"::Ouvert),
            workflowEventHandlingCust.RunWorkflowOnSendRequestForApprovalCode,
            BuildRequestTypeConditions(Request."Approval Status"::"Transmise"),
            workflowEventHandlingCust.RunWorkflowOnCancelRequestApprovalCode,
            workflowStepArgument,
            true
        );
    end;


    local procedure BuildRequestTypeConditions(Status: Integer): Text
    var
        Request: Record "Conges";
    begin
        Request.SetRange("Approval Status", Status);
        exit(StrSubstNo(RequestTypeCondTxt, WorkflowSetup.Encode(Request.GetView(false))));
    end;



    var
        WorkflowSetup: Codeunit 1502;
        RequestWorkflowCategoryTxt: Label 'DV';

        RequestWorkflowCategoryDescTxt: Label 'Demandes de Conge';

        RequestApprovalWorkflowCodeTxt: Label 'DCWX';

        RequestApprovalWorkfowDescTxt: Label 'Congé Approval Workflow';

        RequestTypeCondTxt: Label '<?xml version = “1.0” encoding=”utf-8” standalone=”yes”?><ReportParameters><DataItems><DataItem name=”Request”>%1</DataItem></DataItems></ReportParameters>';

}