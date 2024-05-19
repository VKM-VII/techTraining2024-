trigger AccountTrigger on Account (after insert) {
	List<PersonalDetail__c> personDetails = new List<PersonalDetail__c>();
    for(Account acc : Trigger.new){
        PersonalDetail__c detail = new PersonalDetail__c();
        detail.Name= acc.Name;
        detail.Phone__c= acc.Phone;
        detail.Description__c= acc.Description;
        detail.Email__c= acc.Email__c;
        detail.Account__c= acc.ParentId;
        personDetails.add(detail);
    }
        insert personDetails;
}