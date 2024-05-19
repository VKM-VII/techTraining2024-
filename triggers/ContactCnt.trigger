trigger ContactCnt on Contact (after insert,after delete) {
    /*
    if (Trigger.isInsert) {
        ContactInsertedHandler.countContacts(Trigger.new);
    }
    else if (Trigger.isDelete) {
        ContactInsertedHandler.countContacts(Trigger.old);
    }
    */
    if (Trigger.isInsert) {
        ContactInsertedHandler.countContacts(Trigger.newMap);
    }
    else if (Trigger.isDelete) {
        ContactInsertedHandler.countContacts(Trigger.oldMap);
    }
    
}