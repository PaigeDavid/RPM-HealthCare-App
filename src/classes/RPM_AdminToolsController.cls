public class RPM_AdminToolsController {
    
    public RPM_AdminToolsController() {}
    
    public PageReference gotoHome() {
        PageReference pr = new pagereference('https://ap1.salesforce.com/home/home.jsp');
        pr.setRedirect(true);
        return pr;
    }
    
    public PageReference gotoImport()
    {
       PageReference pr = Page.RPM_enterRules;
       pr.setRedirect(true);
       return pr;
    }
    
    public PageReference gotoExport()
    {
       PageReference pr = Page.RPM_exportrules;
       pr.setRedirect(true);
       return pr;
    }
    
    public PageReference deleteAllRecords() {
        List<RuleFull__C> rules = [select id from RuleFull__c];
		delete rules;
		return null;
    }
}