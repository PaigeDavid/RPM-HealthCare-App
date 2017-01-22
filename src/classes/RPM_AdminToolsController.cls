public class RPM_AdminToolsController {
    public String selectedField{get;set;}
    public Boolean buttonsRendered{get;set;}
    public List<Practice__c> practices;
    public String displayedPracticeName{get;set;}
    public String newPracticeName{get;set;}
    
    public RPM_AdminToolsController() {
        selectedField = '0';
        buttonsRendered = false;
        practices = [Select name from Practice__c Order By Name];
        selectedField = ApexPages.currentPage().getParameters().get('selectedParent');
        if(!(String.isBlank(selectedField))) {
            enableButtons();
        }
    }
    
    public List<SelectOption> getFieldNames() {
        List<SelectOption> options = new List<SelectOption>();
        String choice;
        
        for(Integer i = 0; i < practices.size(); i++) {
            options.add(new SelectOption(String.valueOf(i), practices.get(i).Name));
        }
        
        return options;
    }
    
    public void createParent() {
        Practice__c newPractice = new Practice__c();
        if(String.isBlank(newPracticeName))
            newPracticeName = 'Must Enter a value';
        else {
        	newPractice.Name = newPracticeName;
            try {
                insert newPractice;
                newPracticeName='';
            } catch(DMLException e) {
                System.debug('An unexpected error has occurred: ' + e.getMessage());
            }
            practices = [Select name from Practice__c Order By Name];
        }
    }
    
    public void enableButtons() {
        Integer practiceIndex = Integer.valueOf(selectedField);
        displayedPracticeName = practices.get(practiceIndex).Name;
        buttonsRendered = !buttonsRendered;
    }
    
    public PageReference gotoHome() {
        PageReference pr = new pagereference('https://ap1.salesforce.com/home/home.jsp');
        pr.setRedirect(true);
        return pr;
    }
    
    public PageReference gotoImport()
    {
        String url = '/apex/RPM_enterRules?selectedParent=' + selectedField;
        PageReference pageRef = new PageReference(url);
        pageRef.setRedirect(true);
        return pageRef;
    }
    
    public PageReference gotoExport()
    {
        String url = '/apex/RPM_exportRules?selectedParent=' + selectedField;
        PageReference pageRef = new PageReference(url);
        pageRef.setRedirect(true);
        return pageRef;
    }
    
    public PageReference deleteAllRecords() {
        List<RuleFull__C> rules = [select id from RuleFull__c];
		delete rules;
		return null;
    }
}