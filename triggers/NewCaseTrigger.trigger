/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-13-2024
 * @last modified by  : vkm
**/
trigger NewCaseTrigger on New_Case_Entry__e (after insert) {
    List<Case> nceList = new  List<Case>();
    for(New_Case_Entry__e c : trigger.new){
        Case nce = new Case();
        nce.Status = 'New';
        nce.Origin ='Phone';
        nceList.add(nce);
        //insert npe;
    }
    
    System.debug(nceList);
}