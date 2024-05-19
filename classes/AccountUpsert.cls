public class AccountUpsert {
    public static void AccountUpsert1(){
        List<Account> accList = [SELECT Name,Id,Country__c FROM Account];
        for(Account a : accList){
            a.Country__c = 'India';
        }
        
        Account newacc = new Account(Name='High Tech Inc', Country__c = 'India');
        accList.add(newacc);
		Database.UpsertResult[] upsertResults = Database.upsert(accList, Account.Id, false);        
    }
    public static void AccountDelete(){
		Contact con = [SELECT Name FROM Contact WHERE FirstName= 'Emily'  AND LastName ='Johnson'];
        delete con;
    }
    public static void AccountUndelete(){
        Contact con = [SELECT Name FROM Contact WHERE FirstName= 'Emily'  AND LastName ='Johnson' ALL ROWS];
        undelete con;
    }
}