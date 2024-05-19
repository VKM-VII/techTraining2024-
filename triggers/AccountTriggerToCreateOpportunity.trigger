/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-15-2024
 * @last modified by  : vkm
**/
trigger AccountTriggerToCreateOpportunity on Account (After insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        AccountTriggerToCreateOpportunityHandler.CreateOpportunity(Trigger.new);
    }
}