public class RPM_enterRulesController {
    public List<String> newPayorDetail{get;set;}
    public List<String> payorDetailInput{get;set;}
    public List<String> newClaimDeadline{get;set;}
    public List<String> claimDeadlineInput{get;set;}
    public List<String> priorAuth{get;set;}
    public List<String> priorAuthInput{get;set;}
    public List<String> labDetail{get;set;}
    public List<String> labDetailInput{get;set;}
    public List<String> payBasis{get;set;}
    public List<String> payBasisInput{get;set;}
    public List<String> feeSchedule{get;set;}
    public List<String> feeScheduleInput{get;set;}
    public List<String> pharmacy{get;set;}
    public List<String> pharmacyInput{get;set;}
    public String newFieldDetail {get;set;}
    public String newFieldName {get;set;}
    public Date myDate { get; set; }
    public Boolean buttonEnable{get;set;}
    public boolean displayPopup{get; set;}
    public String selectedParent{get;set;}
    //Input Fields
    public String nameOfPayor{get;set;}
    public String payorProducts{get;set;}
    public String fsc{get;set;}
    public String planType{get;set;}
    public String initialFilingLimit{get;set;}
    public String payment{get;set;}
    public String appealFilingLimit{get;set;}
    public String referalsNeeded{get;set;}
    public String precertAuth{get;set;}
    public String preauthRadiation{get;set;}
    public String preauthDiagnostics{get;set;}
    public String labInOffice{get;set;}
    public String nameReferenceLab{get;set;}
    public String aPP{get;set;}
    public String requiredToBillAPP{get;set;}
    public String aPPReimburse{get;set;}
    public String reimburseMed{get;set;}
    public String reimburseRad{get;set;}
    public String reimburseDrugs{get;set;}
    public String termWOCause{get;set;}
    public String inHousePharmacy{get;set;}
    public String flowCytometry{get;set;}
    public String comments{get;set;}
    //CSV/Excel Import
    public String nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
    List<RuleFull__c> rulesUpload;
    List<Practice__c> practices;
    public String exceptionMessageUpload{get;set;}
    public String exceptionMessageInsert{get;set;}
    public Boolean exceptionUpload{get;set;}
    public Boolean exceptionInsert{get;set;}
    
    public RPM_enterRulesController() {
        selectedParent = ApexPages.currentPage().getParameters().get('selectedParent');
        newPayorDetail = new List<String>();
        payorDetailInput = new List<String>(3);
        newClaimDeadline = new List<String>();
        claimDeadlineInput = new List<String>(3);
        priorAuth = new List<String>();
        priorAuthInput = new List<String>(3);
        labDetail = new List<String>();
        labDetailInput = new List<String>(3);
        payBasis = new List<String>();
        payBasisInput = new List<String>(3);
        feeSchedule = new List<String>();
        feeScheduleInput = new List<String>(3);
        pharmacy = new List<String>();
        pharmacyInput = new List<String>(3);
        for(Integer i = 0; i < 3; i++){
            payorDetailInput[i]='';
            claimDeadlineInput[i]='';
            priorAuthInput[i]='';
            labDetailInput[i]='';
            payBasisInput[i]='';
            feeScheduleInput[i]='';
            pharmacyInput[i]='';
        }
        displayPopup = false;
        buttonEnable = true;
        exceptionUpload = false;
        exceptionInsert = false;
    }
    
    public void enableSubmit() {
        buttonEnable = false;
    }

    public void addNewDetail() {
        if(newFieldDetail.equals('Payor Details'))
            newPayorDetail.add(newFieldName);
        else if(newFieldDetail.equals('Claim Deadlines')) 
            newClaimDeadline.add(newFieldName);
        else if(newFieldDetail.equals('Prior Authorizations'))
            priorAuth.add(newFieldName);
        else if(newFieldDetail.equals('Lab Details'))
            labDetail.add(newFieldName);
        else if(newFieldDetail.equals('Payment Basis'))
            payBasis.add(newFieldName);
        else if(newFieldDetail.equals('Fee Schedule'))
            feeSchedule.add(newFieldName);
        else if(newFieldDetail.equals('Pharmacy'))
            pharmacy.add(newFieldName);
		
		newFieldName='';
        closePopup();
    }
    
    //POPUP screen for adding new fields
    public void showPopup() {  
        displayPopup = true;    
    }
    public void closePopup() {      
        displayPopup = false;    
    } 
    //Subtract new field that was added
    public void loseField() {
        if(newFieldDetail.equals('Payor Details'))
            newPayorDetail.remove(newPayorDetail.size()-1);
        else if(newFieldDetail.equals('Claim Deadlines')) 
            newClaimDeadline.remove(newClaimDeadline.size()-1);
        else if(newFieldDetail.equals('Prior Authorizations'))
            priorAuth.remove(priorAuth.size()-1);
        else if(newFieldDetail.equals('Lab Details'))
            labDetail.remove(labDetail.size()-1);
        else if(newFieldDetail.equals('Payment Basis'))
            payBasis.remove(payBasis.size()-1);
        else if(newFieldDetail.equals('Fee Schedule'))
            feeSchedule.remove(feeSchedule.size()-1);
        else if(newFieldDetail.equals('Pharmacy'))
            pharmacy.remove(pharmacy.size()-1);
    }
    
    public void clearFields() {
        myDate = null;
        nameOfPayor = null;
        payorProducts = null;
        fsc = null;
        planType = null;
        for(Integer i = 0; i < newPayorDetail.size(); i++){
            payorDetailInput[i]='';
        }
        initialFilingLimit = null;
        payment = null;
        appealFilingLimit = null;
        for(Integer i = 0; i < newClaimDeadline.size(); i++){
            claimDeadlineInput[i]='';
        }
        referalsNeeded = null;
        precertAuth = null;
        preauthRadiation = null;
        preauthDiagnostics = null;
        for(Integer i = 0; i < priorAuth.size(); i++){
            priorAuthInput[i]='';
        }
        labInOffice = null;
        nameReferenceLab = null;
        for(Integer i = 0; i < labDetail.size(); i++){
            labDetailInput[i]='';
        }
        aPP = null;
        requiredToBillAPP = null;
        aPPReimburse = null;
        for(Integer i = 0; i < payBasis.size(); i++){
            payBasisInput[i]='';
        }
        reimburseMed = null;
        reimburseRad = null;
        reimburseDrugs = null;
        for(Integer i = 0; i < feeSchedule.size(); i++){
            feeScheduleInput[i]='';
        }
        termWOCause = null;
        inHousePharmacy = null;
        flowCytometry = null;
        comments = null;
        for(Integer i = 0; i < pharmacy.size(); i++){
            pharmacyInput[i]='';
        }
    }
    
    //Import
    public PageReference ReadFile() {
        Integer parentIndex;
        try {
            //Convert the uploaded file which in is BLOB format into a string
			//nameFile = blobToString( contentFile, 'ISO-8859-1');   
			nameFile = contentFile.toString();
            
            //Separate every row of the excel file
            filelines = nameFile.split('\n');

            //Iterate through every line and create a New Rule for each row
            rulesUpload = new List<RuleFull__c>();
			practices = new List<Practice__c>();
			practices = [Select Name From Practice__c Order By Name];
            parentIndex = Integer.valueOf(selectedParent);
            
            for(Integer i=4;i<filelines.size();i++) {
                String[] inputValues = new String[]{};
                String target = '\"';
                String replacement = '';
                RuleFull__c r = new RuleFull__c();
                /* REGEX from http://stackoverflow.com/questions/1757065/java-splitting-a-comma-separated-string-but-ignoring-commas-in-quotes
                 * Split on the comma only if that comma has zero, or an even number of quotes ahead of it
                 
                  ,			match a comma
                  (?=   	start positive look ahead
                  (?:   	start non-capturing group 1
                  [^\"]*    match " zero or more times
                  [^\"]     match "
                  )*    	end group 1 and repeat it zero or more times
                  [^\"]*    match " zero or more times
                  $     	match the end of the string
                  ")    	stop positive look ahead 

                 */
                inputValues = filelines[i].split(',(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)', -1); 
                if(inputValues[0].length() == 0) {
                    break;
                }
                for(Integer n=0; n < inputValues.size(); n++) {
                    if(inputValues[n].contains('\"')) {
                        inputValues[n] = inputValues[n].replace(target, replacement);
                    }
                }
                
                r.Practice__c = practices.get(parentIndex).Id;
                r.Name = inputValues[0] + ' Rule';
                r.Effective_Date__c = myDate;
                r.Name_Of_Payor__c = inputValues[0];
                r.Payor_Products__c = inputValues[1];
                r.FSC__c = inputValues[2];
                r.PlanType__c = inputValues[3];
                r.Initial_Claim_Filing_Limit__c = inputValues[4];
                r.Payment__c = inputValues[5];
                r.Claim_Appeal_Filing_Limit__c = inputValues[6];
                r.Referrals_Needed__c = inputValues[7];
                r.Precertification_Authorization__c = inputValues[8];
                r.PreAuth_PreApproval_Radiation__c = inputValues[9];
                r.PreAuth_PreApproval_Diagnostics__c = inputValues[10];
                r.Lab_in_Office__c = inputValues[11];
                r.Name_of_Reference_Lab__c = inputValues[12];
                r.Advanced_Practice_Providers__c = inputValues[13];
                r.Required_to_Bill__c = inputValues[14];
                r.APP_Reimbursement__c = inputValues[15];
                r.MED_ONC_UROL__c = inputValues[16];
                r.RAD_ONC__c = inputValues[17];
                r.DRUGS__c = inputValues[18];
                r.Termination_W_O_Cause__c = inputValues[19];
                r.In_House_Pharmacy__c = inputValues[20];
                r.Flow_Cytometry__c = inputValues[21];
                r.Comments__c = inputValues[22];
                
                rulesUpload.add(r);
            }
        }
        catch(Exception e){
            System.debug(LoggingLevel.Error, 'An unexpected error has occurred: ' + e.getMessage());
            exceptionMessageUpload = e.getMessage();
            exceptionUpload = true;
        }  
        //Insert the collected records
        try{
            insert rulesUpload;
        }
        catch (Exception e)
        {
            System.debug(LoggingLevel.Error, 'An unexpected error has occurred: ' + e.getMessage());
            exceptionMessageInsert = e.getMessage();
            exceptionInsert = true;
        } 
        
        return null;
    }
    
    public void clearException() {
        exceptionUpload = false;
        if(exceptionInsert)
                clearUploadedRules();
        exceptionInsert = false;
    }

    public List<RuleFull__c> getuploadedRules() {
        if (rulesUpload != NULL) {
            if (rulesUpload.size() > 0)
                return rulesUpload;
            else
                return null;   
        }
        else
            return null;
    } 
    
    public void clearUploadedRules() {
        rulesUpload.clear();
    }
    
    //Submit new/updated rule
    public void submitRule() {
        //Create new rule, if dates match, add logic to update existing rule
        RuleFull__c newRule = new RuleFull__c();
        Integer parentIndex;
        practices = new List<Practice__c>();
        practices = [Select Name From Practice__c Order By Name];
        parentIndex = Integer.valueOf(selectedParent);

        Integer total_size = [Select count() from RuleFull__c];
        newRule.Name = nameOfPayor + ' Rule';
        
        //Insert fields from vfp
        newRule.Practice__c = practices.get(parentIndex).Id;
        newRule.Effective_Date__c = myDate;
        newRule.Name_Of_Payor__c = nameOfPayor;
        newRule.Payor_Products__c = payorProducts;
        newRule.FSC__c = fsc;
        newRule.PlanType__c = planType;
        newRule.Initial_Claim_Filing_Limit__c = initialFilingLimit;
        newRule.Payment__c = payment;
        newRule.Claim_Appeal_Filing_Limit__c = appealFilingLimit;
        newRule.Referrals_Needed__c = referalsNeeded;
        newRule.Precertification_Authorization__c = precertAuth;
        newRule.PreAuth_PreApproval_Radiation__c = preauthRadiation;
        newRule.PreAuth_PreApproval_Diagnostics__c = preauthDiagnostics;
        newRule.Lab_in_Office__c = labInOffice;
        newRule.Name_of_Reference_Lab__c = nameReferenceLab;
        newRule.Advanced_Practice_Providers__c = aPP;
        newRule.Required_to_Bill__c = requiredToBillAPP;
        newRule.APP_Reimbursement__c = aPPReimburse;
        newRule.MED_ONC_UROL__c = reimburseMed;
        newRule.RAD_ONC__c = reimburseRad;
        newRule.DRUGS__c = reimburseDrugs;
        newRule.Termination_W_O_Cause__c = termWOCause;
        newRule.In_House_Pharmacy__c = inHousePharmacy;
        newRule.Flow_Cytometry__c = flowCytometry;
        newRule.Comments__c = comments;
        if(newPayorDetail.size() > 0) {
            //practices.get(parentIndex).Payor_Details_New_Field_1__c = payorDetailInput.get(0);
            //practices.get(parentIndex).Payor_Details_Field1_Name__c = newPayorDetail.get(0);
            newRule.Payor_Details_New_Field_1__c = payorDetailInput.get(0);
            newRule.Payor_Details_Field1_Name__c = newPayorDetail.get(0);
        }
        if(newPayorDetail.size() > 1) {
            //practices.get(parentIndex).Payor_Details_New_Field_2__c = payorDetailInput.get(1);
            //practices.get(parentIndex).Payor_Details_Field2_Name__c = newPayorDetail.get(1);
            newRule.Payor_Details_New_Field_2__c = payorDetailInput.get(1);
            newRule.Payor_Details_Field2_Name__c = newPayorDetail.get(1);
        }
        if(newPayorDetail.size() > 2) {
            //practices.get(parentIndex).Payor_Details_New_Field_3__c = payorDetailInput.get(2);
            //practices.get(parentIndex).Payor_Details_Field3_Name__c = newPayorDetail.get(2);
            newRule.Payor_Details_New_Field_3__c = payorDetailInput.get(2);
            newRule.Payor_Details_Field3_Name__c = newPayorDetail.get(2);
        }
        if(newClaimDeadline.size() > 0) {
            //practices.get(parentIndex).Claim_Deadlines_New_Field_1__c = claimDeadlineInput.get(0);
            //practices.get(parentIndex).Claim_Details_Field1_Name__c = newClaimDeadline.get(0);
            newRule.Claim_Deadlines_New_Field_1__c = claimDeadlineInput.get(0);
            newRule.Claim_Details_Field1_Name__c = newClaimDeadline.get(0);
        }
        if(newClaimDeadline.size() > 1) {
            //practices.get(parentIndex).Claim_Deadlines_New_Field_2__c = claimDeadlineInput.get(1);
            //practices.get(parentIndex).Claim_Details_Field2_Name__c = newClaimDeadline.get(1);
            newRule.Claim_Deadlines_New_Field_2__c = claimDeadlineInput.get(1);
            newRule.Claim_Details_Field2_Name__c = newClaimDeadline.get(1);
        }
        if(newClaimDeadline.size() > 2) {
            //practices.get(parentIndex).Claim_Deadlines_New_Field_3__c = claimDeadlineInput.get(2);
            //practices.get(parentIndex).Claim_Details_Field3_Name__c = newClaimDeadline.get(2);
            newRule.Claim_Deadlines_New_Field_3__c = claimDeadlineInput.get(2);
            newRule.Claim_Details_Field3_Name__c = newClaimDeadline.get(2);
        }
        if(priorAuth.size() > 0) {
            //practices.get(parentIndex).Prior_Authorizations_New_Field_1__c = priorAuthInput.get(0);
            //practices.get(parentIndex).Prior_Details_Field1_Name__c = priorAuth.get(0);
            newRule.Prior_Authorizations_New_Field_1__c = priorAuthInput.get(0);
            newRule.Prior_Details_Field1_Name__c = priorAuth.get(0);
        }
        if(priorAuth.size() > 1) {
            //practices.get(parentIndex).Prior_Authorizations_New_Field_2__c = priorAuthInput.get(1);
            //practices.get(parentIndex).Prior_Details_Field2_Name__c = priorAuth.get(1);
            newRule.Prior_Authorizations_New_Field_2__c = priorAuthInput.get(1);
            newRule.Prior_Details_Field2_Name__c = priorAuth.get(1);
        }
        if(priorAuth.size() > 2) {
            //practices.get(parentIndex).Prior_Authorizations_New_Field_3__c = priorAuthInput.get(2);
            //practices.get(parentIndex).Prior_Details_Field3_Name__c = priorAuth.get(2);
            newRule.Prior_Authorizations_New_Field_3__c = priorAuthInput.get(2);
            newRule.Prior_Details_Field3_Name__c = priorAuth.get(2);
        }
        if(labDetail.size() > 0) {
            //practices.get(parentIndex).Lab_New_Field_1__c = labDetailInput.get(0);
            //practices.get(parentIndex).Lab_Details_Field1_Name__c = labDetail.get(0);
            newRule.Lab_New_Field_1__c = labDetailInput.get(0);
            newRule.Lab_Details_Field1_Name__c = labDetail.get(0);
        }
        if(labDetail.size() > 1) {
            //practices.get(parentIndex).Lab_New_Field_2__c = labDetailInput.get(1);
            //practices.get(parentIndex).Lab_Details_Field2_Name__c = labDetail.get(1);
            newRule.Lab_New_Field_2__c = labDetailInput.get(1);
            newRule.Lab_Details_Field2_Name__c = labDetail.get(1);
        }
        if(labDetail.size() > 2) {
            //practices.get(parentIndex).Lab_New_Field_3__c = labDetailInput.get(2);
            //practices.get(parentIndex).Lab_Details_Field3_Name__c = labDetail.get(2);
            newRule.Lab_New_Field_3__c = labDetailInput.get(2);
            newRule.Lab_Details_Field3_Name__c = labDetail.get(2);
        }
        if(payBasis.size() > 0) {
            //practices.get(parentIndex).Payment_Basis_New_Field_1__c = payBasisInput.get(0);
            //practices.get(parentIndex).Payment_Details_Field1_Name__c = payBasis.get(0);
            newRule.Payment_Basis_New_Field_1__c = payBasisInput.get(0);
            newRule.Payment_Details_Field1_Name__c = payBasis.get(0);
        }
        if(payBasis.size() > 1) {
            //practices.get(parentIndex).Payment_Basis_New_Field_2__c = payBasisInput.get(1);
            //practices.get(parentIndex).Payment_Details_Field2_Name__c = payBasis.get(1);
            newRule.Payment_Basis_New_Field_2__c = payBasisInput.get(1);
            newRule.Payment_Details_Field2_Name__c = payBasis.get(1);
        }
        if(payBasis.size() > 2) {
            //practices.get(parentIndex).Payment_Basis_New_Field_3__c = payBasisInput.get(2);
            //practices.get(parentIndex).Payment_Details_Field3_Name__c = payBasis.get(2);
            newRule.Payment_Basis_New_Field_3__c = payBasisInput.get(2);
            newRule.Payment_Details_Field3_Name__c = payBasis.get(2);
        }
        if(feeSchedule.size() > 0) {
            //practices.get(parentIndex).Fee_Schedule_New_Field_1__c = feeScheduleInput.get(0);
            //practices.get(parentIndex).Fee_Details_Field1_Name__c = feeSchedule.get(0);
            newRule.Fee_Schedule_New_Field_1__c = feeScheduleInput.get(0);
            newRule.Fee_Details_Field1_Name__c = feeSchedule.get(0);
        }
        if(feeSchedule.size() > 1) {
            //practices.get(parentIndex).Fee_Schedule_New_Field_2__c = feeScheduleInput.get(1);
            //practices.get(parentIndex).Fee_Details_Field2_Name__c = feeSchedule.get(1);
            newRule.Fee_Schedule_New_Field_2__c = feeScheduleInput.get(1);
            newRule.Fee_Details_Field2_Name__c = feeSchedule.get(1);
        }
        if(feeSchedule.size() > 2) {
            //practices.get(parentIndex).Fee_Schedule_New_Field_3__c = feeScheduleInput.get(2);
            //practices.get(parentIndex).Fee_Details_Field3_Name__c = feeSchedule.get(2);
            newRule.Fee_Schedule_New_Field_3__c = feeScheduleInput.get(2);
            newRule.Fee_Details_Field3_Name__c = feeSchedule.get(2);
        }
        if(pharmacy.size() > 0) {
            //practices.get(parentIndex).Pharmacy_New_Field_1__c = pharmacyInput.get(0);
            //practices.get(parentIndex).Pharmacy_Details_Field1_Name__c = pharmacy.get(0);
            newRule.Pharmacy_New_Field_1__c = pharmacyInput.get(0);
            newRule.Pharmacy_Details_Field1_Name__c = pharmacy.get(0);
        }
        if(pharmacy.size() > 1) {
            //practices.get(parentIndex).Pharmacy_New_Field_2__c = pharmacyInput.get(1);
            //practices.get(parentIndex).Pharmacy_Details_Field2_Name__c = pharmacy.get(1);
            newRule.Pharmacy_New_Field_2__c = pharmacyInput.get(1);
            newRule.Pharmacy_Details_Field2_Name__c = pharmacy.get(1);
        }
        if(pharmacy.size() > 2) {
            //practices.get(parentIndex).Pharmacy_New_Field_3__c = pharmacyInput.get(2);
            //practices.get(parentIndex).Pharmacy_Details_Field3_Name__c = pharmacy.get(2);
            newRule.Pharmacy_New_Field_3__c = pharmacyInput.get(2);
            newRule.Pharmacy_Details_Field3_Name__c = pharmacy.get(2);
        }
        
        try {
          insert newRule;
            
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    
    public PageReference gotoAdminToolkit()
    {
        String url = '/apex/RPM_AdminTools?selectedParent=' + selectedParent;
        PageReference pageRef = new PageReference(url);
        pageRef.setRedirect(true);
        return pageRef;
    }
    
    public PageReference gotoHome() {
        PageReference pr = new pagereference('https://ap1.salesforce.com/home/home.jsp');
        pr.setRedirect(true);
        return pr;
    }
}