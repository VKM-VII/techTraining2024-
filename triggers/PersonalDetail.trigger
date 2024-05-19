trigger PersonalDetail on PersonalDetail__c (before update) {
    /*for(PersonalDetail__c oldRecord : Trigger.old){
        PersonalDetail__c newRecord =Trigger.newMap.get(oldRecord.Id);
        if(oldRecord.Phone__c != newRecord.Phone__c){
            System.debug('Phone is updated');
            newRecord.Description__c= 'Phone is updated old Email is '+ oldRecord.Phone__c;
        }
        else if(oldRecord.Email__c != newRecord.Email__c){
            System.debug('Email is updated');
            //PersonalDetail__c detail = new PersonalDetail__c();
            newRecord.Description__c='Email is updated old Email is '+ oldRecord.Email__c;
        }
    }
	*/
	List<PersonalDetail__c> recordsToUpdate = new List<PersonalDetail__c>();
    for(Id i : Trigger.oldMap.keyset()){
        PersonalDetail__c person = Trigger.newMap.get(i);
        if(Trigger.oldMap.get(i).Phone__c !=Trigger.newMap.get(i).Phone__c){
            person.Description__c = 'Phone Updated! old Phone no is ' + Trigger.oldMap.get(i).Phone__c;
        }
        if(Trigger.oldMap.get(i).Email__c !=Trigger.newMap.get(i).Email__c){
            person.Description__c = 'Email Updated! Old Email is ' + Trigger.oldMap.get(i).Email__c;
        }
    }    
}



/*
trigger PersonalDetail on PersonalDetail__c (after update) {
    List<PersonalDetail__c> recordsToUpdate = new List<PersonalDetail__c>();
    for (PersonalDetail__c oldRecord : Trigger.old) {
        PersonalDetail__c newRecord = Trigger.newMap.get(oldRecord.Id);
        if (oldRecord.Phone__c != newRecord.Phone__c) {
            PersonalDetail__c updatedRecord = new PersonalDetail__c(
                Id = newRecord.Id,
                Description__c = 'Phone is updated old Phone is ' + oldRecord.Phone__c
            );
            recordsToUpdate.add(updatedRecord);
        } 
        else if (oldRecord.Email__c != newRecord.Email__c) {
            PersonalDetail__c updatedRecord = new PersonalDetail__c(
                Id = newRecord.Id,
                Description__c = 'Email is updated old Email is ' + oldRecord.Email__c
            );
            recordsToUpdate.add(updatedRecord);
        }
    }
        update recordsToUpdate;
}
*/