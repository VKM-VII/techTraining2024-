/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-15-2024
 * @last modified by  : vkm
**/
public inherited sharing class InheritedSharing {
	public static Integer performDML() {
        //Account a = [Select Id from Account where Name = 'System Admin Created' LIMIT 1];
        //update a;
        List<Account> acc = [Select Name from Account where Name = 'B' Limit 1];
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
}