public with sharing class EmployeeTriggerHandler {
    public static void CheckEmployeeStatus(List<Employee__c> oldList) {
        for(Employee__c emp : oldList){
            if(emp.active__c == true){
                emp.addError('Active Employee Cant be removed');
            }
        }
    }
}