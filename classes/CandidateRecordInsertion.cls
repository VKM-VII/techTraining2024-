/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-17-2024
 * @last modified by  : vkm
**/
public class CandidateRecordInsertion {
    public static void FirstMethod(String name , String Phone, String Email) {
        Candidate__c  cand = new Candidate__c(Name = name,Phone__c = Phone, Email__c=Email);
        insert cand;
        system.debug(name + ' ' + Phone + ' ' + Email);
        CallOutOrgAtoB.ConnectingOrg(name,Phone,Email);
    }
}