public class ContactInsertedHandler {
    public static void countContacts(Map<Id,Contact> newCon){
        /*
        Set<Id> accountIds = new Set<Id>();
        Map<Id, Integer> accountContactCount = new Map<Id, Integer>(); //current count of contact from query
        for (Contact con : contact) {
            accountIds.add(con.AccountId);
        }
        
        for (AggregateResult ar : [SELECT AccountId, COUNT(Id) contactCount FROM Contact WHERE AccountId IN :accountIds GROUP BY AccountId]) {
        	accountContactCount.put((Id)ar.get('AccountId'), (Integer)ar.get('contactCount'));
        }
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accountId : accountIds) {
            Integer contactCount = 0;
            if (accountContactCount.containsKey(accountId)) {
                contactCount = accountContactCount.get(accountId);
            }
            accountsToUpdate.add(new Account(Id = accountId, No_of_Contacts__c = contactCount));
        }
		
        update accountsToUpdate;
		*/
        Set<Id> accId = new Set<Id>();
        for (Id con : newCon.keySet()) {
            accId.add(newCon.get(con).AccountId);
        }
    
        Map<Id, Integer> contactCount = new Map<Id, Integer>();
        for (AggregateResult aggContact : [SELECT AccountId, COUNT(Id) NoOfCon FROM Contact WHERE AccountId IN :accId GROUP BY AccountId])
        {
            contactCount.put((Id)aggContact.get('AccountId'), (Integer)aggContact.get('NoOfCon'));
        }
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accountId : accId) {
            Integer contactCnt = 0;
            if (contactCount.containsKey(accountId)) {
                contactCnt = contactCount.get(accountId);
            }
            accountsToUpdate.add(new Account(Id = accountId, No_of_Contacts__c = contactCnt));
        }
		
        update accountsToUpdate;
        }
}