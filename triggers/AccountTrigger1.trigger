trigger AccountTrigger1 on Account (before insert) {
    if(Trigger.isInsert){
        AccountTriggerHandler.beforeInsert(Trigger.new);
    }
}