/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-13-2024
 * @last modified by  : vkm
**/
trigger AccountOpp on Account (After insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            AccountOppHandler.insertOpportunity(Trigger.new);
        }
    }

}