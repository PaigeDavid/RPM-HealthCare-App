@isTest
public class RPM_ExportedToExcelControllerTest {
	static RPM_ExportedToExcelController controller = new RPM_ExportedToExcelController();
    
    @isTest static void testFilename() {
    	controller.fileName = 'test';
        System.assertEquals('test',controller.fileName);
    }
    
    @isTest static void testSetFitlersTrue() {
        controller.filterParam = '1111111';
        controller.setFilters();
        System.assertEquals(true ,controller.payorDetail);
        System.assertEquals(true ,controller.claimDetail);
        System.assertEquals(true ,controller.priorDetail);
        System.assertEquals(true ,controller.labDetail);
        System.assertEquals(true ,controller.paymentDetail);
        System.assertEquals(true ,controller.feeDetail);
        System.assertEquals(true ,controller.pharmacyDetail);
    }
    
    @isTest static void testSetFitlersFalse() {
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