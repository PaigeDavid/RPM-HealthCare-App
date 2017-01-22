@isTest
public class RPM_exportRulesControllerTest {
    
    @isTest static void testGetDisablePrevious() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        System.assertEquals(true, controller.getDisablePrevious());
    }
    
    @isTest static void testPagination() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        RuleFull__c newRule = new RuleFull__c();
        RuleFull__c newRule2 = new RuleFull__c();
        newRule.Name = 'TestRule';
        newRule.Name_Of_Payor__c = 'test';
        newRule.Effective_Date__c = date.parse('12/16/16');
        newRule.Practice__c = practice.id;
        newRule2.Name = 'TestRule2';
        newRule2.Name_Of_Payor__c = 'test2';
        newRule2.Effective_Date__c = date.parse('12/16/16');
        newRule2.Practice__c = practice.id;
        insert newRule;
        insert newRule2;
        controller.allRules = [SELECT Effective_Date__c, Name_Of_Payor__c, Payor_Products__c, FSC__c, PlanType__c,
                    Initial_Claim_Filing_Limit__c, Payment__c, Claim_Appeal_Filing_Limit__c,
                    Referrals_Needed__c, Precertification_Authorization__c, PreAuth_PreApproval_Radiation__c,
                    PreAuth_PreApproval_Diagnostics__c, Lab_in_Office__c, Name_of_Reference_Lab__c, Advanced_Practice_Providers__c,
                    Required_to_Bill__c, APP_Reimbursement__c, MED_ONC_UROL__c, RAD_ONC__c,
                    DRUGS__c, Termination_W_O_Cause__c, In_House_Pharmacy__c, Flow_Cytometry__c, Comments__c,
                    Payor_Details_New_Field_1__c, Payor_Details_Field1_Name__c, Payor_Details_New_Field_2__c, 
                    Payor_Details_Field2_Name__c,Payor_Details_New_Field_3__c, Payor_Details_Field3_Name__c,
                    Claim_Deadlines_New_Field_1__c, Claim_Details_Field1_Name__c, Claim_Deadlines_New_Field_2__c, 
                    Claim_Details_Field2_Name__c, Claim_Deadlines_New_Field_3__c, Claim_Details_Field3_Name__c,
                    Prior_Authorizations_New_Field_1__c, Prior_Details_Field1_Name__c, Prior_Authorizations_New_Field_2__c,
                    Prior_Details_Field2_Name__c, Prior_Authorizations_New_Field_3__c, Prior_Details_Field3_Name__c,
                    Lab_New_Field_1__c, Lab_Details_Field1_Name__c, Lab_New_Field_2__c, 
                    Lab_Details_Field2_Name__c, Lab_New_Field_3__c, Lab_Details_Field3_Name__c, 
                    Payment_Basis_New_Field_1__c, Payment_Details_Field1_Name__c, Payment_Basis_New_Field_2__c, 
                    Payment_Details_Field2_Name__c, Payment_Basis_New_Field_3__c, Payment_Details_Field3_Name__c,
                    Fee_Schedule_New_Field_1__c, Fee_Details_Field1_Name__c, Fee_Schedule_New_Field_2__c, 
                    Fee_Details_Field2_Name__c, Fee_Schedule_New_Field_3__c, Fee_Details_Field3_Name__c,
                    Pharmacy_New_Field_1__c, Pharmacy_Details_Field1_Name__c, Pharmacy_New_Field_2__c, 
                    Pharmacy_Details_Field2_Name__c, Pharmacy_New_Field_3__c, Pharmacy_Details_Field3_Name__c
                    FROM RuleFull__c Order By Name_Of_Payor__c];
        
        System.assertEquals(null, controller.Beginning());
        controller.total_size = 2;
        System.assertEquals(null, controller.End());
        System.assertEquals(null, controller.Previous());
        System.assertEquals(null, controller.Next());
    }
    
    @isTest static void testGetDisableNext() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        System.assertEquals(true, controller.getDisableNext());
    }
    
    @isTest static void testGetTotalSize() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        System.assertEquals(0, controller.getTotal_size());
    }
    
    @isTest static void testPageNumber() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        System.assertEquals(1, controller.getPageNumber());
    }
    
    @isTest static void testGetTotalPages() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        System.assertEquals(0, controller.getTotalPages());
    }
    
    @isTest static void testExportRules() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        controller.exportRules();
        System.assertEquals('1111111', controller.filterParam);
       	controller.payorDetailFilter = false;
        controller.claimDetailFilter = false;
        controller.priorDetailFilter = false;
        controller.labDetailFilter = false;
        controller.paymentDetailFilter = false;
        controller.feeDetailFilter = false;
        controller.pharmacyDetailFilter = false;
        controller.exportRules();
        System.assertEquals('0000000', controller.filterParam);
    }
    
    @isTest static void testGoToAdminToolkit() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        controller.gotoAdminToolkit();
    }
    
    @isTest static void testGoToHome() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        controller.gotoHome();
    }
    
    @isTest(SeeAllData=true) static void testViewData() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        RuleFull__c newRule = new RuleFull__c();
        newRule.Name = 'TestRule';
        newRule.Name_Of_Payor__c = 'test';
        newRule.Effective_Date__c = date.parse('12/16/16');
        newRule.Practice__c = practice.id;
        insert newRule;
        controller.allRules = [SELECT Effective_Date__c, Name_Of_Payor__c, Payor_Products__c, FSC__c, PlanType__c,
                    Initial_Claim_Filing_Limit__c, Payment__c, Claim_Appeal_Filing_Limit__c,
                    Referrals_Needed__c, Precertification_Authorization__c, PreAuth_PreApproval_Radiation__c,
                    PreAuth_PreApproval_Diagnostics__c, Lab_in_Office__c, Name_of_Reference_Lab__c, Advanced_Practice_Providers__c,
                    Required_to_Bill__c, APP_Reimbursement__c, MED_ONC_UROL__c, RAD_ONC__c,
                    DRUGS__c, Termination_W_O_Cause__c, In_House_Pharmacy__c, Flow_Cytometry__c, Comments__c,
                    Payor_Details_New_Field_1__c, Payor_Details_Field1_Name__c, Payor_Details_New_Field_2__c, 
                    Payor_Details_Field2_Name__c,Payor_Details_New_Field_3__c, Payor_Details_Field3_Name__c,
                    Claim_Deadlines_New_Field_1__c, Claim_Details_Field1_Name__c, Claim_Deadlines_New_Field_2__c, 
                    Claim_Details_Field2_Name__c, Claim_Deadlines_New_Field_3__c, Claim_Details_Field3_Name__c,
                    Prior_Authorizations_New_Field_1__c, Prior_Details_Field1_Name__c, Prior_Authorizations_New_Field_2__c,
                    Prior_Details_Field2_Name__c, Prior_Authorizations_New_Field_3__c, Prior_Details_Field3_Name__c,
                    Lab_New_Field_1__c, Lab_Details_Field1_Name__c, Lab_New_Field_2__c, 
                    Lab_Details_Field2_Name__c, Lab_New_Field_3__c, Lab_Details_Field3_Name__c, 
                    Payment_Basis_New_Field_1__c, Payment_Details_Field1_Name__c, Payment_Basis_New_Field_2__c, 
                    Payment_Details_Field2_Name__c, Payment_Basis_New_Field_3__c, Payment_Details_Field3_Name__c,
                    Fee_Schedule_New_Field_1__c, Fee_Details_Field1_Name__c, Fee_Schedule_New_Field_2__c, 
                    Fee_Details_Field2_Name__c, Fee_Schedule_New_Field_3__c, Fee_Details_Field3_Name__c,
                    Pharmacy_New_Field_1__c, Pharmacy_Details_Field1_Name__c, Pharmacy_New_Field_2__c, 
                    Pharmacy_Details_Field2_Name__c, Pharmacy_New_Field_3__c, Pharmacy_Details_Field3_Name__c
                    FROM RuleFull__c Order By Name_Of_Payor__c];
        System.assertEquals(null, controller.viewData(0));
    }
    
    @isTest static void testFilterEnable() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        controller.filters = true;
        controller.filterEnable();
        System.assertEquals(false, controller.filters);
    }
    
    @isTest static void testSearchEnable() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        controller.searchRules = true;
        controller.searchEnable();
        System.assertEquals(false, controller.searchRules);
    }
    
    @isTest static void testAllFilterButton() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        controller.payorDetailFilter = true;
        controller.claimDetailFilter = true;
        controller.priorDetailFilter = true;
        controller.labDetailFilter = true;
        controller.paymentDetailFilter = true;
        controller.feeDetailFilter = true;
        controller.pharmacyDetailFilter = true;
        controller.allFilters = true;
        controller.allFilterButton();
        System.assertEquals(false, controller.payorDetailFilter);
        System.assertEquals(false, controller.claimDetailFilter);
        System.assertEquals(false, controller.priorDetailFilter);
        System.assertEquals(false, controller.labDetailFilter);
        System.assertEquals(false, controller.paymentDetailFilter);
        System.assertEquals(false, controller.feeDetailFilter);
        System.assertEquals(false, controller.pharmacyDetailFilter);
        System.assertEquals(false, controller.allFilters);
    }
    
    @isTest static void testLinks() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        controller.payorDetailFilter = true;
        controller.claimDetailFilter = true;
        controller.priorDetailFilter = true;
        controller.labDetailFilter = true;
        controller.paymentDetailFilter = true;
        controller.feeDetailFilter = true;
        controller.pharmacyDetailFilter = true;
        controller.payorDetailLink();
        controller.claimDetailLink();
        controller.priorDetailLink();
        controller.labDetailLink();
        controller.paymentDetailLink();
        controller.feeDetailLink();
        controller.pharmacyDetailLink();
        System.assertEquals(false, controller.payorDetailFilter);
        System.assertEquals(false, controller.claimDetailFilter);
        System.assertEquals(false, controller.priorDetailFilter);
        System.assertEquals(false, controller.labDetailFilter);
        System.assertEquals(false, controller.paymentDetailFilter);
        System.assertEquals(false, controller.feeDetailFilter);
        System.assertEquals(false, controller.pharmacyDetailFilter);
    }
    
    @isTest static void testSearchRules() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        System.assertEquals(null, controller.searchRules());
        controller.searchCriteria = 'a';
        controller.selectedField = 'Name_Of_Payor__c';
        System.assertEquals(null, controller.searchRules());
    }
    
    @isTest static void testClearSearch() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        System.assertEquals(null, controller.clearSearch());
    }
    
    @isTest static void testGetFieldNames() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_exportrulesController controller = new RPM_exportrulesController();
        controller.getFieldNames();
    }
}