trigger EmployeeTrigger on Employee__c (before delete) {
    if(Trigger.isBefore && Trigger.isDelete){
        EmployeeTriggerHandler.CheckEmployeeStatus(Trigger.Old);
    }
}