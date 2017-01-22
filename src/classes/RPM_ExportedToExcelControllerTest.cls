@isTest
public class RPM_ExportedToExcelControllerTest {
    
    @isTest static void testBlankSearchCriteria() {
    	RuleFull__c newRule = new RuleFull__c();
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_ExportedToExcelController controller = new RPM_ExportedToExcelController();
    }
    
    @isTest static void testSetFitlers() {
        RuleFull__c newRule = new RuleFull__c();
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_ExportedToExcelController controller = new RPM_ExportedToExcelController();
        controller.selectedParent = '0';
        controller.filterParam = '1111111';
        controller.setFilters();
        System.assertEquals(true ,controller.payorDetail);
        System.assertEquals(true ,controller.claimDetail);
        System.assertEquals(true ,controller.priorDetail);
        System.assertEquals(true ,controller.labDetail);
        System.assertEquals(true ,controller.paymentDetail);
        System.assertEquals(true ,controller.feeDetail);
        System.assertEquals(true ,controller.pharmacyDetail);
        controller.filterParam = '0000000';
        controller.setFilters();
        System.assertEquals(false ,controller.payorDetail);
        System.assertEquals(false ,controller.claimDetail);
        System.assertEquals(false ,controller.priorDetail);
        System.assertEquals(false ,controller.labDetail);
        System.assertEquals(false ,controller.paymentDetail);
        System.assertEquals(false ,controller.feeDetail);
        System.assertEquals(false ,controller.pharmacyDetail);
    }

}