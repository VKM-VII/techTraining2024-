/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-13-2024
 * @last modified by  : vkm
**/
public with sharing class AccountTriggerToCreateOpportunityHandler {
    public static void CreateOpportunity(List<Account> newList) {
        List<Opportunity> oppList = new List<Opportunity> ();
        Schema.DescribeSObjectResult opportunityDescribe = Opportunity.sObjectType.getDescribe();
        Boolean hasCreateAccess = opportunityDescribe.isCreateable();
        if(hasCreateAccess){
            for(Account acc : newList){
                Opportunity opp = new Opportunity();
                opp.AccountId = acc.Id;
                opp.Name = acc.Name;
                opp.CloseDate = Date.today();
                opp.StageName = 'Prospecting';
                oppList.add(opp);
            }
            insert oppList;
        }
    }
}