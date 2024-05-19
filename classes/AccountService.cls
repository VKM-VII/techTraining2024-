/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-14-2024
 * @last modified by  : vkm
**/
@RestResource(UrlMapping = '/Accounts/AccountServices/*')
Global with sharing class AccountService {
    @HttpGet
    global static Account getAccount(){
        String accId = RestContext.request.params.get('ID');
        return [Select Id,Name,Type from Account WHERE Id = :accId];
    }
    @HttpPost
    global static void createAccount(String name,String type,String industry){
        Account acc = new Account();
        acc.Name = name;
        acc.Type = type;
        acc.Industry = industry;
        insert(acc); 
        //return acc;
    }

    @HttpPatch //updating existing record
    global static void updateAccount(String id , String name,String type,String industry){
        Account acc = [Select Id from Account where Id=:id];
        acc.Name = name;
        acc.Type = type;
        acc.Industry = industry;
        update acc;
        //return acc;
    }  
}