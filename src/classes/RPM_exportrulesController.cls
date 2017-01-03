public class RPM_exportrulesController {
    public List<RuleFull__c> allRules{get;set;}
    public String myDate { get; set; }
    public Boolean notValidDate {get;set;}
    public String fileName{get;set;}
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
    public List<String> payorDetailInput{get;set;}
    public List<String> claimDeadlineInput{get;set;}
    public List<String> priorAuthInput{get;set;}
    public List<String> labDetailInput{get;set;}
    public List<String> payBasisInput{get;set;}
    public List<String> feeScheduleInput{get;set;}
    public List<String> pharmacyInput{get;set;}
    //Pagination
    private integer counter = 0; //keep track of offset
    private integer list_size=1;
    public integer total_size;
    //Filter
    public Boolean filters{get;set;}
    public Boolean searchRules{get;set;}
    public String searchCriteria{get;set;}
    public Boolean allFilters{get;set;}
    public Boolean payorDetailFilter{get;set;}
    public Boolean claimDetailFilter{get;set;}
    public Boolean priorDetailFilter{get;set;}
    public Boolean labDetailFilter{get;set;}
    public Boolean paymentDetailFilter{get;set;}
    public Boolean feeDetailFilter{get;set;}
    public Boolean pharmacyDetailFilter{get;set;}
    public String filterParam{get;set;}
    public String selectedField{get;set;}
    
    public RPM_exportRulesController() {
        notValidDate = false;
        payorDetailInput = new List<String>(3);
        claimDeadlineInput = new List<String>(3);
        priorAuthInput = new List<String>(3);
        labDetailInput = new List<String>(3);
        payBasisInput = new List<String>(3);
        feeScheduleInput = new List<String>(3);
        pharmacyInput = new List<String>(3);
        filters = false;
        searchRules = false;
        selectedField = 'Name_Of_Payor__c';
        allFilters = true;
        payorDetailFilter = true;
        claimDetailFilter = true;
        priorDetailFilter = true;
        labDetailFilter = true;
        paymentDetailFilter = true;
        feeDetailFilter = true;
        pharmacyDetailFilter = true;
        filterParam = '1111111';
        searchCriteria = '';
        fileName='';
        allRules = [SELECT Effective_Date__c, Name_Of_Payor__c, Payor_Products__c, FSC__c, PlanType__c,
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
        total_size = [Select count() FROM RuleFull__c];
        if(total_size > 0)
        	viewData(0);
        else 
            emptyData();
    }
    
    public PageReference emptyData() {
        myDate = '';
        nameOfPayor = '';
        payorProducts = '';
        fsc = '';
        planType = '';
        initialFilingLimit = '';
        payment = '';
        appealFilingLimit = '';
        referalsNeeded = '';
        precertAuth = '';
        preauthRadiation = '';
        preauthDiagnostics = '';
        labInOffice = '';
        nameReferenceLab = '';
        aPP = '';
        requiredToBillAPP = '';
        aPPReimburse = '';
        reimburseMed = '';
        reimburseRad = '';
        reimburseDrugs = '';
        termWOCause = '';
        inHousePharmacy = '';
        flowCytometry = '';
        comments = '';
        
		return null;
    }
    
    public PageReference viewData(Integer index) {
        myDate = allRules.get(index).Effective_Date__c.format();
        nameOfPayor = allRules.get(index).Name_Of_Payor__c;
        payorProducts = allRules.get(index).Payor_Products__c;
        fsc = allRules.get(index).FSC__c;
        planType = allRules.get(index).PlanType__c;
        initialFilingLimit = allRules.get(index).Initial_Claim_Filing_Limit__c;
        payment = allRules.get(index).Payment__c;
        appealFilingLimit = allRules.get(index).Claim_Appeal_Filing_Limit__c;
        referalsNeeded = allRules.get(index).Referrals_Needed__c;
        precertAuth = allRules.get(index).Precertification_Authorization__c;
        preauthRadiation = allRules.get(index).PreAuth_PreApproval_Radiation__c;
        preauthDiagnostics = allRules.get(index).PreAuth_PreApproval_Diagnostics__c;
        labInOffice = allRules.get(index).Lab_in_Office__c;
        nameReferenceLab = allRules.get(index).Name_of_Reference_Lab__c;
        aPP = allRules.get(index).Advanced_Practice_Providers__c;
        requiredToBillAPP = allRules.get(index).Required_to_Bill__c;
        aPPReimburse = allRules.get(index).APP_Reimbursement__c;
        reimburseMed = allRules.get(index).MED_ONC_UROL__c;
        reimburseRad = allRules.get(index).RAD_ONC__c;
        reimburseDrugs = allRules.get(index).DRUGS__c;
        termWOCause = allRules.get(index).Termination_W_O_Cause__c;
        inHousePharmacy = allRules.get(index).In_House_Pharmacy__c;
        flowCytometry = allRules.get(index).Flow_Cytometry__c;
        comments = allRules.get(index).Comments__c;
        payorDetailInput.set(0, allRules.get(index).Payor_Details_New_Field_1__c);
        payorDetailInput.set(1, allRules.get(index).Payor_Details_New_Field_2__c);
        payorDetailInput.set(2, allRules.get(index).Payor_Details_New_Field_3__c);
    	claimDeadlineInput.set(0, allRules.get(index).Claim_Deadlines_New_Field_1__c);
        claimDeadlineInput.set(1, allRules.get(index).Claim_Deadlines_New_Field_2__c);
        claimDeadlineInput.set(2, allRules.get(index).Claim_Deadlines_New_Field_3__c);
        priorAuthInput.set(0, allRules.get(index).Prior_Authorizations_New_Field_1__c);
        priorAuthInput.set(1, allRules.get(index).Prior_Authorizations_New_Field_2__c);
        priorAuthInput.set(2, allRules.get(index).Prior_Authorizations_New_Field_3__c);
    	labDetailInput.set(0, allRules.get(index).Lab_New_Field_1__c);
    	labDetailInput.set(1, allRules.get(index).Lab_New_Field_2__c);
    	labDetailInput.set(2, allRules.get(index).Lab_New_Field_3__c);
    	payBasisInput.set(0, allRules.get(index).Payment_Basis_New_Field_1__c);
        payBasisInput.set(1, allRules.get(index).Payment_Basis_New_Field_2__c);
        payBasisInput.set(2, allRules.get(index).Payment_Basis_New_Field_3__c);
    	feeScheduleInput.set(0, allRules.get(index).Fee_Schedule_New_Field_1__c);
        feeScheduleInput.set(1, allRules.get(index).Fee_Schedule_New_Field_2__c);
        feeScheduleInput.set(2, allRules.get(index).Fee_Schedule_New_Field_3__c);
    	pharmacyInput.set(0, allRules.get(index).Pharmacy_New_Field_1__c);
        pharmacyInput.set(1, allRules.get(index).Pharmacy_New_Field_2__c);
        pharmacyInput.set(2, allRules.get(index).Pharmacy_New_Field_3__c);
        
        return null;
    }
    
    //Pagination
    public Boolean getDisablePrevious() { if(counter>0) return false; else return true; }
    public Boolean getDisableNext() { if(counter + list_size < total_size) return false; else return true; }
    public Integer getTotal_size() { return total_size; }
    public Integer getPageNumber() { return counter/list_size + 1; }
    public Integer getTotalPages() {
        if(math.mod(total_size, list_size) > 0) { 
            return total_size/list_size + 1; 
        } else {
            return (total_size/list_size);
        }
    }
    
    public PageReference Beginning() {
        counter = 0;
        viewData(counter);
        return null;
    }
    
    public PageReference Previous() {
        counter -= list_size;
        viewData(counter);
        return null;
    }
    
    public PageReference Next() {
        counter += list_size;
        viewData(counter);
        return null;
    }
    
    public PageReference End() {
        counter = total_size - math.mod(total_size, list_size)-1;
        viewData(counter);
        return null;
    }
    
    public PageReference exportRules() {
        if(payorDetailFilter) { filterParam = '1' + filterParam.substring(1,7); }
        else { filterParam = '0' + filterParam.substring(1,7); }
        if(claimDetailFilter) { filterParam = filterParam.substring(0,1) + '1' + filterParam.substring(2,7); }
        else { filterParam = filterParam.substring(0,1) + '0' + filterParam.substring(2,7); }
        if(priorDetailFilter) { filterParam = filterParam.substring(0,2) + '1' + filterParam.substring(3,7); }
        else { filterParam = filterParam.substring(0,2) + '0' + filterParam.substring(3,7); }
        if(labDetailFilter) { filterParam = filterParam.substring(0,3) + '1' + filterParam.substring(4,7); }
        else { filterParam = filterParam.substring(0,3) + '0' + filterParam.substring(4,7); }
        if(paymentDetailFilter) { filterParam = filterParam.substring(0,4) + '1' + filterParam.substring(5,7); }
        else { filterParam = filterParam.substring(0,4) + '0' + filterParam.substring(5,7); }
        if(feeDetailFilter) { filterParam = filterParam.substring(0,5) + '1' + filterParam.substring(6,7); }
        else { filterParam = filterParam.substring(0,5) + '0' + filterParam.substring(6,7); }
        if(pharmacyDetailFilter) { filterParam = filterParam.substring(0,6) + '1'; }
        else { filterParam = filterParam.substring(0,6) + '0'; }
        
        String url = '/apex/RPM_ExportedToExcel?fileName=' + fileName + '&filters=' + filterParam + '&search=' + selectedField + '&criteria=' + searchCriteria;
        PageReference pageRef = new PageReference(url);
        pageRef.setRedirect(true);
        return pageRef;
    }
    
    public void updateRules() {
        try {
            allRules.get(counter).Effective_Date__c = date.parse(myDate);
            notValidDate = false;
        } catch(Exception e) {
            System.debug('Today\'s date set as effecite date because the follow exception occurred: ' + e.getMessage());
            allRules.get(counter).Effective_Date__c = date.today();
            myDate = date.today().format();
            notValidDate = true;
        }
                
        allRules.get(counter).Name_Of_Payor__c = nameOfPayor;
        allRules.get(counter).Payor_Products__c = payorProducts;
        allRules.get(counter).FSC__c = fsc;
        allRules.get(counter).PlanType__c = planType;
        allRules.get(counter).Initial_Claim_Filing_Limit__c = initialFilingLimit;
        allRules.get(counter).Payment__c = payment;
        allRules.get(counter).Claim_Appeal_Filing_Limit__c = appealFilingLimit;
        allRules.get(counter).Referrals_Needed__c = referalsNeeded;
        allRules.get(counter).Precertification_Authorization__c = precertAuth;
        allRules.get(counter).PreAuth_PreApproval_Radiation__c = preauthRadiation;
        allRules.get(counter).PreAuth_PreApproval_Diagnostics__c = preauthDiagnostics;
        allRules.get(counter).Lab_in_Office__c = labInOffice;
        allRules.get(counter).Name_of_Reference_Lab__c = nameReferenceLab;
        allRules.get(counter).Advanced_Practice_Providers__c = aPP;
        allRules.get(counter).Required_to_Bill__c = requiredToBillAPP;
        allRules.get(counter).APP_Reimbursement__c = aPPReimburse;
        allRules.get(counter).MED_ONC_UROL__c = reimburseMed;
        allRules.get(counter).RAD_ONC__c = reimburseRad;
        allRules.get(counter).DRUGS__c = reimburseDrugs;
        allRules.get(counter).Termination_W_O_Cause__c = termWOCause;
        allRules.get(counter).In_House_Pharmacy__c = inHousePharmacy;
        allRules.get(counter).Flow_Cytometry__c = flowCytometry;
        allRules.get(counter).Comments__c = comments;
        
        allRules.get(counter).Payor_Details_New_Field_1__c = payorDetailInput.get(0);
        allRules.get(counter).Payor_Details_New_Field_2__c = payorDetailInput.get(1);
        allRules.get(counter).Payor_Details_New_Field_3__c = payorDetailInput.get(2);
        allRules.get(counter).Claim_Deadlines_New_Field_1__c = claimDeadlineInput.get(0);
        allRules.get(counter).Claim_Deadlines_New_Field_2__c = claimDeadlineInput.get(1);
        allRules.get(counter).Claim_Deadlines_New_Field_3__c = claimDeadlineInput.get(2);
        allRules.get(counter).Prior_Authorizations_New_Field_1__c = priorAuthInput.get(0);
        allRules.get(counter).Prior_Authorizations_New_Field_2__c = priorAuthInput.get(1);
        allRules.get(counter).Prior_Authorizations_New_Field_3__c = priorAuthInput.get(2);
        allRules.get(counter).Lab_New_Field_1__c = labDetailInput.get(0);
        allRules.get(counter).Lab_New_Field_2__c = labDetailInput.get(1);
        allRules.get(counter).Lab_New_Field_3__c = labDetailInput.get(2);
        allRules.get(counter).Payment_Basis_New_Field_1__c = payBasisInput.get(0);
        allRules.get(counter).Payment_Basis_New_Field_2__c = payBasisInput.get(1);
        allRules.get(counter).Payment_Basis_New_Field_3__c = payBasisInput.get(2);
        allRules.get(counter).Fee_Schedule_New_Field_1__c = feeScheduleInput.get(0);
        allRules.get(counter).Fee_Schedule_New_Field_2__c = feeScheduleInput.get(1);
        allRules.get(counter).Fee_Schedule_New_Field_3__c = feeScheduleInput.get(2);
        allRules.get(counter).Pharmacy_New_Field_1__c = pharmacyInput.get(0);
        allRules.get(counter).Pharmacy_New_Field_2__c = pharmacyInput.get(1);
        allRules.get(counter).Pharmacy_New_Field_3__c = pharmacyInput.get(2);
        
        try {
            update allRules;
            
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    
    //Filters
    public void filterEnable() {
        filters = !filters;
    }

    public void searchEnable() {
        searchRules = !searchRules;
    }   
    
    public void allFilterButton() {
        payorDetailFilter = !allFilters;
        claimDetailFilter = !allFilters;
        priorDetailFilter = !allFilters;
        labDetailFilter = !allFilters;
        paymentDetailFilter = !allFilters;
        feeDetailFilter = !allFilters;
        pharmacyDetailFilter = !allFilters;
        allFilters = !allFilters;
    }
    
    public void payorDetailLink() { payorDetailFilter = !payorDetailFilter; }
    public void claimDetailLink() { claimDetailFilter = !claimDetailFilter; }
    public void priorDetailLink() { priorDetailFilter = !priorDetailFilter; }
    public void labDetailLink() { labDetailFilter = !labDetailFilter; }
    public void paymentDetailLink() { paymentDetailFilter = !paymentDetailFilter; }
    public void feeDetailLink() { feeDetailFilter = !feeDetailFilter; }
    public void pharmacyDetailLink() { pharmacyDetailFilter = !pharmacyDetailFilter; }
    
    public List<SelectOption> getFieldNames() {
        List<SelectOption> options = new List<SelectOption>();
        String choice;
        
        //options.add(new SelectOption('Effective_Date__c', 'Effective Date (MM/DD/YY)'));
        options.add(new SelectOption('Name_Of_Payor__c','Name of Payor'));
        options.add(new SelectOption('Payor_Products__c','Payor Products'));
        options.add(new SelectOption('FSC__c','FSC'));
        options.add(new SelectOption('PlanType__c','Plan Type'));
        options.add(new SelectOption('Initial_Claim_Filing_Limit__c','Initial Claim Filing Limit'));
        options.add(new SelectOption('Payment__c','Payment'));
        options.add(new SelectOption('Claim_Appeal_Filing_Limit__c','Claim Appeal Filing Limit'));
        options.add(new SelectOption('Referrals_Needed__c','Referrals Needed'));
        options.add(new SelectOption('Precertification_Authorization__c','Precertification/Auth'));
        options.add(new SelectOption('PreAuth_PreApproval_Radiation__c','PreAuth Radiation'));
        options.add(new SelectOption('PreAuth_PreApproval_Diagnostics__c','PreAuth Diagnostics'));
        options.add(new SelectOption('Lab_in_Office__c','Lab in Office'));
        options.add(new SelectOption('Name_of_Reference_Lab__c','Name of Reference Lab'));
        options.add(new SelectOption('Advanced_Practice_Providers__c','Advanced Practice Providers'));
        options.add(new SelectOption('Required_to_Bill__c','Required to Bill in APP Name'));
        options.add(new SelectOption('APP_Reimbursement__c','APP Reimbursement'));
        options.add(new SelectOption('MED_ONC_UROL__c','MED ONC/UROL'));
        options.add(new SelectOption('RAD_ONC__c','RAD ONC'));
        options.add(new SelectOption('DRUGS__c','DRUGS'));
        options.add(new SelectOption('Termination_W_O_Cause__c','Termination W/O Cause'));
        options.add(new SelectOption('In_House_Pharmacy__c','In-House Pharmacy'));
        options.add(new SelectOption('Flow_Cytometry__c','Flow Cytometry'));
        options.add(new SelectOption('Comments__c','Comments'));
        
        return options;
    }
    
    public PageReference searchRules() {
        if(searchCriteria != null && searchCriteria.trim() != '') {
        	viewSearchedRules();
        }
        return null;
    }
    
    public PageReference clearSearch() {
        allRules = [SELECT Effective_Date__c, Name_Of_Payor__c, Payor_Products__c, FSC__c, PlanType__c,
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
        total_size = [Select count() FROM RuleFull__c];
        if(total_size > 0)
        	viewData(0);
        else 
            emptyData();
        
        return null;
    }
    
    public PageReference viewSearchedRules() {
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
        
        allRules = database.query(SOQLQuery);
        total_size = allRules.size();
        if(total_size > 0) {
            counter=0;
        	viewData(counter);
        }
        else 
            emptyData();
        
        return null;
    }

	public PageReference gotoAdminToolkit() {
       PageReference pr = Page.RPM_AdminTools;
       pr.setRedirect(true);
       return pr;
    }  
    
}