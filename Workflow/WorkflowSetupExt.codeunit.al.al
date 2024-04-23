/// <summary>
/// Codeunit Workflow Setup Ext (ID 50101).
/// </summary>
codeunit 50101 "Workflow Payroll Setup Ext"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', true, true)]
    local procedure OnAddWorkflowCategoriesToLibrary()
    begin
        WorkflowSetup.InsertWorkflowCategory(SlipWorkflowCategoryTxt, SlipWorkflowCategoryDescTxt);
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAfterInsertApprovalsTableRelations', '', true, true)]
    local procedure OnAfterInsertApprovalsTableRelations()
    var
        ApprovalEntry: Record 454;
    begin
        WorkflowSetup.InsertTableRelation(Database::"Conges", 0, Database::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
    local procedure OnInsertWorkflowTemplates()
    begin
        InsertSlipApprovalWorkflowTemplate();
    end;



    local procedure InsertSlipApprovalWorkflowTemplate()
    var
        Workflow: Record 1501;
    begin
        WorkflowSetup.InsertWorkflowTemplate(Workflow, SlipApprovalWorkflowCodeTxt, SlipApprovalWorkfowDescTxt, SlipWorkflowCategoryTxt);
        InsertSlipApprovalWorkflowDetails(Workflow);
        WorkflowSetup.MarkWorkflowAsTemplate(Workflow);
    end;

    local procedure InsertSlipApprovalWorkflowDetails(var Workflow: Record 1501)
    var
        workflowStepArgument: record 1523;
        BlankDateFormula: DateFormula;
        workflowEventHandlingCust: Codeunit 50104;
        workflowResponseHandling: Codeunit 1521;
        slip: Record "Conges";
    begin
        // deprecated methode : to be removed in the future
        // WorkflowSetup.PopulateWorkflowStepArgument(workflowStepArgument,
        // workflowStepArgument."Approver Type"::Approver, workflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);

        WorkflowSetup.InitWorkflowStepArgument(workflowStepArgument,
               workflowStepArgument."Approver Type"::Approver, workflowStepArgument."Approver Limit Type"::"Direct Approver",
                0, '', BlankDateFormula, true);

        WorkflowSetup.InsertDocApprovalWorkflowSteps(
            Workflow,
            BuildSlipTypeConditions(slip.Statut::"Validée"),
            workflowEventHandlingCust.RunWorkflowOnSendSlipForApprovalCode,
            BuildSlipTypeConditions(slip.Statut::"Validée"),
            workflowEventHandlingCust.RunWorkflowOnCancelSlipApprovalCode,
            workflowStepArgument,
            true
        );
    end;


    local procedure BuildSlipTypeConditions(Status: Integer): Text
    var
        slip: Record "Conges";
    begin
        slip.SetRange(Statut, Status);
        exit(StrSubstNo(SlipTypeCondTxt, WorkflowSetup.Encode(slip.GetView(false))));
    end;



    var
        WorkflowSetup: Codeunit 1502;
        SlipWorkflowCategoryTxt: Label 'SDW';

        SlipWorkflowCategoryDescTxt: Label 'Demande achat';

        SlipApprovalWorkflowCodeTxt: Label 'DAWF';

        SlipApprovalWorkfowDescTxt: Label 'Purchase Order Approval Workflow';

        SlipTypeCondTxt: Label '<?xml version = “1.0” encoding=”utf-8” standalone=”yes”?><ReportParameters><DataItems><DataItem name=”Slip”>%1</DataItem></DataItems></ReportParameters>';

}
