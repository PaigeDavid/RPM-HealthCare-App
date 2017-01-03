public class RPM_ExportedToExcelController {
    public List<RuleFull__c> rules{get;set;}
    public String payorHeader{get;set;}
    public String claimHeader{get;set;}
    public String priorHeader{get;set;}
    public String labHeader{get;set;}
    public String paymentHeader{get;set;}
    public String feeHeader{get;set;}
    public String pharmacyHeader{get;set;}
    public String fileName{get;set;}
    public String filterParam{get;set;}
    public String selectedField{get;set;}
    public String searchCriteria{get;set;}
    public Boolean payorDetail{get;set;}
    public Boolean claimDetail{get;set;}
    public Boolean priorDetail{get;set;}
    public Boolean labDetail{get;set;}
    public Boolean paymentDetail{get;set;}
    public Boolean feeDetail{get;set;}
    public Boolean pharmacyDetail{get;set;}
    
    public RPM_ExportedToExcelController() {
        fileName = ApexPages.currentPage().getParameters().get('fileName');
        filterParam = ApexPages.currentPage().getParameters().get('filters');
        searchCriteria = ApexPages.currentPage().getParameters().get('criteria');
        selectedField = ApexPages.currentPage().getParameters().get('search');
        if(String.isBlank(fileName))
            fileName = 'RPMPayorRules';
        payorHeader = 'Payor Details';
        claimHeader = 'Claim Deadlines Details';
        priorHeader = 'Prior Authorizations Details';
        labHeader = 'Lab Details';
        paymentHeader = 'Payment Basis Details';
        feeHeader = 'Fee Schedule Details';
        pharmacyHeader = 'Pharmacy Details';
		
        if(String.isBlank(searchCriteria)) {
            System.debug(LoggingLevel.Error, 'Here');
            rules = [SELECT Effective_Date__c, Name_Of_Payor__c, Payor_Products__c, FSC__c, PlanType__c,
                        Initial_Claim_Filing_Limit__c, Payment__c, Claim_Appeal_Filing_Limit__c,
                        Referrals_Needed__c, Precertification_Authorization__c, PreAuth_PreApproval_Radiation__c,
                        PreAuth_PreApproval_Diagnostics__c, Lab_in_Office__c, Name_of_Reference_Lab__c, Advanced_Practice_Providers__c,
                        Required_to_Bill__c, APP_Reimbursement__c, MED_ONC_UROL__c, RAD_ONC__c,
                        DRUGS__c, Termination_W_O_Cause__c, In_House_Pharmacy__c, Flow_Cytometry__c, Comments__c,
                        Payor_Details_New_Field_1__c, Payor_Details_New_Field_2__c, Payor_Details_New_Field_3__c,
                        Claim_Deadlines_New_Field_1__c, Claim_Deadlines_New_Field_2__c, Claim_Deadlines_New_Field_3__c,
                        Prior_Authorizations_New_Field_1__c, Prior_Authorizations_New_Field_2__c ,Prior_Authorizations_New_Field_3__c,
                        Lab_New_Field_1__c, Lab_New_Field_2__c, Lab_New_Field_3__c,
                        Payment_Basis_New_Field_1__c, Payment_Basis_New_Field_2__c, Payment_Basis_New_Field_3__c, 
                        Fee_Schedule_New_Field_1__c, Fee_Schedule_New_Field_2__c, Fee_Schedule_New_Field_3__c,
                        Pharmacy_New_Field_1__c, Pharmacy_New_Field_2__c, Pharmacy_New_Field_3__c 
                        FROM RuleFull__c Order By Name_Of_Payor__c];

        }
        else {
            System.debug(LoggingLevel.Error, 'There');
            String tempInput = '\'%' + String.escapeSingleQuotes(searchCriteria.trim()) + '%\'';
        	String SOQLQuery = 'SELECT Effective_Date__c, Name_Of_Payor__c, Payor_Products__c, FSC__c, PlanType__c, ' +
                    'Initial_Claim_Filing_Limit__c, Payment__c, Claim_Appeal_Filing_Limit__c, ' +
                    'Referrals_Needed__c, Precertification_Authorization__c, PreAuth_PreApproval_Radiation__c, ' +
                    'PreAuth_PreApproval_Diagnostics__c, Lab_in_Office__c, Name_of_Reference_Lab__c, Advanced_Practice_Providers__c, ' +
                    'Required_to_Bill__c, APP_Reimbursement__c, MED_ONC_UROL__c, RAD_ONC__c, ' +
                    'DRUGS__c, Termination_W_O_Cause__c, In_House_Pharmacy__c, Flow_Cytometry__c, Comments__c, ' +
                    'Payor_Details_New_Field_1__c, Payor_Details_New_Field_2__c, Payor_Details_New_Field_3__c, ' +
                    'Claim_Deadlines_New_Field_1__c, Claim_Deadlines_New_Field_2__c, Claim_Deadlines_New_Field_3__c, ' +
                    'Prior_Authorizations_New_Field_1__c, Prior_Authorizations_New_Field_2__c ,Prior_Authorizations_New_Field_3__c, ' +
                    'Lab_New_Field_1__c, Lab_New_Field_2__c, Lab_New_Field_3__c, ' +
                    'Payment_Basis_New_Field_1__c, Payment_Basis_New_Field_2__c, Payment_Basis_New_Field_3__c, ' +
                    'Fee_Schedule_New_Field_1__c, Fee_Schedule_New_Field_2__c, Fee_Schedule_New_Field_3__c, ' +
                    'Pharmacy_New_Field_1__c, Pharmacy_New_Field_2__c, Pharmacy_New_Field_3__c ' +
                    'FROM RuleFull__c WHERE ' + selectedField + ' LIKE ' + tempInput + ' Order By Name_Of_Payor__c';
        
        	rules = database.query(SOQLQuery);

        }
        setFilters();
        //addQuotes();
    }
    
    public void setFilters() {
        if(filterParam != null && filterParam != '') {
            if(filterParam.subString(0,1) == '1') { payorDetail = true; }
            else { payorDetail = false; }
            if(filterParam.subString(1,2) == '1') { claimDetail = true; }
            else { claimDetail = false; }
            if(filterParam.subString(2,3) == '1') { priorDetail = true; }
            else { priorDetail = false; }
            if(filterParam.subString(3,4) == '1') { labDetail = true; }
            else { labDetail = false; }
            if(filterParam.subString(4,5) == '1') { paymentDetail = true; }
            else { paymentDetail = false; }
            if(filterParam.subString(5,6) == '1') { feeDetail = true; }
            else { feeDetail = false; }
            if(filterParam.subString(6,7) == '1') { pharmacyDetail = true; }
            else { pharmacyDetail = false; }
        }
    }
    /*
    public void addQuotes() {
        for(Integer i = 0; i < rules.size(); i++) {
            rules.get(i).Name_Of_Payor__c = '\"' + rules.get(i).Name_Of_Payor__c + '\"';
            rules.get(i).Payor_Products__c = '\"' + rules.get(i).Payor_Products__c + '\"';
            rules.get(i).FSC__c = '\"' + rules.get(i).FSC__c + '\"';
            rules.get(i).PlanType__c = '\"' + rules.get(i).PlanType__c + '\"';
            rules.get(i).Initial_Claim_Filing_Limit__c = '\"' + rules.get(i).Initial_Claim_Filing_Limit__c + '\"';
            rules.get(i).Payment__c = '\"' + rules.get(i).Payment__c + '\"';
            rules.get(i).Claim_Appeal_Filing_Limit__c = '\"' + rules.get(i).Claim_Appeal_Filing_Limit__c + '\"';
            rules.get(i).Referrals_Needed__c = '\"' + rules.get(i).Referrals_Needed__c + '\"';
            rules.get(i).Precertification_Authorization__c = '\"' + rules.get(i).Precertification_Authorization__c + '\"';
            rules.get(i).PreAuth_PreApproval_Radiation__c = '\"' + rules.get(i).PreAuth_PreApproval_Radiation__c + '\"';
            rules.get(i).PreAuth_PreApproval_Diagnostics__c = '\"' + rules.get(i).PreAuth_PreApproval_Diagnostics__c + '\"';
            rules.get(i).Lab_in_Office__c = '\"' + rules.get(i).Lab_in_Office__c + '\"';
            rules.get(i).Name_of_Reference_Lab__c = '\"' + rules.get(i).Name_of_Reference_Lab__c + '\"';
            rules.get(i).Advanced_Practice_Providers__c = '\"' + rules.get(i).Advanced_Practice_Providers__c + '\"';
            rules.get(i).Required_to_Bill__c = '\"' + rules.get(i).Required_to_Bill__c + '\"';
            rules.get(i).APP_Reimbursement__c = '\"' + rules.get(i).APP_Reimbursement__c + '\"';
            rules.get(i).MED_ONC_UROL__c = '\"' + rules.get(i).MED_ONC_UROL__c + '\"';
            rules.get(i).RAD_ONC__c = '\"' + rules.get(i).RAD_ONC__c + '\"';
            rules.get(i).DRUGS__c = '\"' + rules.get(i).DRUGS__c + '\"';
            rules.get(i).Termination_W_O_Cause__c = '\"' + rules.get(i).Termination_W_O_Cause__c + '\"';
            rules.get(i).In_House_Pharmacy__c = '\"' +  rules.get(i).In_House_Pharmacy__c + '\"';
            rules.get(i).Flow_Cytometry__c = '\"' + rules.get(i).Flow_Cytometry__c + '\"';
            rules.get(i).Comments__c = '\"' + rules.get(i).Comments__c + '\"';
            rules.get(i).Payor_Details_New_Field_1__c = '\"' + rules.get(i).Payor_Details_New_Field_1__c + '\"';
            rules.get(i).Payor_Details_New_Field_2__c = '\"' + rules.get(i).Payor_Details_New_Field_2__c + '\"';
            rules.get(i).Payor_Details_New_Field_3__c = '\"' +  rules.get(i).Payor_Details_New_Field_3__c + '\"';
            rules.get(i).Claim_Deadlines_New_Field_1__c = '\"' + rules.get(i).Claim_Deadlines_New_Field_1__c + '\"';
            rules.get(i).Claim_Deadlines_New_Field_2__c = '\"' + rules.get(i).Claim_Deadlines_New_Field_2__c + '\"';
            rules.get(i).Claim_Deadlines_New_Field_3__c = '\"' + rules.get(i).Claim_Deadlines_New_Field_3__c + '\"';
            rules.get(i).Prior_Authorizations_New_Field_1__c = '\"' + rules.get(i).Prior_Authorizations_New_Field_1__c + '\"';
            rules.get(i).Prior_Authorizations_New_Field_2__c = '\"' + rules.get(i).Prior_Authorizations_New_Field_2__c + '\"';
            rules.get(i).Prior_Authorizations_New_Field_3__c = '\"' + rules.get(i).Prior_Authorizations_New_Field_3__c + '\"';
            rules.get(i).Lab_New_Field_1__c = '\"' + rules.get(i).Lab_New_Field_1__c + '\"';
            rules.get(i).Lab_New_Field_2__c = '\"' + rules.get(i).Lab_New_Field_2__c + '\"';
            rules.get(i).Lab_New_Field_3__c = '\"' + rules.get(i).Lab_New_Field_3__c + '\"';
            rules.get(i).Payment_Basis_New_Field_1__c = '\"' + rules.get(i).Payment_Basis_New_Field_1__c + '\"';
            rules.get(i).Payment_Basis_New_Field_2__c = '\"' + rules.get(i).Payment_Basis_New_Field_2__c + '\"';
            rules.get(i).Payment_Basis_New_Field_3__c = '\"' + rules.get(i).Payment_Basis_New_Field_3__c + '\"';
            rules.get(i).Fee_Schedule_New_Field_1__c = '\"' + rules.get(i).Fee_Schedule_New_Field_1__c + '\"';
            rules.get(i).Fee_Schedule_New_Field_2__c = '\"' + rules.get(i).Fee_Schedule_New_Field_2__c + '\"';
            rules.get(i).Fee_Schedule_New_Field_3__c = '\"' + rules.get(i).Fee_Schedule_New_Field_3__c + '\"';
            rules.get(i).Pharmacy_New_Field_1__c = '\"' +  rules.get(i).Pharmacy_New_Field_1__c + '\"';
            rules.get(i).Pharmacy_New_Field_2__c = '\"' + rules.get(i).Pharmacy_New_Field_2__c + '\"';
            rules.get(i).Pharmacy_New_Field_3__c = '\"' + rules.get(i).Pharmacy_New_Field_3__c + '\"';
        }
    }
    */
    public PageReference returnToExportPage() {
		PageReference pr = Page.RPM_exportrules;
        pr.setRedirect(true);
        return pr;    
    }
}