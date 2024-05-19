@RestResource(urlMapping='/Account/*')
global with sharing class AccountWebServices {
	@HttpGet //Fetch Record
    global static Account getAccountbyId(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);
        try{
            Account acc = [SELECT Id, Name , Phone from Account where Id = :accountId];
            return acc;
        }
        catch(DMLException e){
            system.debug(e.getMessage());
            return null;
        }
        
    }
    
    global static List<Account> getAccountbyIds(){
        try{
            List<Account> accList = [Select Name, Phone from Account];
            return accList;
        }
        catch(DMLException e){
            system.debug(e.getMessage());
            return null;
        }
    }
}