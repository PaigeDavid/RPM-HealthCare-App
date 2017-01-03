public class RPM_AdminToolsController {
    
    public RPM_AdminToolsController() {}
    
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