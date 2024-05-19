/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-14-2024
 * @last modified by  : vkm
**/
@RestResource(UrlMapping = '/Contacts/ContactServices/*')
Global with sharing class ContactWebService {
    @HttpGet
    global static Contact getContact(){
        String conId = RestContext.request.params.get('ID');
        return [Select Id,LastName from Contact WHERE Id = :conId];
    }
    @HttpPost
    global static Contact createContact(String lastname,String leadsource){
        Contact con = new Contact();
        con.LastName = lastname;
        con.LeadSource = leadsource;
        insert(con);
        return con;
    }

    @HttpPatch //updating existing record
    global static Contact updateContact(String id , String lastname,String leadsource){
        Contact con = [Select Id from Contact where Id=:id];
        con.LastName = lastname;
        con.LeadSource = leadsource;
        update con;
        return con;
    }  

    @HttpPut //
    global static Contact upsertContact(String lastname,String leadsource){
        RestRequest contactRequest = RestContext.request;
        String ContactRequestURI = ContactRequest.requestURI;
        String conId = ContactRequestURI.substring(ContactRequestURI.lastIndexof('/')+1);
        Contact con = new Contact();
        if(String.isNotEmpty(conId)){
            con.Id = conId;
        }
        con.LastName = lastname;
        con.LeadSource = leadsource;
        upsert con;
        return con;
    }  
}