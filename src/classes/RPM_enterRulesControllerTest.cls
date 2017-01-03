@isTest
public class RPM_enterRulesControllerTest {
    static RPM_enterrulesController controller = new RPM_enterrulesController();

    @isTest static void testEnableSubmit() {
        controller.buttonEnable = true;
        controller.enableSubmit();
        System.assertEquals(false, controller.buttonEnable);
    }
    
    @isTest static void testAddNewDetailAndLoseField() {
        //addNewDetail()
        controller.newFieldDetail = 'Payor Details';
        controller.newFieldName = 'test1';
        controller.addNewDetail();
        controller.newFieldDetail = 'Claim Deadlines';
        controller.newFieldName = 'test2';
        controller.addNewDetail();
        controller.newFieldDetail = 'Prior Authorizations';
        controller.newFieldName = 'test3';
        controller.addNewDetail();
        controller.newFieldDetail = 'Lab Details';
        controller.newFieldName = 'test4';
        controller.addNewDetail();
        controller.newFieldDetail = 'Payment Basis';
        controller.newFieldName = 'test5';
        controller.addNewDetail();
        controller.newFieldDetail = 'Fee Schedule';
        controller.newFieldName = 'test6';
        controller.addNewDetail();
        controller.newFieldDetail = 'Pharmacy';
        controller.newFieldName = 'test7';
        controller.addNewDetail();
        System.assertEquals('test1', controller.newPayorDetail.get(0));
        System.assertEquals('test2', controller.newClaimDeadline.get(0));
        System.assertEquals('test3', controller.priorAuth.get(0));
        System.assertEquals('test4', controller.labDetail.get(0));
        System.assertEquals('test5', controller.payBasis.get(0));
        System.assertEquals('test6', controller.feeSchedule.get(0));
        System.assertEquals('test7', controller.pharmacy.get(0));
        //loseField()
        controller.newFieldDetail = 'Payor Details';
        controller.loseField();
        controller.newFieldDetail = 'Claim Deadlines';
        controller.loseField();
        controller.newFieldDetail = 'Prior Authorizations';
        controller.loseField();
        controller.newFieldDetail = 'Lab Details';
        controller.loseField();
        controller.newFieldDetail = 'Payment Basis';
        controller.loseField();
        controller.newFieldDetail = 'Fee Schedule';
        controller.loseField();
        controller.newFieldDetail = 'Pharmacy';
        controller.loseField();
        System.assertEquals(0, controller.newPayorDetail.size());
        System.assertEquals(0, controller.newClaimDeadline.size());
        System.assertEquals(0, controller.priorAuth.size());
        System.assertEquals(0, controller.labDetail.size());
        System.assertEquals(0, controller.payBasis.size());
        System.assertEquals(0, controller.feeSchedule.size());
        System.assertEquals(0, controller.pharmacy.size());
    }
    
    @isTest static void testPageReferences() {
        controller.gotoAdminToolkit();
        controller.showPopup();
    }
    
    @isTest static void testClearFields() {
        controller.newFieldDetail = 'Payor Details';
        controller.newFieldName = 'test1';
        controller.addNewDetail();
        controller.newFieldDetail = 'Claim Deadlines';
        controller.newFieldName = 'test2';
        controller.addNewDetail();
        controller.newFieldDetail = 'Prior Authorizations';
        controller.newFieldName = 'test3';
        controller.addNewDetail();
        controller.newFieldDetail = 'Lab Details';
        controller.newFieldName = 'test4';
        controller.addNewDetail();
        controller.newFieldDetail = 'Payment Basis';
        controller.newFieldName = 'test5';
        controller.addNewDetail();
        controller.newFieldDetail = 'Fee Schedule';
        controller.newFieldName = 'test6';
        controller.addNewDetail();
        controller.newFieldDetail = 'Pharmacy';
        controller.newFieldName = 'test7';
        controller.addNewDetail();
        
        controller.clearFields();
        System.assertEquals(null, controller.myDate);
        System.assertEquals(null, controller.nameOfPayor);
        System.assertEquals(null, controller.payorProducts);
        System.assertEquals(null, controller.fsc);
        System.assertEquals(null, controller.planType);
        System.assertEquals('', controller.payorDetailInput[0]);
        System.assertEquals(null, controller.initialFilingLimit);
        System.assertEquals(null, controller.payment);
        System.assertEquals(null, controller.appealFilingLimit);
        System.assertEquals('', controller.claimDeadlineInput[0]);
        System.assertEquals(null, controller.referalsNeeded);
        System.assertEquals(null, controller.precertAuth);
        System.assertEquals(null, controller.preauthRadiation);
        System.assertEquals(null, controller.preauthDiagnostics);
        System.assertEquals('', controller.priorAuthInput[0]);
        System.assertEquals(null, controller.labInOffice);
        System.assertEquals(null, controller.nameReferenceLab);
        System.assertEquals('', controller.labDetailInput[0]);
        System.assertEquals(null, controller.requiredToBillAPP);
        System.assertEquals(null, controller.aPPReimburse);
        System.assertEquals('', controller.payBasisInput[0]);
        System.assertEquals(null, controller.reimburseMed);
        System.assertEquals(null, controller.reimburseRad);
        System.assertEquals(null, controller.reimburseDrugs);
        System.assertEquals('', controller.feeScheduleInput[0]);
        System.assertEquals(null, controller.termWOCause);
        System.assertEquals(null, controller.inHousePharmacy);
        System.assertEquals(null, controller.flowCytometry);
        System.assertEquals(null, controller.comments);
        System.assertEquals('', controller.pharmacyInput[0]);
    }
    
    @isTest static void testSubmitRule() {
        controller.myDate = date.parse('12/16/16');
        controller.nameOfPayor = 'test';
        
        controller.newFieldDetail = 'Payor Details';
        controller.newFieldName = 'Payortest1';
        controller.addNewDetail();
        controller.newFieldDetail = 'Payor Details';
        controller.newFieldName = 'Payortest2';
        controller.addNewDetail();
        controller.newFieldDetail = 'Payor Details';
        controller.newFieldName = 'Payortest3';
        controller.addNewDetail();
        controller.newFieldDetail = 'Claim Deadlines';
        controller.newFieldName = 'Claimtest1';
        controller.addNewDetail();
        controller.newFieldDetail = 'Claim Deadlines';
        controller.newFieldName = 'Claimtest2';
        controller.addNewDetail();
        controller.newFieldDetail = 'Claim Deadlines';
        controller.newFieldName = 'Claimtest3';
        controller.addNewDetail();
        controller.newFieldDetail = 'Prior Authorizations';
        controller.newFieldName = 'Priortest1';
        controller.addNewDetail();
        controller.newFieldDetail = 'Prior Authorizations';
        controller.newFieldName = 'Priortest2';
        controller.addNewDetail();
        controller.newFieldDetail = 'Prior Authorizations';
        controller.newFieldName = 'Priortest3';
        controller.addNewDetail();
        controller.newFieldDetail = 'Lab Details';
        controller.newFieldName = 'Labtest1';
        controller.addNewDetail();
        controller.newFieldDetail = 'Lab Details';
        controller.newFieldName = 'Labtest2';
        controller.addNewDetail();
        controller.newFieldDetail = 'Lab Details';
        controller.newFieldName = 'Labtest3';
        controller.addNewDetail();
        controller.newFieldDetail = 'Payment Basis';
        controller.newFieldName = 'Paymenttest1';
        controller.addNewDetail();
        controller.newFieldDetail = 'Payment Basis';
        controller.newFieldName = 'Paymenttest2';
        controller.addNewDetail();
        controller.newFieldDetail = 'Payment Basis';
        controller.newFieldName = 'Paymenttest3';
        controller.addNewDetail();
        controller.newFieldDetail = 'Fee Schedule';
        controller.newFieldName = 'Feetest1';
        controller.addNewDetail();
        controller.newFieldDetail = 'Fee Schedule';
        controller.newFieldName = 'Feetest2';
        controller.addNewDetail();
        controller.newFieldDetail = 'Fee Schedule';
        controller.newFieldName = 'Feetest3';
        controller.addNewDetail();
        controller.newFieldDetail = 'Pharmacy';
        controller.newFieldName = 'Pharmacytest1';
        controller.addNewDetail();
        controller.newFieldDetail = 'Pharmacy';
        controller.newFieldName = 'Pharmacytest2';
        controller.addNewDetail();
        controller.newFieldDetail = 'Pharmacy';
        controller.newFieldName = 'Pharmacytest3';
        controller.addNewDetail();
        
        controller.submitRule();
    }
}