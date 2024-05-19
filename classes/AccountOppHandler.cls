/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-13-2024
 * @last modified by  : vkm
**/
public with sharing class AccountOppHandler {
    public static void insertOpportunity(List<Account> accList) {
        List<Opportunity> opportunitiesToInsert = new List<Opportunity>();
        for (Account acc : accList) {
                Opportunity newOpp = new Opportunity();
                newOpp.Name = acc.Name;
                newOpp.AccountId = acc.Id;
                newOpp.StageName = 'Prospecting';
                newOpp.CloseDate = date.Today();
                opportunitiesToInsert.add(newOpp);
        }
        Database.insert(opportunitiesToInsert,False,AccessLevel.USER_MODE);
    }
}