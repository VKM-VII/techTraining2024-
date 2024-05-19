/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-15-2024
 * @last modified by  : vkm
**/
public with sharing class WithSharingClass {
    @AuraEnabled
	public static Integer countAccounts() {
        return [Select Id, Name, Active__c from Account].size();
    }
    
    public static Integer performDML(List<Account> acc) {
        List<Contact> conList =new List<Contact>();
        for(Account a : acc){
            Contact c = new Contact();
            
            c.LastName = a.Name;
            conList.add(c);
        }
        system.debug(conList);
        insert conList;
        
        return conList.size();
    }
    
    @AuraEnabled
    //Changes
    // public static void performDML() {
    //     //CRUD, FLS are not enforced
    //     //Sharing rules are enforced
    //     //Account a = [Select Id from Account where Name = 'System Admin Created' LIMIT 1];
    //     List<Account> acc = [Select Name from Account where Name = 'System Admin Created' Limit 1];
    //     //system.debug(acc);
        
    //     //update acc;
    //     List<Contact> conList =new List<Contact>();
    //     for(Account a : acc){ 
    //         Contact c = new Contact();
    //         c.LastName = a.Name;
    //         conList.add(c);
    //     }
    //     system.debug(conList);
    //     insert conList;  
    // }

    public static Integer performDML() {
        //CRUD, FLS are not enforced
        //Sharing rules are enforced
        //Account a = [Select Id from Account where Name = 'System Admin Created' LIMIT 1];
        List<Account> acc = [Select Name from Account where Name = 'System Admin Created' Limit 1];
        List<Contact> conList =new List<Contact>();
        for(Account a : acc){ 
            Contact c = new Contact();
            c.AccountId = a.Id;
            c.LastName = a.Name;
            conList.add(c);
        }
        system.debug(conList);
        insert conList;
        return conList.size();
    }
    
    @AuraEnabled
    //Changes
    public static Integer performDMLWithoutSharing() {
        //CRUD, FLS are not enforced
        //Sharing rules are enforced
        //Account a = [Select Id from Account where Name = 'System Admin Created' LIMIT 1];
        List<Account> acc = [Select Name from Account where Name = 'Test User1' Limit 1];
        return WithoutSharingClass.performDML(acc);
    }
    
    @AuraEnabled
    public static Integer performDMLInheritedSharing() {
        //CRUD, FLS are not enforced 
        //Sharing rules are enforced
        return InheritedSharing.performDML();
    }
    
	@AuraEnabled
    public static String CRUD() {
        //Adding checks for CRUD
        if (Schema.SObjectType.Account.isAccessible()) {
            return 'Access Denied';
        } else {
            return 'Access Provided';
        }
    }
    
    @AuraEnabled
    public static String FLS() {
        //Adding Checks for FLS
        if (Schema.SObjectType.Account.fields.Name.isAccessible()) {
            return 'Access Denied';
        } else {
            return 'Access Provided';
        }
    }
    
    @AuraEnabled
    public static void stripInaccessibleSOQL() {
        //CRUD, FLS is enforced
        //Sharing rules are enforced
        SObjectAccessDecision securityDecision = Security.stripInaccessible(
                                         AccessType.READABLE, [Select id from Account]);
        System.debug(securityDecision.getRecords());
    }
    
    @AuraEnabled
    public static void stripInaccessibleDML() {
        //CRUD, FLS is enforced
        //Sharing rules are enforced
        List<Account> newAccounts = new List<Account>();
        Account a = new Account(Name='Acme Corporation');
        Account b = new Account(Name='Blaze Comics', Rating='Warm');
        newAccounts.add(a);
        newAccounts.add(b);
        
        SObjectAccessDecision securityDecision = Security.stripInaccessible(
            AccessType.CREATABLE, newAccounts);
        
        // No exceptions are thrown and no rating is set
        insert securityDecision.getRecords();
        
        System.debug(securityDecision.getRemovedFields().get('Account')); // Prints "Rating"
        System.debug(securityDecision.getModifiedIndexes()); // Prints "1"
    }
    
    @AuraEnabled
    public static void securityEnforcedSOQL() {
         //CRUD, FLS is enforced
         //Sharing rules are enforced
         System.debug([Select Id, Name, Active__c from Account WITH SECURITY_ENFORCED].size());
    }
    
    @AuraEnabled
    public static void withSecuirtyEnforcedAndWhereClause() {
         //CRUD, FLS is enforced
         //Sharing rules are enforced
         System.debug([Select Id, Name from Account where Rating = 'Warm' WITH SECURITY_ENFORCED].size());
    }
    
    @AuraEnabled
    public static void withUserModeAndWhereClause() {
         //CRUD, FLS and Sharing Rule is enforced
         System.debug([Select Id, Name from Account where Rating = 'Warm' WITH USER_MODE].size());
    }
    
    @AuraEnabled
    public static void performDMLWithUserMode() {
         Account a = [Select Id from Account where Name = 'System Admin Created' LIMIT 1];
         //CRUD, FLS and Sharing Rule is enforced
		 update as user a;
    }

}