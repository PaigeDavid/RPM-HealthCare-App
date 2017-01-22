public class RPM_ExportedToExcelController {
    public List<RuleFull__c> rules{get;set;}
    List<Practice__c> practices;
    //public Practice__c practiceValues{get;set;}
    //public List<exportingTable> tableRows{get;set;}
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
    public String selectedParent{get;set;}
    public Boolean payorDetail{get;set;}
    public Boolean claimDetail{get;set;}
    public Boolean priorDetail{get;set;}
    public Boolean labDetail{get;set;}
    public Boolean paymentDetail{get;set;}
    public Boolean feeDetail{get;set;}
    public Boolean pharmacyDetail{get;set;}
    public String practiceName{get;set;}
    Integer parentIndex;
    
    //Wrapper class for tables
    /*public class exportingTable{
        public Practice__c thePractice{get;set;}
        public List<RuleFull__c> theRules{get;set;}
        public exportingTable(Practice__c p, List<RuleFull__c> r) {
            thePractice = p;
            theRules = r;
        }
    }
    */
    public RPM_ExportedToExcelController() {
        //fileName = ApexPages.currentPage().getParameters().get('fileName');
        filterParam = ApexPages.currentPage().getParameters().get('filters');
        searchCriteria = ApexPages.currentPage().getParameters().get('criteria');
        selectedField = ApexPages.currentPage().getParameters().get('search');
        selectedParent = ApexPages.currentPage().getParameters().get('selectedParent');
        //if(String.isBlank(fileName))
        if(String.isBlank(selectedParent))
            selectedParent = '0';
        fileName = 'RPMPayorRules';
        payorHeader = 'Payor Details';
        claimHeader = 'Claim Deadlines Details';
        priorHeader = 'Prior Authorizations Details';
        labHeader = 'Lab Details';
        paymentHeader = 'Payment Basis Details';
        feeHeader = 'Fee Schedule Details';
        pharmacyHeader = 'Pharmacy Details';
        practices = new List<Practice__c>();
        //practiceValues = new Practice__c();
        practices = [SELECT Name FROM Practice__c Order By Name];
        parentIndex = Integer.valueOf(selectedParent);
        practiceName = practices.get(parentIndex).Name;
        //tableRows = new List<exportingTable>();
        /*practiceValues = [SELECT Payor_Details_New_Field_1__c, Payor_Details_Field1_Name__c, Payor_Details_New_Field_2__c, 
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
                         FROM Practice__c WHERE Practice__c.Name = :practices.get(parentIndex).Name];
		*/
        if(String.isBlank(searchCriteria)) {
            rules = [SELECT Effective_Date__c, Name_Of_Payor__c, Payor_Products__c, FSC__c, PlanType__c,
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
                     	 FROM RuleFull__c WHERE Practice__c = :practices.get(parentIndex).Id Order By Name_Of_Payor__c];
        }
        else {
            String tempInputParent = '\'' + String.escapeSingleQuotes(practices.get(parentIndex).Id) + '\'';
            String tempInputFIeld = '\'%' + String.escapeSingleQuotes(searchCriteria.trim()) + '%\'';
        	String SOQLQuery = 'SELECT Effective_Date__c, Name_Of_Payor__c, Payor_Products__c, FSC__c, PlanType__c, ' +
                    'Initial_Claim_Filing_Limit__c, Payment__c, Claim_Appeal_Filing_Limit__c, ' +
                    'Referrals_Needed__c, Precertification_Authorization__c, PreAuth_PreApproval_Radiation__c, ' +
                    'PreAuth_PreApproval_Diagnostics__c, Lab_in_Office__c, Name_of_Reference_Lab__c, Advanced_Practice_Providers__c, ' +
                    'Required_to_Bill__c, APP_Reimbursement__c, MED_ONC_UROL__c, RAD_ONC__c, ' +
                    'DRUGS__c, Termination_W_O_Cause__c, In_House_Pharmacy__c, Flow_Cytometry__c, Comments__c ' +
                    'Payor_Details_New_Field_1__c, Payor_Details_Field1_Name__c, Payor_Details_New_Field_2__c, ' +
                    'Payor_Details_Field2_Name__c,Payor_Details_New_Field_3__c, Payor_Details_Field3_Name__c, ' +
                    'Claim_Deadlines_New_Field_1__c, Claim_Details_Field1_Name__c, Claim_Deadlines_New_Field_2__c, ' +
                    'Claim_Details_Field2_Name__c, Claim_Deadlines_New_Field_3__c, Claim_Details_Field3_Name__c, ' +
                    'Prior_Authorizations_New_Field_1__c, Prior_Details_Field1_Name__c, Prior_Authorizations_New_Field_2__c, ' +
                    'Prior_Details_Field2_Name__c, Prior_Authorizations_New_Field_3__c, Prior_Details_Field3_Name__c, ' +
                    'Lab_New_Field_1__c, Lab_Details_Field1_Name__c, Lab_New_Field_2__c, ' +
                    'Lab_Details_Field2_Name__c, Lab_New_Field_3__c, Lab_Details_Field3_Name__c,  ' +
                    'Payment_Basis_New_Field_1__c, Payment_Details_Field1_Name__c, Payment_Basis_New_Field_2__c, ' +
                    'Payment_Details_Field2_Name__c, Payment_Basis_New_Field_3__c, Payment_Details_Field3_Name__c, ' +
                    'Fee_Schedule_New_Field_1__c, Fee_Details_Field1_Name__c, Fee_Schedule_New_Field_2__c, ' +
                    'Fee_Details_Field2_Name__c, Fee_Schedule_New_Field_3__c, Fee_Details_Field3_Name__c, ' +
                    'Pharmacy_New_Field_1__c, Pharmacy_Details_Field1_Name__c, Pharmacy_New_Field_2__c, ' +
                    'Pharmacy_Details_Field2_Name__c, Pharmacy_New_Field_3__c, Pharmacy_Details_Field3_Name__c ' +
                    'FROM RuleFull__c WHERE Practice__c = ' + tempInputParent + ' AND ' + selectedField + ' LIKE ' + tempInputField + ' Order By Name_Of_Payor__c';
        
        	rules = database.query(SOQLQuery);

        }
        //For loop will only go through one practice, but for later possibilities, could print out multiple practices
        /*for(Practice__c p:[SELECT Name, Payor_Details_New_Field_1__c, Payor_Details_Field1_Name__c, Payor_Details_New_Field_2__c, 
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
                           FROM Practice__c WHERE Practice__c.Name = :practices.get(parentIndex).Name]) {
                               tableRows.add(new exportingTable(p, rules));
                           }
		*/
        setFilters();
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
    
    public PageReference returnToExportPage() {
		PageReference pr = Page.RPM_exportrules;
        pr.setRedirect(true);
        return pr;    
    }
}