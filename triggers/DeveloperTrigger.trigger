trigger DeveloperTrigger on Developer__c (Before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        DeveloperTriggerHandlder.populateDeveloper(Trigger.new);
    }
}