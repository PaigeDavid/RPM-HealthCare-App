@isTest
public class RPM_AdminToolsControllerTest {

    @isTest static void testPageReferences() {
        RPM_AdminToolsController controller = new RPM_AdminToolsController();
        controller.gotoHome();
        controller.gotoImport();
        controller.goToExport();
       	System.assertEquals(null, controller.deleteAllRecords());
    }
    
    @isTest static void testEnableButtons() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_AdminToolsController controller = new RPM_AdminToolsController();
        controller.selectedField = '0';
        controller.buttonsRendered = true;
        controller.enableButtons();
        System.assertEquals(false, controller.buttonsRendered);
    }
    
    @isTest static void testGetFieldNames() {
        Practice__c practice = new Practice__c();
        practice.Name = 'PracticeTest';
        insert practice;
        RPM_AdminToolsController controller = new RPM_AdminToolsController();
        List<SelectOption> testList = new List<SelectOption>();
        testList.add(new SelectOption('0', 'PracticeTest'));
        System.assertEquals(testList, controller.getFieldNames());
    }
    
    @isTest static void testCreateParent() {
        RPM_AdminToolsController controller = new RPM_AdminToolsController();
        controller.createParent();
        System.assertEquals('Must Enter a value', controller.newPracticeName);
        controller.newPracticeName = 'Test Practice';
        controller.createParent();
        System.assertEquals(1, controller.practices.size());
    }
}