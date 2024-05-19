/*public with sharing class DeveloperTriggerHandlder {
    public static void populateDeveloper(List<Developer__c> devList) {
        
        for(Developer__c dev : devList){
            dev.Organization__c= 'MIRKETA';
        }
		*/
        //Developer__c.Organization__c.getDescribe().getName();
        //String organizationFieldName = 'Organization__c';
        /*for(Developer__c dev : devList){
            dev.put('Organization__c', 'MIRKETA');
        }
		
         Schema.DescribeSObjectResult R = Opportunity.SObjectType.getDescribe();
        
        
		
        
    }
}
*/

public class DeveloperTriggerHandlder{
    public static void populateDeveloper(List<Developer__c> devList){
        Map<String, Schema.SObjectType> devMap = Schema.getGlobalDescribe();
        System.debug(devMap.get('Developer__c'));
        List<String> devListttt = new List<String>();
        devListttt.add('Developer__c');

        List<Schema.DescribeSObjectResult> developerObjResult = Schema.describeSObjects(devListttt);
        System.debug(developerObjResult[0].fields.getMap());
       
        Map<String, Schema.SObjectField> fieldMap = developerObjResult[0].fields.getMap();
        if (fieldMap.containsKey('Organization__c')) {
            for (Developer__c dev : devList) {
                dev.Organization__c = 'Mirketa'; 	
            } 
        //for(Developer__c dev: devList){
            //dev.Organisation__c = 'Mirketa';
        //}
        }
    }
}