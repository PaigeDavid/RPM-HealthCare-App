@isTest
public class RPM_AdminToolsControllerTest {
	static RPM_AdminToolsController controller = new RPM_AdminToolsController();
    
    @isTest static void testPageReferences() {
        controller.gotoImport();
        controller.goToExport();
       	System.assertEquals(null, controller.deleteAllRecords());
    }
}