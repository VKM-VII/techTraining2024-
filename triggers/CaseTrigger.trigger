/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-13-2024
 * @last modified by  : vkm
**/
trigger CaseTrigger on Case (after insert) {
    List<New_Case_Entry__e> nceList = new  List<New_Case_Entry__e>();
    for(Case c : trigger.new){
        New_Case_Entry__e nce = new New_Case_Entry__e();
        nce.Status__c = 'New';
        nce.Case_Origin__c ='Phone';
        nceList.add(nce);
        //insert npe;
    }
    
    System.debug('--npeList'+nceList);
    List<Database.SaveResult> results = EventBus.publish(nceList);
}