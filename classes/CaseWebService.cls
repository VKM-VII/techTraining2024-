/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-14-2024
 * @last modified by  : vkm
**/
@RestResource(UrlMapping = '/Case/CaseServices/*')

global with sharing class CaseWebService {
    @HttpGet
    global static Case getCase(){
        String caseId = RestContext.request.params.get('ID');
        return [Select Id from Case WHERE Id = :caseId];
    }
    @HttpPost
    global static Case createCase(String status,String type,String origin){
        Case cas = new Case();
        cas.Status = status;
        cas.Type = type;
        cas.Origin = origin;
        insert(cas);
        return cas;
    }

    @HttpPatch //updating existing record
    global static Case updateCase(String id , String status,String type,String origin){
        Case cas = [Select Id from Case where Id=:id];
        cas.Status = status;
        cas.Type = type;
        cas.Origin = origin;
        update cas;
        return cas;
    }

    @HttpPut //Upsert
    global static Case UpsertCase(String status,String type,String origin){
        RestRequest contactRequest = RestContext.request;
        String ContactRequestURI = ContactRequest.requestURI;
        String caseId = ContactRequestURI.substring(ContactRequestURI.lastIndexof('/')+1);
        Case cas = new Case();
        if(String.isNotEmpty(caseId)){
            cas.Id = caseId;
        }
        cas.Status = status;
        cas.Type = type;
        cas.Origin =origin;
        upsert cas;
        return cas;
    }  
}